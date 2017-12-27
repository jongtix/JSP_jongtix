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
	<jsp:setProperty property="name" name="pinfo" param="name" />
	<jsp:setProperty property="gender" name="pinfo" param="gender" />
	<jsp:setProperty property="age" name="pinfo" param="age" />
	<jsp:forward page="NewCustomerInfoView.jsp" />
</body>
</html>