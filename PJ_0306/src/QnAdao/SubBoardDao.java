package QnAdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import QnAdto.Board;
import QnAdto.SubBoard;

public class SubBoardDao {
	private static SubBoardDao instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	private SubBoardDao() {

	}

	public static SubBoardDao getInstance() {
		if (instance == null)
			instance = new SubBoardDao();
		return instance;
	}

	private Connection getConnection() {
		Context init = null;
		DataSource ds = null;
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	/* 댓글 수 */
	public int getSubBoardTotal(int ref) {
		int total = 0;
		try {
			conn = getConnection();
			sql = "select count(*) from pj_sub_board where ref = ? and del != 'Y'";
			// ref가 글 번호와 일치하고 지워지지 않은 댓글 선택
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
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

	public List<SubBoard> selectSubBoardList(int num, int startRow, int endRow) {
		List<SubBoard> subList = new ArrayList<>();
		try {
			conn = getConnection();
			sql = "select * from (select rownum rn, a.* from (select * from pj_sub_board where ref = ? and del != 'Y' order by sub_num desc) a) where rn between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SubBoard s = new SubBoard();
				int i = 1;
				s.setSub_num(rs.getInt(++i));
				s.setSub_writer(rs.getString(++i));
				s.setSub_content(rs.getString(++i));
				s.setSub_password(rs.getString(++i));
				s.setRef(rs.getInt(++i));
				s.setReg_date(rs.getDate(++i));
				s.setDel(rs.getString(++i));

				subList.add(s);
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
		return subList;
	}

	public int insertSubBoard(SubBoard subBoard) {
		int result = 0;
		try {
			conn = getConnection();
			sql = "select max(sub_num) from pj_sub_board";
			// 게시판에서 가장 큰 글번호
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int number = rs.getInt(1) + 1;
				pstmt.close();

				sql = "insert into pj_sub_board values(?, ?, ?, ?, ?, sysdate, 'N')";
				pstmt = conn.prepareStatement(sql);
				int i = 0;
				pstmt.setInt(++i, number);
				pstmt.setString(++i, subBoard.getSub_writer());
				pstmt.setString(++i, subBoard.getSub_content());
				pstmt.setString(++i, subBoard.getSub_password());
				pstmt.setInt(++i, subBoard.getRef());

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

	public int useCheck(int sub_num, String sub_password) {
		int result = 0;
		try {
			conn = getConnection();
			sql = "select SUB_PASSWORD from pj_sub_board where sub_num = ?";
			// 게시판의 글쓴이 비밀번호 선택
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sub_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(sub_password)) // 확인
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

	public int deleteSubBoard(int sub_num) {
		int result = 0;
		try {
			conn = getConnection();
			sql = "update pj_sub_board set del = 'Y' where sub_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sub_num);
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
}
