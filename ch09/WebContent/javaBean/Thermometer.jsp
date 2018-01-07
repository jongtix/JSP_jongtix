<%@page import="util.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* bean객체 생성 */
	Thermometer thermo = new Thermometer();
	/* request에 객체 저장 */
	request.setAttribute("t", thermo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온도 변환</title>
</head>
<body>${t.setCelsius('서울', 27.3)}
	서울 온도 : 섭씨 ${t.getCelsius('서울')}도 / 화씨 ${t.getFahrenheit('서울')}F도
	<br> 정보 : ${t.info}
	<!-- info필드가 없지만 값이 나옴, bean에서 get+필드명으로 메소드를 생성하기 때문 -->
</body>
</html>