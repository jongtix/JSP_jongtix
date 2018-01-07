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
		return true;
	}
</script>
</head>
<body>
	<form action="template.jsp" onsubmit="return chk()">
		<table border=1 bgcolor="yellow">
			<tr>
				<td>ID :</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="확인"><input
					type="reset" value="다시 작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>