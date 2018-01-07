<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty list}">
	<h3>정보가 존재하지 않습니다.</h3>
</c:if>
<c:if test="${!empty list}">
	<table border=1 bgcolor="yellow">
		<caption>
			<b>부서정보</b>
		</caption>
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
		<c:forEach var="d" items="${list}">
			<tr align="center">
				<td>${d.deptno}</td>
				<td>${d.dname}</td>
				<td>${d.loc}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<br>
<br>
<a href="deptDelete.jsp">처음으로 돌아가기</a>