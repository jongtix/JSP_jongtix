<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사칙연산 결과</title>
</head>
<body>
	입력된 수 :
	<%=request.getAttribute("num1") + ", " + request.getAttribute("num2") + "<br>"%>
	연산 결과 :
	<%=request.getAttribute("result")%>
</body>
</html>