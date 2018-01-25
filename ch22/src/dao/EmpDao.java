package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Emp;
import dto.Emp2;

public class EmpDao {
	private static EmpDao instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	private EmpDao() {

	}

	public static EmpDao getInstance() {
		if (instance == null)
			instance = new EmpDao();
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

	public List<String> selectJob() {
		List<String> list = new ArrayList<>();
		try {
			conn = getConnection();
			sql = "select distinct job from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
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

	public List<Emp> selectEmpList(String job) {
		List<Emp> list = new ArrayList<>();
		try {
			conn = getConnection();
			if (job.equals("all")) {
				sql = "select * from emp order by empno";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "select * from emp where job = ? order by empno";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, job);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Emp e = new Emp();
				int i = 0;
				e.setEmpno(rs.getInt(++i));
				e.setEname(rs.getString(++i));
				e.setJob(rs.getString(++i));
				e.setMgr(rs.getInt(++i));
				e.setHiredate(rs.getDate(++i));
				e.setSal(rs.getInt(++i));
				e.setComm(rs.getInt(++i));
				e.setDeptno(rs.getInt(++i));

				list.add(e);
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

	public List<Emp2> selectJson(String job) {
		List<Emp2> list = new ArrayList<>();
		try {
			conn = getConnection();
			if (job.equals("all")) {
				sql = "select * from emp order by empno";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "select * from emp where job = ? order by empno";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, job);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Emp2 e = new Emp2();
				int i = 0;
				e.setEmpno(rs.getString(++i));
				e.setEname(rs.getString(++i));
				e.setJob(rs.getString(++i));
				e.setMgr(rs.getString(++i));
				e.setHiredate(rs.getString(++i));
				e.setSal(rs.getString(++i));
				e.setComm(rs.getString(++i));
				e.setDeptno(rs.getString(++i));

				list.add(e);
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
}
