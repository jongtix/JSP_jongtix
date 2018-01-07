<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		char gender = request.getParameter("gender").charAt(0);
		int age = Integer.parseInt(request.getParameter("age"));

		// 자바빈 클래스 생성
		Customer customer = new Customer();
		// 자바빈 클래스의 set메소드로 값 저장
		customer.setName("홍길동");
		customer.setGender("남".charAt(0));
		customer.setAge(new Integer(25));
		// request 객체에 속성으로 자바빈을 저장
		request.setAttribute("customerInfo", customer);
	%>
	<h2>회원정보</h2>
	<%
		Customer custInfo = (Customer) request.getAttribute("customerInfo");
	%>
	이름 :
	<%=custInfo.getName()%><br> 성별 :
	<%=custInfo.getGender()%><br> 나이 :
	<%=custInfo.getAge()%><br>
</body>
</html>