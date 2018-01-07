<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("num", 5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<table border=1 bgcolor="yellow">
		<c:forEach begin="${param.num1}" end="${param.num2}" var="i">
			<tr align="center">
				<th>${i}단</th>
				<c:forEach begin="1" end="9" var="j">
					<td>${i}x${j}= ${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>