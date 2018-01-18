package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Bank;
import model.Buy;
import model.Cart;

public class BuyDao {
	private static BuyDao instance;

	private BuyDao() {

	}

	public static BuyDao getInstance() {
		if (instance == null)
			instance = new BuyDao();
		return instance;
	}

	public Connection getConection() throws Exception {
		Connection conn = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		return conn;
	}

	public ArrayList<Bank> getAccount() {
		ArrayList<Bank> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bank order by account";
		try {
			conn = getConection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bank bank = new Bank();
				int i = 0;
				bank.setAccount(rs.getString(++i));
				bank.setBank(rs.getString(++i));
				bank.setName(rs.getString(++i));

				list.add(bank);
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

	public int insertBuy(ArrayList<Cart> list, Buy buy) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String buySql = "insert into buy(buy_id, buyer, book_id, book_title, buy_price, buy_count, book_image, buy_date, account, deliveryname, deliverytel, deliveryaddress) values(buy_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?)";
		String bookCountSql = "select book_count from book where book_id = ?";
		String bookCountUpSql = "update book set book_count = ? where book_id = ?";
		String delCartSql = "delete from cart where buyer = ?";
		try {
			conn = getConection();
			conn.setAutoCommit(false);
			for (int i = 0; i < list.size(); i++) {
				pstmt = conn.prepareStatement(buySql);
				int j = 0;
				pstmt.setString(++j, buy.getBuyer());
				pstmt.setInt(++j, list.get(i).getBook_id());
				pstmt.setString(++j, list.get(i).getBook_title());
				pstmt.setInt(++j, list.get(i).getBuy_price());
				pstmt.setInt(++j, list.get(i).getBuy_count());
				pstmt.setString(++j, list.get(i).getBook_image());
				pstmt.setString(++j, buy.getAccount());
				pstmt.setString(++j, buy.getDeliveryname());
				pstmt.setString(++j, buy.getDeliverytel());
				pstmt.setString(++j, buy.getDeliveryaddress());
				pstmt.executeUpdate();

				pstmt.close();
				pstmt = conn.prepareStatement(bookCountSql);
				pstmt.setInt(1, list.get(i).getBook_id());
				rs = pstmt.executeQuery();
				int qty = 0;
				if (rs.next()) {
					qty = rs.getInt(1);
				}
				pstmt = conn.prepareStatement(bookCountUpSql);
				pstmt.setInt(1, qty - list.get(i).getBuy_count());
				pstmt.setInt(2, list.get(i).getBook_id());
				pstmt.executeUpdate();
				pstmt.close();
			}
			pstmt = conn.prepareStatement(delCartSql);
			pstmt.setString(1, buy.getBuyer());
			result = pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
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

	public int getBuyListCount(String buyer) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from buy where buyer = ?";
		try {
			conn = getConection();
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

	public ArrayList<Buy> getBuyList(String buyer) {
		ArrayList<Buy> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from buy where buyer = ?";
		try {
			conn = getConection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyer);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int i = 0;
				Buy buy = new Buy();
				buy.setBuy_id(rs.getInt(++i));
				buy.setBuyer(rs.getString(++i));
				buy.setBook_id(rs.getInt(++i));
				buy.setBook_title(rs.getString(++i));
				buy.setBuy_price(rs.getInt(++i));
				buy.setBuy_count(rs.getInt(++i));
				buy.setBook_image(rs.getString(++i));
				buy.setBuy_date(rs.getDate(++i));
				buy.setAccount(rs.getString(++i));
				buy.setDeliveryname(rs.getString(++i));
				buy.setDeliverytel(rs.getString(++i));
				buy.setDeliveryaddress(rs.getString(++i));
				buy.setSanction(rs.getString(++i));

				list.add(buy);
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