package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.sql.DataSource;

import model.Member;
import util.Connections;

public class MemberDao1 {
	Connection conn = null;

	private Connection getConnection() {
		DataSource ds = null;
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}// getConnection()메소드 끝.

	// 회원체크 메소드
	public int userCheck(String id, String password) {
		int result = 2;// 정상1, 패스워드 이상0, 아이디 없을 때 2
		PreparedStatement pstmt = null;
		String sql = "select password from member2 where id=? and use_flag = '0'";
		Connection conn = null;
		try {
			// conn = Connections.getInstance().getConnection();
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbpass = rs.getString(1);
				if (password.equals(dbpass))
					result = 1;// 정상1
				else
					result = 0;// 패스워드 이상0
			} else
				result = 2;// 아이디 없을 때 2
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

	public int userCheck(String id) {
		int result = 2;// 정상1, 아이디 없을 때 2
		PreparedStatement pstmt = null;
		String sql = "select count(*) from member2 where id=?";
		Connection conn = null;
		try {
			// conn = Connections.getInstance().getConnection();
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					result = 1;
				} else {
					result = 2;
				}
			}
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

	public int emailCheck(String email) {
		int result = 2;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from member2 where email = ?";
		try {
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					result = 2;
				} else {
					result = 1;
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

	public int insertMember(Member member) {
		int result = 0;
		// 연결 얻기
		// Connection conn = Connections.getInstance().getConnection();
		conn = getConnection();

		PreparedStatement pstmt = null;
		String sql = "insert into member2(id, password, name, birth, zipno, address1, address2, tel, email) "
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			// Autocommit disable;
			conn.setAutoCommit(false);
			// 3단계 - 1.쿼리 객체 설정
			pstmt = conn.prepareStatement(sql);// 기본 정보 저장
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getZipno());
			pstmt.setString(6, member.getAddress1());
			pstmt.setString(7, member.getAddress2());
			pstmt.setString(8, member.getTel());
			pstmt.setString(9, member.getEmail());

			result = pstmt.executeUpdate();// 기본 정보 저장 처리
			if (result > 0) {
				conn.commit();// DB에 저장 처리
			}
			System.out.println(result);
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
			}
			System.out.print(e.getMessage());
		} finally {
			try {
				conn.setAutoCommit(true);// 예외 방생과 상관없이 처리
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
		}
		return result;
	}// inserMember()메소드 끝.

	public List<Member> getMemberList() {
		List<Member> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member2 where use_flag = '0' order by id";
		try {
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				int i = 0;
				member.setId(rs.getString(++i));
				member.setPassword(rs.getString(++i));
				member.setName(rs.getString(++i));
				member.setBirth(rs.getString(++i));
				member.setZipno(rs.getString(++i));
				member.setAddress1(rs.getString(++i));
				member.setAddress2(rs.getString(++i));
				member.setTel(rs.getString(++i));
				member.setEmail(rs.getString(++i));
				member.setRegdate(rs.getDate(++i));
				list.add(member);
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

	public Member selectMemberInfo(String memberId) {
		Member member = new Member();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member2 where id = ? and use_flag = '0'";
		try {
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int i = 0;
				member.setId(rs.getString(++i));
				member.setPassword(rs.getString(++i));
				member.setName(rs.getString(++i));
				member.setBirth(rs.getString(++i));
				member.setZipno(rs.getString(++i));
				member.setAddress1(rs.getString(++i));
				member.setAddress2(rs.getString(++i));
				member.setTel(rs.getString(++i));
				member.setEmail(rs.getString(++i));
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
		return member;
	}

	public int updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member2 set name=?, birth=?, zipno=?, address1=?, address2=?, tel=?, email=? where id=?";
		int result = 0;
		try {
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			pstmt.setString(++i, member.getName());
			pstmt.setString(++i, member.getBirth());
			pstmt.setString(++i, member.getZipno());
			pstmt.setString(++i, member.getAddress1());
			pstmt.setString(++i, member.getAddress2());
			pstmt.setString(++i, member.getTel());
			pstmt.setString(++i, member.getEmail());
			pstmt.setString(++i, member.getId());
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

	public int deleteMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member2 set use_flag = '1' where id=?";
		int result = 0;
		try {
			conn = Connections.getInstance().getConnections();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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