package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Book;

public class BookDao {
	private static BookDao instance;

	private BookDao() {

	}

	public static BookDao getInstance() {
		if (instance == null)
			instance = new BookDao();
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

	public int managerCheck(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select managerpasswd from manager where managerid = ?";
		int result = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
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

	public int insertBook(Book book) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into book values(book_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			pstmt.setString(++i, book.getBook_kind());
			pstmt.setString(++i, book.getBook_title());
			pstmt.setInt(++i, book.getBook_price());
			pstmt.setInt(++i, book.getBook_count());
			pstmt.setString(++i, book.getAuthor());
			pstmt.setString(++i, book.getPublishing_com());
			pstmt.setString(++i, book.getPublishing_date());
			pstmt.setString(++i, book.getBook_image());
			pstmt.setString(++i, book.getBook_content());
			pstmt.setInt(++i, book.getDiscount_rate());
			pstmt.setDate(++i, book.getReg_date());

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

	public int getBookCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from book");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return count;
	}

	public ArrayList<Book> getBooks(String book_kind) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Book> bookList = null;
		String sql1 = "select * from book order by reg_date desc";
		String sql2 = "select * from book where book_kind = ? order by reg_date desc";
		try {
			conn = getConnection();
			if (book_kind.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, book_kind);
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bookList = new ArrayList<Book>();
				do {
					Book book = new Book();
					book.setBook_id(rs.getInt("book_id"));
					book.setBook_kind(rs.getString("book_kind"));
					book.setBook_title(rs.getString("book_title"));
					book.setBook_price(rs.getInt("book_price"));
					book.setBook_count(rs.getInt("book_count"));
					book.setAuthor(rs.getString("author"));
					book.setPublishing_com(rs.getString("publishing_com"));
					book.setPublishing_date(rs.getString("publishing_date"));
					book.setBook_image(rs.getString("book_image"));
					book.setDiscount_rate(rs.getInt("discount_rate"));
					book.setReg_date(rs.getDate("reg_date"));

					bookList.add(book);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return bookList;
	}
}