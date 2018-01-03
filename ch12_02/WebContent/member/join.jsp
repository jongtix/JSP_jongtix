<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		var id = document.getElementById('id');
		var password = document.getElementById('password');
		var password2 = document.getElementById('password2');

		if (!id.value) {
			alert("ID를 입력하세요.");
			id.focus();
			return false;
		}
		if (!password.value) {
			alert("Password를 입력하세요.");
			password.focus();
			return false;
		}
		if (!password2.value) {
			alert("Password 확인 값을 입력하세요.");
			password2.focus();
			return false;
		}
		if (password.value != password2.value) {
			alert("Password를 확인해주세요.");
			password.value = "";
			password2.value = "";
			password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="joinProc.jsp" onsubmit="return chk()">
		<table border=1 bgcolor="yellow">
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" id="id"></td>
				<td><input type="button" name="btm_id" id="btm_id" value="중복체크"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>Password 확인</td>
				<td><input type="password" name="password2" id="password2"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="birth" id="birth" required></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address" required></td>
			</tr>
			<tr>
				<td>Tel</td>
				<td><input type="text" name="tel" id="tel"></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="email" name="email" id="email" required></td>
				<td><input type="button" name="btm_email" id="btm_email"
					value="중복체크"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="확인"><input
					type="reset" value="다시 작성"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		document.getElementById('btn_id').onclick = function() {

		}
	</script>
</body>
</html>