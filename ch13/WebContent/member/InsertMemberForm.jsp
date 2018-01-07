<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="insertMemberPro.jsp" method="post">
		<table border="1" bgcolor="yellow">
			<caption>
				<h3>회원가입</h3>
			</caption>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id" maxlength="12"></td>
			</tr>
			<tr> 
				<td>패스워드</td>
				<td><input type="password" name="password" id="password"
					maxlength="12"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" maxlength="12"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="전송"> <input
					type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>