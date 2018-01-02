<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty list}">
	<h3>정보가 존재하지 않습니다.</h3>
</c:if>
<c:if test="${!empty list}">
	<table border=1 bgcolor="yellow">
		<caption>
			<h3>부서 정보</h3>
		</caption>
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
		<c:forEach var="dept" items="${list}">
			<tr>
				<td>${dept.deptno}</td>
				<td>${dept.dname}</td>
				<td>${dept.loc}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>