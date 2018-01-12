<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매니저 로그인 폼</title>
<script type="text/javascript">
	function chk() {
		if (!form1.id.value) {
			alert("ID 입력해야지, 알겠니 ?");
			form1.id.focus();
			return false;
		}
		if (!form1.passwd.value) {
			alert("패스워드 빼 먹었잖아 !");
			form1.passwd.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="managerLoginProc.jsp" name="form1" method="post"
		onsubmit="return chk()">
		<table border="1" bgcolor="yellow" align="center">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" maxlength="10"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password" maxlength="10"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="매니저 로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>