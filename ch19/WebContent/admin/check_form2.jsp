<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>관리자 메뉴 로그인 체크</title>
</head>
<body>
	<h2>로그인</h2>
	<form action="LoginCheck" method="post">
		<table border="1" bgcolor="yellow">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"></td>
		</table>
	</form>
</body>
</html>