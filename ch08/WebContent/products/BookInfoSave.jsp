<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="pinfo" class="model.BookInfo" scope="request" />
<jsp:setProperty property="*" name="pinfo" />
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 관리</title>
</head>
<body>
	<h3>도서 정보가 저장되었습니다.</h3>
	<hr>
	<h3>제품 개략 정보</h3>
	<jsp:include page="ProductInfo.jsp" />
	페이지 수 :
	<jsp:getProperty property="page" name="pinfo" /><br> 저자 :
	<jsp:getProperty property="writer" name="pinfo" /><br>
</body>
</html>