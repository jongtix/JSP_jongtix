<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>로그인 폼</title>
</head>
<body>
	<h3>로그인 폼</h3>
	<form action="loginPro.jsp" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>