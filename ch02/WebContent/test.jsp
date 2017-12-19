<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 지시자(Directive) -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 테스트</title>
</head>
<body>
<%
String strName = "홍길동"; // 변수는 사용 전에 미리 선언해야함.
%>
내 이름은 <%=strName %>입니다.
</body>
</html>