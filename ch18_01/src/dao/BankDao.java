package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BankDao {
	private static BankDao instance;

	private BankDao() {

	}

	public static BankDao getInstance() {
		if (instance == null)
			instance = new BankDao();
		return instance;
	}

	public Connection getConnection() {
		Connection conn = null;
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
}