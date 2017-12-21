<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			out.print("result = " + (num1 + num2));
		} catch (Exception e) {
			// request에 객체 저장
			request.setAttribute("err", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("dataError.jsp");
			dispatcher.forward(request, response);
		}
	%>
</body>
</html>