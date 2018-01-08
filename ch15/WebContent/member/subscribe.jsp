<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String ok = request.getParameter("ok");
	if (ok == null) {
		out.print("<script>");
		out.print("alert('개인정보 정책에 동의하셔야합니다.');");
		out.print("window.location.href='joinProc2.jsp';");
		out.print("</script>");
	}
%>
<title>회원가입 화면</title>
<script type="text/javascript">
	function chk() {
		var id = document.getElementById('id');
		var pwd = document.getElementById('password');
		var pwd2 = document.getElementById('password2');
		if (!id.value) {
			alert("ID를 입력하세요");
			id.focus();
			return false;
		}
		if (!pwd.value) {
			alert("패스워드를 입력하세요");
			pwd.focus();
			return false;
		}
		if (!pwd2.value) {
			alert("패스워드확인을 입력하세요");
			pwd2.focus();
			return false;
		}
		if (pwd.value != pwd2.value) {
			alert("입력값이 서로 다릅니다.");
			pwd.value = "";
			pwd2.value = "";
			pwd.focus();
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function open_chk() {
		var id = document.getElementById('id').value;
		if (id.length == 0) {
			alert("id를 입력하세요");
			document.getElementById('id').focus();
			return;
		}
		//팝업윈도우 호출(BOM)
		//window.open(파일명,"title",속성);
		//여기(subscribe.jsp)가 부모(opener)가 됨.
		window.open("idCheck.jsp?id=" + id, "idchk",
				"height=100,width=450,resize=yes");
	} //idCheck.jsp?id=dd
</script>
<script type="text/javascript">
	function open_emailChk() {
		var emailId = document.getElementById('emailId').value;
		var emailDomain = document.getElementById('email2').value;
		if (emailId.length == 0 || emailDomain.length == 0) {
			alert("email을 입력하세요");
			document.getElementById('emailId').focus();
			return;
		}
		window.open("emailCheck.jsp?email=" + emailId + "@" + emailDomain,
				"emailchk", "height=100,width=450,resize=yes");
	}
</script>
</head>
<body>
	<form action="sessionSubscribeProc.jsp" onsubmit="return chk()"
		name="frm">
		<table border=1 bgcolor="yellow">
			<tr>
				<td>*ID:</td>
				<td><input type="text" name="id" id="id"> <input
					type="button" name="isId" id="isId" value="IDcheck"
					onclick="open_chk()"></td>
			</tr>
			<tr>
				<td>*PASSWORD</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>PASSWORD확인</td>
				<td><input type="password" name="password2" id="password2"></td>
			</tr>
			<tr>
				<td>*이름</td>
				<td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="zipno" id="zipno" maxlength="7"
					size="7" required></td>
			</tr>
			<tr>
				<td>*주소1</td>
				<td><input type="text" name="address1" id="address1"
					maxlength="80" size="80" required></td>
			</tr>
			<tr>
				<td>*주소2</td>
				<td><input type="text" name="address2" id="address2"
					maxlength="50" size="50" required></td>
			</tr>
			<tr>
				<td>tel</td>
				<td><select name="tel1" id="tel1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
				</select> - <input type="text" name="tel2" id="tel2" size="4" maxlength="4">
					- <input type="text" name="tel3" id="tel3" size="4" maxlength="4"></td>
			</tr>
			<tr>
				<td>*email</td>
				<td><input type="text" name="emailId" id="emailId" required>
					@ <input type="text" name="email2" id="email2"> <select
					name="emailDomain" id="emailDomain" onchange="select(this.value)">
						<option value="">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="google.com">구글</option>
						<option value="nate.com">네이트</option>
				</select> <input type="button" name="isEmail" id="isEmail" value="EmailCheck"
					onclick="open_emailChk()"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="확인">
					<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function select(value) {
			document.getElementById('email2').value = value;
		}
	</script>
</body>
</html>