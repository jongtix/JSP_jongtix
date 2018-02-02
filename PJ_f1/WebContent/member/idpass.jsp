<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String id = (String)session.getAttribute("id");
	request.setAttribute("id", id);
%>
<!doctype html>
<html lang="ko">
  <head>
  	<meta name="viewprot" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <meta charset="utf-8">
    <title>아이디 / 비밀번호 찾기</title>
  </head>
  <body>
	<jsp:include page="/module/top.jsp"/>
	<div class="container">
		<form action="searching.do" method="post">
	<fieldset style="width:220px; height:180px;">
			<legend>
				<h3>id/password 찾기</h3>
			</legend>
			<input type="text" name="name" id="name" size="15" placeholder="이름">
			<p>
				<input type="text" name="password" id="password" size="7" placeholder="주민번호" maxlength="6">-
				<input type="password" name="password" id="password" size="7" maxlength="7">
				<p>
				<input type="submit" value="찾기"> <input type="button" value="돌아가기" onclick="history.back()">
			<p>
		</fieldset>
	</form>
	</div>
	<jsp:include page="/module/bottom.jsp"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  </body>
</html>