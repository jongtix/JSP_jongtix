<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<jsp:useBean id="cinfo" class="model.Customer" /><!-- Customer cinfo = new Customer()와 같음 -->
	<jsp:setProperty property="name" name="cinfo" value="홍길동" /><!-- setName() -->
	<jsp:setProperty property="gender" name="cinfo" value="남" /><!-- setGender() -->
	<jsp:setProperty property="age" name="cinfo" value="25" /><!-- setAge() -->

	이름 :
	<jsp:getProperty property="name" name="cinfo" /><br> 성별 :
	<jsp:getProperty property="gender" name="cinfo" /><br> 나이 :
	<jsp:getProperty property="age" name="cinfo" /><br>
</body>
</html>