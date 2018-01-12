<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/ch16/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function deleteSave() {
		if (delForm.password.value == "") {
			alert('비밀번호를 입력하세요.');
			delForm.password.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body bgcolor="<%=value_c1%>">
	<h2>글삭제</h2>
	<form action="deleteProc.jsp" method="post" name="delForm"
		onsubmit="return deleteSave()">
		<table border="1" width="360">
			<tr height="30">
				<th>비밀번호</th>
				<td><input type="password" name="password"><input
					type="hidden" name="num" value="<%=num%>"> <input
					type="hidden" name="pageNum" value="<%=pageNum%>"></td>
			</tr>
			<tr height="30">
				<td colspan="2"><input type="submit" value="글삭제"> <input
					type="reset" value="글목록"
					onclick="location.href='list.jsp?pageNum=<%=pageNum%>'"></td>
			</tr>
		</table>
	</form>
</body>
</html>