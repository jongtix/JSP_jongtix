<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원 목록</title>
</head>
<body>
	회원 테이블의 내용
	<table width="100%" border="1">
		<tr>
			<td>이름</td>
			<td>아이디</td>
			<td>이메일</td>
		</tr>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				/* connectionPool내의 oraDb Connection 객체를 드라이버로 사용 */
				String driver = "jdbc:apache:commons:dbcp:oraDb"; // connection pool
				String sql = "select a.id id, a.name name, b.email email from member2 a, member2Info b where a.id = b.id order by id";
				conn = DriverManager.getConnection(driver);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("email")%></td>
		</tr>
		<%
			}
			} catch (Exception e) {
				out.print(e.getMessage());
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (Exception e) {
					}
				if (stmt != null)
					try {
						stmt.close();
					} catch (Exception e) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (Exception e) {
					}
			}
		%>

	</table>
</body>
</html>