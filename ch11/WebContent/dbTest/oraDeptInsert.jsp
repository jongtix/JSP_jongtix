<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script type="text/javascript">
	function chk() {
		var frm = document.forms[0];
		if (!frm.deptno.value) {
			alert("부서 번호를 입력하세요.");
			frm.deptno.focus();
			return false;
		}
		if (isNaN(frm.deptno.value)) {
			alert("숫자를 입력하세요.");
			frm.deptno.value = '';
			frm.deptno.focus();
			return false;
		}
		if (!frm.dname.value) {
			alert("부서명을 입력하세요.");
			frm.deptno.focus();
			return false;
		}
		if (!frm.location.value) {
			alert("위치를 입력하세요.");
			frm.deptno.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<h3>부서 추가하기</h3>
	<form action="oraDeptInsertProc.jsp" method="post"
		onsubmit="return chk()">
		부서번호 : <input type="text" value="${deptno}" name="deptno" size="2">
		<br> 부서명 : <input type="text" value="${dname}" name="dname"
			size="15"> <br> 위치 : <input type="text"
			value="${location}" name="location" size="15"> <br> <input
			type="submit" value="추가하기"> <br>
	</form>
</body>
</html>