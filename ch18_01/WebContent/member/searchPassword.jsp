<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="searching.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2">회원 가입할 때 사용한 이름과 생일, 아이디를 입력하세요.</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="50"></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="birth"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
		</table>
		<input type="submit" value="찾기">
	</form>
</body>
</html>