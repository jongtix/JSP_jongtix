package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Member;

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		DataSource ds = null;
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int insertMember(Member member) {
		Connection conn = null;
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into pj_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			pstmt.setString(++i, member.getId());
			pstmt.setString(++i, member.getPassword());
			pstmt.setString(++i, member.getName());
			pstmt.setString(++i, member.getRrnum1());
			pstmt.setString(++i, member.getRrnum2());
			pstmt.setString(++i, member.getZipno());
			pstmt.setString(++i, member.getAddress1());
			pstmt.setString(++i, member.getAddress2());
			pstmt.setString(++i, member.getTel1());
			pstmt.setString(++i, member.getTel2());
			pstmt.setString(++i, member.getTel3());
			pstmt.setString(++i, member.getEmail());
			pstmt.setDate(++i, member.getRegdate());
			pstmt.setString(++i, String.valueOf(member.getUse_flag()));
			pstmt.setString(++i, String.valueOf(member.getManager_flag()));

			result = pstmt.executeUpdate();//
			conn.commit();// 정상인 경우 db에 저장
			conn.close();
		} catch (Exception e) {// 비정상인 경우 rollback;
			try {
				conn.rollback();
			} catch (SQLException e1) {
			}
			System.out.println(e.getMessage());
		} finally {
			try {
				conn.setAutoCommit(true);// 자동 저장 기능 활성화
				pstmt.close();
				conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
}
