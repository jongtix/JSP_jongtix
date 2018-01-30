<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="/teamProject/js/askDelete.js"></script>
<c:if test="${error != null}">
	<script type="text/javascript">
		alert('${error}');
	</script>
</c:if>
</head>
<body>
	<div align="center">
		<h2>관리자 확인</h2>
		<form action="moveFaq.do" method="post" name="delForm"
			onsubmit="return ask()">
			<input type="hidden" name="num" value="${num}"> <input
				type="hidden" name="pageNum" value="${pageNum}">
			<table border="1" width="360">
				<tr height="30">
					<th>관리자ID</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr height="30">
					<th>비밀번호</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr height="30">
					<td colspan=2 align="center"><input type="submit"
						value="FAQ로 글 이동"> <input type="button" value="글목록"
						onclick="location.href='listQna.do?pageNum=${pageNum}'">
				</tr>
			</table>
		</form>
	</div>
</body>
</html>