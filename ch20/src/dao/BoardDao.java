package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Board;

public class BoardDao {
	private static BoardDao instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private BoardDao() {

	}

	public static BoardDao getInstance() {
		if (instance == null)
			instance = new BoardDao();
		return instance;
	}

	private Connection getConnection() {
		Context init = null;
		DataSource ds = null;
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int insert(Board board) {
		int result = 0;
		int number = 0;
		String sql1 = "select max(num) from board";
		String sql2 = "insert into board(num, writer, subject, content, email, readcount, password, ref, re_step, ref_level, ip, reg_date) "
				+ "values(?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, sysdate)";
		String sql3 = "update board set re_step = re_step + 1 where ref = ? and re_step > ?"; // 읽은 글의 re_step보다 큰 것들만 +
																								// 1
		int num = board.getNum();
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
					board.setRef_level(board.getRef_level() + 1);
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
				pstmt.setInt(++i, board.getRef_level());
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

		/*
		 * int result = 0; String sql1 = "select max(num) from board"; String sql2 =
		 * "insert into board(num, writer, subject, content, email, readcount, password, ref, re_step, ref_level, ip, reg_date) values(?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, sysdate)"
		 * ; String sql3 =
		 * "update board set re_step = re_step + 1 where ref = ? and re_step > ?"; int
		 * num = board.getNum(); int newNum = 0; try { conn = getConnection(); pstmt =
		 * conn.prepareStatement(sql1); rs = pstmt.executeQuery(); if (rs.next()) {
		 * newNum = rs.getInt(1) + 1; } pstmt.close(); if (num == 0) { // 답변 아닐 때
		 * board.setRef(num); } else { // 답변일 때 pstmt = conn.prepareStatement(sql3); int
		 * i = 0; pstmt.setInt(++i, board.getRef()); pstmt.setInt(++i,
		 * board.getRe_step());
		 * 
		 * result = pstmt.executeUpdate(); pstmt.close();
		 * 
		 * board.setRef_level(board.getRef_level() + 1);
		 * board.setRe_step(board.getRe_step() + 1); }
		 * 
		 * pstmt = conn.prepareStatement(sql2); int i = 0; pstmt.setInt(++i, newNum);
		 * pstmt.setString(++i, board.getWriter()); pstmt.setString(++i,
		 * board.getSubject()); pstmt.setString(++i, board.getContent());
		 * pstmt.setString(++i, board.getEmail()); pstmt.setString(++i,
		 * board.getPassword()); pstmt.setInt(++i, board.getRef()); pstmt.setInt(++i,
		 * board.getRe_step()); pstmt.setInt(++i, board.getRef_level());
		 * pstmt.setString(++i, board.getIp());
		 * 
		 * result = pstmt.executeUpdate(); } catch (Exception e) {
		 * System.out.println(e.getMessage()); } finally { try { if (pstmt != null)
		 * pstmt.close(); if (conn != null) conn.close(); } catch (Exception e) {
		 * System.out.println(e.getMessage()); } } return result;
		 */
	}

	public int getTotal() {
		int total = 0;
		String sql = "select count(*) from board";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
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
		return total;
	}

	public List<Board> selectList(int startRow, int endRow) {
		List<Board> list = new ArrayList<>();
		String sql = "select * from (select rownum rn, a.* from (select * from board where del != 'Y' order by ref desc, re_step) a) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				int i = 1;
				b.setNum(rs.getInt(++i));
				b.setWriter(rs.getString(++i));
				b.setSubject(rs.getString(++i));
				b.setContent(rs.getString(++i));
				b.setEmail(rs.getString(++i));
				b.setReadcount(rs.getInt(++i));
				b.setPassword(rs.getString(++i));
				b.setRef(rs.getInt(++i));
				b.setRe_step(rs.getInt(++i));
				b.setRef_level(rs.getInt(++i));
				b.setIp(rs.getString(++i));
				b.setReg_date(rs.getDate(++i));
				b.setDel(rs.getString(++i));

				list.add(b);
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

	public void updateReadCount(int num) {
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

	public Board getBoard(int num) {
		Board board = new Board();
		String sql = "select * from board where num = ? and del != 'Y'";
		try {
			updateReadCount(num);
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int i = 0;
				board.setNum(rs.getInt(++i));
				board.setWriter(rs.getString(++i));
				board.setSubject(rs.getString(++i));
				board.setContent(rs.getString(++i));
				board.setEmail(rs.getString(++i));
				board.setReadcount(rs.getInt(++i));
				board.setPassword(rs.getString(++i));
				board.setRef(rs.getInt(++i));
				board.setRe_step(rs.getInt(++i));
				board.setRef_level(rs.getInt(++i));
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
			pstmt.setInt(4, board.getNum());

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

	public int useCheck(int num, String password) {
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

	public int deleteBoard(int num) {
		int result = 0;
		String sql = "update board set del = 'Y' where num = ?";

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
}
