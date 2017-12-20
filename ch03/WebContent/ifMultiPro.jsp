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
		String name = request.getParameter("name");
		String local = request.getParameter("local");
		String tel = request.getParameter("tel");
		String mobile = request.getParameter("mobile");
		mobile = mobile.toUpperCase();
		String mid = request.getParameter("mid");
		String end = request.getParameter("end");

		String localNum = "";
		if (local.equals("서울")) {
			localNum = "02";
		} else if (local.equals("경기")) {
			localNum = "031";
		} else if (local.equals("인천")) {
			localNum = "032";
		} else {
			out.print("<br>지역번호가 맞지 않습니다.<br>");
		}
		out.print("<br><b>" + name + "</b>님의 연락처는 " + localNum + " - " + tel + "입니다.<br>");
	%>
	핸드폰 번호 :
	<%=mobile%>
	010 -
	<%=mid%>
	-
	<%=end%>
</body>
</html>