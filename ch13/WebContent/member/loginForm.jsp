<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>로그인</title>
<script type="text/javascript">
	function chk() {
		var id = document.forms[0].id;
		var password = document.forms[0].password;
		if (id.value.length == 0) {
			alert('id를 입력하세요.');
			id.focus();
			return false;
		}
		if (password.value.length == 0) {
			alert('비밀번호를 입력하세요.');
			passowrd.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>로그인</h2>
	<form action="cookieLoginPro.jsp" method="post" onsubmit="return chk()">
		<table border="1" bgcolor="yellow">
			<caption>
				<h3>로그인</h3>
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
			<tr align="center">
				<td colspan="2"><input type="submit" value="전송"> <input
					type="reset" value="취소"> <input type="button" value="회원가입"
					onclick="location.href='InsertMemberForm.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>