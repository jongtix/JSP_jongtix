<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원가입폼</title>
<script>
	function chk() {
		var pass1 = document.forms[0].password;
		var pass2 = document.forms[0].password2;
		if (pass1.value != pass2.value) {
			alert('암호가 서로 다릅니다.');
			pass1.value = '';
			pass2.value = '';
			pass1.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>회원가입하기</h2>
	<form action="join.jsp" onsubmit="return chk()">
		아이디: <input type="text" name="id" required>
		<p>
			암호: <input type="password" name="password" required>
		<p>
			암호확인: <input type="password" name="password2" required>
		<p>
			이름: <input type="text" name="name" required>
		<p>
			<input type="submit" value="확인">
	</form>
</body>
</html>