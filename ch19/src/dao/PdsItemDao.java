package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.PdsItem;

public class PdsItemDao {
	private static PdsItemDao instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	private PdsItemDao() {

	}

	public static PdsItemDao getInstance() {
		if (instance == null)
			instance = new PdsItemDao();
		return instance;
	}

	public Connection getConnection() {
		conn = null;
		DataSource ds = null;
		Context ctx = null;
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int insert(PdsItem pi) {
		int result = 0;
		String idSql = "select nvl(max(id), 0) + 1 from pdsitem";
		String sql = "insert into pdsitem values(?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(idSql);
			rs = pstmt.executeQuery();
			int id = 0;
			if (rs.next())
				id = rs.getInt(1);
			pstmt.close();

			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			pstmt.setInt(++i, id);
			pstmt.setString(++i, pi.getFilename());
			pstmt.setLong(++i, pi.getFilesize());
			pstmt.setString(++i, pi.getDescription());
			result = pstmt.executeUpdate();
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

	public List<PdsItem> selectAll() {
		List<PdsItem> list = new ArrayList<>();
		String sql = "select * from pdsitem order by id";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PdsItem pi = new PdsItem();
				int i = 0;
				pi.setId(rs.getInt(++i));
				pi.setFilename(rs.getString(++i));
				pi.setFilesize(rs.getLong(++i));
				pi.setDescription(rs.getString(++i));

				list.add(pi);
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
