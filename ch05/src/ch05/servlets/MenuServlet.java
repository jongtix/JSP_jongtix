package ch05.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/menuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dbName = getInitParameter("DB_NAME");
		String url = getInitParameter("url");
		String user = getInitParameter("user");
		String password = getInitParameter("password");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from menu";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = (Connection) DriverManager.getConnection(url, user, password);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (conn != null) {
				out.print("<html><body>접속 성공<br>" + "<br>dbName = " + dbName + "<br>url = " + url + "<br>user = " + user
						+ "<br><hr>");
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				out.print("<table border=1><caption><h3>메뉴</h3></caption>");
				while (rs.next()) {
					out.print("<tr align=center>");
					out.print("<td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td>");
					out.print("</tr>");
				}
				out.print("</table>");
				out.print("</body></html>");
				rs.close();
				pstmt.close();
				conn.close();
			} else {
				out.print("<html><body>접속 실패</body></html>");
			}
		} catch (Exception e) {
			System.out.println("예외 발생 : " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
