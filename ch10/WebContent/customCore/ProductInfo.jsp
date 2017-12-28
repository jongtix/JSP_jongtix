<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 커스텀 태그 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="code" value="80012" scope="page" />
<c:set var="name" value="온습도계" scope="request" />
<c:set var="price" value="15000" scope="request" />
<jsp:forward page="ProductInfoView.jsp" />