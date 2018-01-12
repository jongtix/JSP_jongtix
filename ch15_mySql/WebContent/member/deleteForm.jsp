<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 폼</title>
<script type="text/javascript">
	function chk() {
		var pass = document.getElementById('password');
		if (pass.value.length == 0) {
			alert('패스워드를 입력하세요.');
			pass.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="memberDeleteProc.jsp" method="post"
		onsubmit="return chk()">
		<table>
			<caption>
				<h3>회원 탈퇴</h3>
			</caption>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${id}" readonly></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"> <input
					type="reset" vlaue="지우기"></td>
			</tr>
		</table>
	</form>
</body>
</html>