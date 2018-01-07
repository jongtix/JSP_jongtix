<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="date" value="<%=new Date()%>" />
<html>
<head>
<title>나라별 포맷</title>
</head>
<body>
	<h3>우리나라 포맷</h3>
	<fmt:setLocale value="ko_kr" />
	금액 :
	<fmt:formatNumber value="100000" type="currency" />
	<br> 일시 :
	<fmt:formatDate value="${date}" type="both" dateStyle="full"
		timeStyle="full" />
	<hr>
	<h3>미국 포맷</h3>
	<fmt:setLocale value="en_us" />
	금액 :
	<fmt:formatNumber value="100000" type="currency" />
	<br> 일시 :
	<fmt:formatDate value="${date}" type="both" dateStyle="full"
		timeStyle="full" />
	<hr>
	<h3>일본 포맷</h3>
	<fmt:setLocale value="ja_jp" />
	금액 :
	<fmt:formatNumber value="100000" type="currency" />
	<br> 일시 :
	<fmt:formatDate value="${date}" type="both" dateStyle="full"
		timeStyle="full" />
</body>
</html>