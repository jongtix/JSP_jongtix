<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	HashMap<String, Object> mapData = new HashMap<>();
	/* Map이라 순서 없음 */
	mapData.put("int", 8);
	mapData.put("name", "홍길동");
	mapData.put("today", new Date());
%>
<c:set var="intArray" value="<%=new int[] { 1, 2, 3, 4, 5 }%>" />
<c:set var="map" value="<%=mapData%>" />
<html>
<body>
	<h4>int형 배열</h4>
	<table border=1 bgcolor="yellow">
		<caption>int형 배열 결과</caption>
		<c:forEach var="i" items="${intArray}" begin="2" end="4"
			varStatus="status">
			<tr>
				<td>인덱스</td>
				<td>카운트</td>
				<td>배열의 값</td>
			</tr>
			<tr align="center">
				<td>${status.index}</td>
				<td>${status.count}</td>
				<td>[${i}]</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<c:forEach var="i" items="${map}">
${i.key} = ${i.value} <br>
	</c:forEach>
</body>
</html>