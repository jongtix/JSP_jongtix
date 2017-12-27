<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="pinfo" class="model.Customer" scope="request" />
	<jsp:getProperty property="name" name="pinfo" /><br>
	<jsp:getProperty property="gender" name="pinfo" /><br>
	<jsp:getProperty property="age" name="pinfo" /><br>
</body>
</html>