<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>구구단</title>
</head>
<body>
	<table border="1">
		<c:forEach var="j" begin="1" end="9">
			<tr>
				<c:forEach var="i" begin="${num1}" end="${num2}">
					<td>${i}*${j}=${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>