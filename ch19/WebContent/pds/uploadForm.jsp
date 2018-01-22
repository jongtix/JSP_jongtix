<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>upload MVC</title>
<script type="text/javascript">
	function chk() {
		var file = document.getElementById('file');
		var fileSpan = document.getElementById('filespan');
		if (file == null || file.value.length == 0) {
			fileSpan.innerHTML = '<table border="1"><tr><th>파일을 선택하세요.</th></tr></table>';
			file.focus();
			return false;
		}
		if (!frm.description.value) {
			alert('파일 설명을 입력하세요.');
			frm.description.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>파일 업로드</h2>
	<c:if test="${!empty msg}">${msg}</c:if>
	<!-- 파일 전송을 위한 조건 1. metond="post", 2. type="multipart/form-data" -->
	<form action="Upload.do" method="post"
		enctype="multipart/form-data" onsubmit="return chk()" name="frm">
		파일: <input type="file" name="file" id="file"><br> <span
			id="filespan"></span>
		<p>
			설명: <input type="text" name="description">
		<p>
			<input type="submit" value="확인">
	</form>
</body>
</html>