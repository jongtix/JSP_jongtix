<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="myUrl" value="Adder.jsp">
	<c:param name="num1" value="100" />
	<c:param name="num2" value="5" />
</c:url>
<c:redirect url="${myUrl}" />