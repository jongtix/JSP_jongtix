<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	function deleteSave() {
		if (delForm.password.value == "") {
			alert("비밀번호를 입력하세요.");
			delForm.password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h2>글삭제</h2>
	<form action="deleteQnaPro.do" method="post" name="delForm"
		onsubmit="return deleteSave()">
		<table border="1" width="360">
			<tr height="30">
				<th>비밀번호</th>
				<td><input type="password" name="password"> <input
					type="hidden" name="num" value="${num}"></td>
				<input type="hidden" name="pageNum" value="${pageNum}">
				</td>
			</tr>
			<tr height="30">
				<td colspan=2 align="center"><input type="submit" value="글삭제">
					<input type="reset" value="글목록"
					onclick="location.href='listQna.do?pageNum=${pageNum}'">
			</tr>
		</table>
	</form>
</body>
</html>