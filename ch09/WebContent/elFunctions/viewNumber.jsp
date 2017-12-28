<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="elfunc" uri="/WEB-INF/tlds/el-functions.tld"%>
<%
	request.setAttribute("price", 12345);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 사용자 정의 함수 호출</title>
</head>
<body>
	입력한 숫자는
	<b>${elfunc:formatNum(price, '#,##0')}</b>입니다.
</body>
</html>