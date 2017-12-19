<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str1 = request.getParameter("num1");
		String str2 = request.getParameter("num2");
		String op = request.getParameter("op");
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		long result = 0;
		switch (op) {
		case "sum":
			result = num1 + num2;
			break;
		case "min":
			result = num1 - num2;
			break;
		case "mul":
			result = num1 * num2;
			break;
		case "div":
			result = num1 / num2;
			break;
		}
		// 이동할 request 객체에 속성 저장
		request.setAttribute("result", new Long(result));
		request.setAttribute("num1", new Integer(num1));
		request.setAttribute("num2", new Integer(num2));
		// 이동할 경로 설정
		RequestDispatcher dispatcher = request.getRequestDispatcher("FourRulesResult.jsp");
		// 객체를 싣고 이동
		dispatcher.forward(request, response);// 내장 객체 변수인 request, response를 싣고 이동
	%>

</body>
</html>