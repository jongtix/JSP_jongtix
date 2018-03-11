<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="/teamProject/js/askDelete.js"></script>
<c:if test="${result < 0}">
	<script type="text/javascript">
		alert('글 쓴이만 삭제할 수 있습니다.');
		history.back();
	</script>
</c:if>
</head>
<body>
	<div align="center">
		<h2>댓글삭제</h2>
		<form action="deleteSubBoardPro.do" method="post" name="delForm"
			onsubmit="return ask()">
			<table border="1" width="360">
				<caption>삭제하시려면 비밀번호를 한번 더 입력해 주세요.</caption>
				<tr height="30">
					<th>비밀번호</th>
					<td><input type="password" name="sub_password"> <input
						type="hidden" name="num" value="${num}"> <input
						type="hidden" name="pageNum" value="${pageNum}"> <input
						type="hidden" name="sub_num" value="${sub_num}"> <input
						type="hidden" name="subPageNum" value="${subPageNum}"></td>
				</tr>
				<tr height="30">
					<td align="center"><input type="button" value="글목록"
						onclick="location.href='listQna.do?pageNum=${pageNum}'"></td>
					<td align="center"><input type="submit" value="글삭제"> <input
						type="button" value="취소"
						onclick="location.href='viewQna.do?num=${num}&pageNum=${pageNum}'">
				</tr>
			</table>
		</form>
	</div>
</body>
</html>