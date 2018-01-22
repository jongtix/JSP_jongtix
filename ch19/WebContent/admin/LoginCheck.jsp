<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("password");

	if (id != null) {
		if (pass != null) {
			if (pass.equals("1234")) {
				request.setAttribute("id", id);
				request.setAttribute("password", pass);
				RequestDispatcher rd = request.getRequestDispatcher("admin_menu.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
	}
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>