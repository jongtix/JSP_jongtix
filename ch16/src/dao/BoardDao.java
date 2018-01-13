package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Board;
import model.FavorBean;

public class BoardDao {
	private static BoardDao instance;
	private static Connection conn;

	/* 싱글톤 만들기 */
	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}

	public Connection getConnection() {
		conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int getBoardCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board";
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return count;
	}

	public List<Board> getBoards(int startRow, int endRow) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from " + "(select rownum rn, a.* from "
				+ "(select * from board order by ref desc, re_step asc) a) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				int i = 1;
				board.setNumber(rs.getInt(++i));
				board.setWriter(rs.getString(++i));
				board.setSubject(rs.getString(++i));
				board.setContent(rs.getString(++i));
				board.setEmail(rs.getString(++i));
				board.setReadcount(rs.getInt(++i));
				board.setPassword(rs.getString(++i));
				board.setRef(rs.getInt(++i));
				board.setRe_step(rs.getInt(++i));
				board.setRe_level(rs.getInt(++i));
				board.setIp(rs.getString(++i));
				board.setReg_date(rs.getDate(++i));
				list.add(board);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return list;
	}

	public int insert(Board board) {
		int result = 0;
		int number = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select max(num) from board";
		String sql2 = "insert into board(num, writer, subject, content, email, readcount, password, ref, re_step, re_level, ip, reg_date) "
				+ "values(?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, sysdate)";
		String sql3 = "update board set re_step = re_step + 1 where ref = ? and re_step > ?"; // 읽은 글의 re_step보다 큰 것들만 +
																								// 1
		int num = board.getNumber();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt(1);
				number += 1; // 새로운 글번호
				pstmt.close();
				if (num != 0) { // 답변글일 경우
					pstmt = conn.prepareStatement(sql3);
					int i = 0;
					pstmt.setInt(++i, board.getRef());
					pstmt.setInt(++i, board.getRe_step());
					pstmt.executeUpdate();
					pstmt.close();
					board.setRe_level(board.getRe_level() + 1);
					board.setRe_step(board.getRe_step() + 1);
				} else if (num == 0) { // 답변글이 아닐 경우
					board.setRef(number);
				}
				pstmt = conn.prepareStatement(sql2);
				int i = 0;
				pstmt.setInt(++i, number);
				pstmt.setString(++i, board.getWriter());
				pstmt.setString(++i, board.getSubject());
				pstmt.setString(++i, board.getContent());
				pstmt.setString(++i, board.getEmail());
				pstmt.setString(++i, board.getPassword());
				pstmt.setInt(++i, board.getRef());
				pstmt.setInt(++i, board.getRe_step());
				pstmt.setInt(++i, board.getRe_level());
				pstmt.setString(++i, board.getIp());
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	public int updateBoard(Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "update board set subject = ?, email = ?, content = ? where num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNumber());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
		return result;
	}

	public Board getBoard(int num) {
		Board board = new Board();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num = ?";
		try {
			updateCount(num);
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int i = 0;
				board.setNumber(rs.getInt(++i));
				board.setWriter(rs.getString(++i));
				board.setSubject(rs.getString(++i));
				board.setContent(rs.getString(++i));
				board.setEmail(rs.getString(++i));
				board.setReadcount(rs.getInt(++i));
				board.setPassword(rs.getString(++i));
				board.setRef(rs.getInt(++i));
				board.setRe_step(rs.getInt(++i));
				board.setRe_level(rs.getInt(++i));
				board.setIp(rs.getString(++i));
				board.setReg_date(rs.getDate(++i));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return board;
	}

	public void updateCount(int num) {
		PreparedStatement pstmt = null;
		String sql = "update board set readcount = readcount + 1 where num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public int useCheck(int num, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from board where num = ?";
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password))
					result = 1;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// 게시글 삭제 메소드
	/* 게시글 삭제시 삭제 trigger 실행, board_history 테이블에 저장 */
	public int deleteBoard(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from board where num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	public boolean isReply(int num) {
		boolean isTrue = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board where ref = ? and num != ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					isTrue = true; // 댓글 존재
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isTrue;
	}

	public int updateFavor(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from favor where num = ?";
		String sql2 = "insert into favor(num, favorcnt, hatecnt) values(?, 1, 0)";
		String sql3 = "update favor set favorcnt = favorcnt + 1 where num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0) { // 이미 있음
					pstmt = conn.prepareStatement(sql3);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				} else { // 없음
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	public int updateHate(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from favor where num = ?";
		String sql2 = "insert into favor(num, favorcnt, hatecnt) values(?, 0, 1)";
		String sql3 = "update favor set hatecnt = hatecnt + 1 where num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0) { // 이미 있음
					pstmt = conn.prepareStatement(sql3);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				} else { // 없음
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	public FavorBean getFavor(int num) {
		FavorBean favor = new FavorBean();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select nvl(num, ?) num, nvl(favorcnt, 0) favorcnt, nvl(hatecnt, 0) hatecnt from favor where num = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				favor.setNum(rs.getInt(1));
				favor.setFavorcnt(rs.getInt(2));
				favor.setHatecnt(rs.getInt(3));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return favor;
	}
}