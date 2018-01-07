<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<html>
<body>
	<%
		Connection conn = null;
		BufferedOutputStream bos = null;
		InputStream in = null;
		String sql = "select photo from testblob where id = ?";

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OraDB");
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String id = request.getParameter("id");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				// DB로부터 이미지 객체 읽어서 생성
				Blob blob = rs.getBlob(1);

				// 뒤에서 호출되는 getOutputStream()에 의한 객체 충돌 방지 처리
				out.clear();
				out = pageContext.pushBody();

				// 출력스트림 생성
				bos = new BufferedOutputStream(response.getOutputStream());
				// 시리얼라이즈
				in = blob.getBinaryStream();
				// 이미지 크기
				int length = (int) blob.length();
				// 버퍼
				byte[] buffer = new byte[length];
				// write 작업
				while ((length = in.read(buffer)) != -1) {
					bos.write(buffer);
				}
				bos.close();
				in.close();
				rs.close();
				pstmt.close();
				conn.close();
			}
		} catch (Exception e) {
			out.print("오류 : " + e.getMessage());
		}
	%>
</body>
</html>