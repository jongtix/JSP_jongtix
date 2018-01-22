<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="3" cellspacing="3">
		<caption>
			<b>자료리스트 현황</b>
		</caption>
		<tr>
			<th>순번</th>
			<th>아이디</th>
			<th>파일명</th>
			<th>파일크기</th>
			<th>설명</th>
			<th>보기</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6">파일이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="list" items="${list}" varStatus="no">
				<tr>
					<td>${no.count}</td>
					<td>${list.id}</td>
					<td>${list.filename}</td>
					<td><fmt:formatNumber value="${list.filesize}"
							pattern="###,##0" /></td>
					<td>${list.description}</td>
					<td><a href="../upload/${list.filename}">파일보기</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br>
	<b><a href="uploadForm.jsp">업로드</a></b>
</body>
</html>