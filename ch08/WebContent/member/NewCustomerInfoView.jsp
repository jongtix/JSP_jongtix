<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<jsp:useBean id="pinfo" class="model.Customer" scope="request" />
	이름 :
	<jsp:getProperty property="name" name="pinfo" /><br>
	성별 :
	<jsp:getProperty property="gender" name="pinfo" /><br>
	나이 :
	<jsp:getProperty property="age" name="pinfo" /><br>
</body>
</html>