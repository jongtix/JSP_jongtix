<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int num = 0, ref = 0, re_level = 0, re_step = 0; /* 글쓰기 글번호 초기화 */
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
		}
	%>
	<form action="writeProc.jsp" method="post">
		<input type="hidden" name="number" value="<%=num%>"> <input
			type="hidden" name="ref" value="<%=ref%>"> <input
			type="hidden" name="re_level" value="<%=re_level%>"> <input
			type="hidden" name="re_step" value="<%=re_step%>"> <input
			type="hidden" name="pageNum" value="<%=pageNum%>">
		<table>
			<caption>
				<h3>게시판 글 작성</h3>
			</caption>
			<tr>
				<th>제목</th>
				<td>
					<%
						if (num == 0) {
					%> <input type="text" name="subject" required> <%
 	} else {
 %> <input type="text" name="subject" required value="[답변]"> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content"></textarea></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="확인"> <input
					type="reset" value="취소"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="목록보기"
					onclick="window.location='list.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>