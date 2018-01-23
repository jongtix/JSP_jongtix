package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		String sql1 = "select count(*) from board";
		String sql2 = "insert into board(num, writer, subject, content, email, readcount, password, ref, re_step, ref_level, ip, reg_date) values(?, ?, ?, ?, ?, 0, ?, ?, ?, ?, ?, sysdate)";
		String sql3 = "update board set re_step = re_step + 1 where ref = ? and re_step > ?";
		int num = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			System.out.println("1");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
			pstmt.close();
			if (num == 0) {
				board.setRef(num);
			} else {
				pstmt = conn.prepareStatement(sql3);
				int i = 0;
				pstmt.setInt(++i, board.getRef());
				pstmt.setInt(++i, board.getRe_step());

				result = pstmt.executeUpdate();
				pstmt.close();

				board.setRef_level(board.getRef_level() + 1);
				board.setRe_step(board.getRe_step() + 1);
			}

			pstmt = conn.prepareStatement(sql2);
			int i = 0;
			pstmt.setInt(++i, num);
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
		System.out.println("result = " + result);
		return result;
	}
}
