<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="num1" value="7" scope="page" />
<c:set var="num2" value="9" scope="page" />
포워딩하는 페이지 Maxnum.jsp입니다.
<br>
<jsp:forward page="Maxnum.jsp">
	<jsp:param value="${num1}" name="num1" />
	<jsp:param value="${num2}" name="num2" />
</jsp:forward>