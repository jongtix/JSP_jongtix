<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>로그인</title>
<script type="text/javascript">
	function chk() {
		var id = document.forms[0].id;
		var pass = document.forms[0].password;
		if (id.value == null) {
			alert('아이디를 입력하세요.');
			id.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h3>로그인 폼</h3>
	<form action="check.jsp" onsubmit="return chk()">
		아이디: <input type="text" name="id" required><br> 비밀번호: <input
			type="password" name="password" required><br> <input
			type="submit" value="확인">
	</form>
</body>
</html>