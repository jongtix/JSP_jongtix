package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Cart;

public class CartDao {
	private static CartDao instance;

	public CartDao() {
	}

	public static CartDao getInstance() {
		if (instance == null) {
			instance = new CartDao();
		}
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}

	public int insertCart(Cart cart, String buyer) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from cart where buyer = ? and book_id = ?";
		String sql2 = "update cart set buy_count = buy_count+? where buyer = ? and book_id = ?";
		String sql3 = "insert into cart values(cart_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, buyer);
			pstmt.setInt(2, cart.getBook_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0) {
					pstmt = conn.prepareStatement(sql2);
					int i = 0;
					pstmt.setInt(++i, cart.getBuy_count());
					pstmt.setString(++i, cart.getBuyer());
					pstmt.setInt(++i, cart.getBook_id());

					result = pstmt.executeUpdate();
				} else {
					pstmt = conn.prepareStatement(sql3);
					int i = 0;
					pstmt.setString(++i, cart.getBuyer());
					pstmt.setInt(++i, cart.getBook_id());
					pstmt.setString(++i, cart.getBook_title());
					pstmt.setInt(++i, cart.getBuy_price());
					pstmt.setInt(++i, cart.getBuy_count());
					pstmt.setString(++i, cart.getBook_image());

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

	public int getListCount(String buyer) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from cart where buyer = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyer);
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

	public ArrayList<Cart> getCartList(String buyer) {
		ArrayList<Cart> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart where buyer = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyer);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart();
				int i = 0;
				cart.setCart_id(rs.getInt(++i));
				cart.setBuyer(rs.getString(++i));
				cart.setBook_id(rs.getInt(++i));
				cart.setBook_title(rs.getString(++i));
				cart.setBuy_price(rs.getInt(++i));
				cart.setBuy_count(rs.getInt(++i));
				cart.setBook_image(rs.getString(++i));

				list.add(cart);
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

	public int updateCount(int cart_id, int buy_count) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "select book.book_count from book, cart where book.book_id = cart.book_id and cart.cart_id = ?";
		String sql2 = "update cart set buy_count = ? where cart_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, cart_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (buy_count > rs.getInt(1)) {
					result = -1;
				} else {
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, buy_count);
					pstmt.setInt(2, cart_id);
					result = pstmt.executeUpdate();
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

	public int deleteAll(String buyer) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete cart where buyer = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyer);
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

	public int deleteCart(int list) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from cart where cart_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, list);
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
