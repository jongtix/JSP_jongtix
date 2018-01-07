<%@page import="java.util.HashMap"%>
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
		request.setCharacterEncoding("utf-8");
		HashMap<String, String> map = new HashMap<>();
		/* map.put("park", "목동");
		map.put("Jesica", "크라이스트 처치");
		map.put("Susan", "시드니"); */
		map.put(request.getParameter("k1"), request.getParameter("v1"));
		map.put(request.getParameter("k2"), request.getParameter("v2"));
		map.put(request.getParameter("k3"), request.getParameter("v3"));

		request.setAttribute("address", map);
		RequestDispatcher dis = request.getRequestDispatcher("mapView.jsp?name=park");
		dis.forward(request, response);
	%>
</body>
</html>