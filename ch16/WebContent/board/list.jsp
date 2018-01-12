<%@page import="dao.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 list 화면</title>
</head>
<%
	/* 페이지 설정 */
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	/* 파라미터로 넘어온 페이지번호 값이 없으면 무조건 1page로 설정 */
	if (pageNum == null || pageNum.equals("")) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum); // 페이지를 숫자로 변환
	int startRow = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작 번호
	int endRow = currentPage * pageSize; // 현재 페이지의 끝 번호

	/* 글 번호와 글 순서 초기화 */
	int count = 0;
	int number = 0;

	/* 게시글 출력용 list 생성 */
	List<Board> boardList = null;
	BoardDao dao = BoardDao.getInstance();
	count = dao.getBoardCount(); // 전체 게시글 수
	if (count > 0) {
		boardList = dao.getBoards(startRow, endRow);
		number = count - (currentPage - 1) * pageSize;
	}
%>
<body bgcolor="<%=bodyback_c%>">
	<h2>
		글목록(전체 글 :
		<%=count%>)
	</h2>
	<table width="700" align="center">
		<tr align="right" bgcolor="<%=value_c%>">
			<td><a href="writerForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<%
		if (count == 0) {
	%>
	<table width="700" align="center">


		<tr>
			<td><h2>게시판에 저장된 글이 없습니다.</h2></td>
		</tr>
	</table>
	<%
		} else {
	%>
	<table border="1" width="700" align="center">
		<tr height="30" bgcolor="<%=value_c%>">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>ip</th>
		</tr>
		<tr>
			<%
				for (int i = 0; i < boardList.size(); i++) {
						Board board = boardList.get(i);
			%>
			<td><%=number--%></td>
			<td width="250" class="left">
				<%
					int wid = 0;
							if (board.getRe_level() > 0) {
								wid = 10 * (board.getRe_level()); // 답변인 경우 한칸씩 뒤로
				%> <img src="/ch16/images/level.gif" width="<%=wid%>" height="16"><img
				src="/ch16/images/re.gif"> <%
 	} else {
 %> <img src="/ch16/images/level.gif" width="<%=wid%>" height="16">
				<%
					}
				%> <a
				href="content.jsp?num=<%=board.getNumber()%>&pageNum=<%=currentPage%>"><%=board.getSubject()%></a>
				<%
					if (board.getReadcount() >= 20) {
				%> <img src="/ch16/images/hot.gif" border="0" height="16"> <%
 	}
 %>
			</td>
			<td><a href="mailto:<%=board.getEmail()%>"><%=board.getWriter()%></a></td>
			<td><%=board.getReg_date()%></td>
			<td><%=board.getReadcount()%></td>
			<td><%=board.getIp()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		}
	%>
	<!-- 페이지 네비게이션 시작 -->
	<%
		if (count > 0) {
			int pageCount = count / pageSize /* 전체 건수 / 페이지 크기 = 정수 페이지 수 */
					+ (count % pageSize == 0 ? 0 : 1); /* 나머지가 있으면 한 페이지를 추가 */
			int pageBlock = 10; // 한 화면에 보여지는 페이지 수 단위
			int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1; // 한 화면에 보여지는 페이지 끝 번호
			if (endPage > pageCount)
				endPage = pageCount;
			if (startPage > pageBlock) {
	%>
	<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%
		}
			for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
	</a>
	<%
		}
			if (endPage < pageCount) {
	%>
	<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
		}
		}
	%>
</body>
</html>