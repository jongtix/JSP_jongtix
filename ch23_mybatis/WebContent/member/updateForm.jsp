<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="dto.Member"%><%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script type="text/javascript">
	function chk() {
		var pass1 = document.forms[0].password;
		var pass2 = document.forms[0].password2;
		if (pass1.value != pass2.value) {
			alert('입력값이 서로 다릅니다.');
			pass1.value = "";
			pass2.value = "";
			pass1.focus();
			return false;
		}
		return true;
	}
</script>
<head>
<title>회원정보 수정</title>
</head>
<body>
	<form action="updatePro.do" method="post" onsubmit="return chk()">
		<input type="hidden" name="id" value="${member.id}" />
		<table border=1>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id2" value=${member.id } disabled></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value=${member.name}></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" name="password2"></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td><input type="date" value="${member.reg_date}"
					name="reg_date"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>