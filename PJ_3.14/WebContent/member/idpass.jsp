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
	<fieldset style="width:330px;">
			<legend>
				<h3>id/password 찾기</h3>
			</legend>
			<input type="text" class="form-control" name="name" id="name" size="15" placeholder="이름"><br>
			<p>
				<input type="text" class="form-control" name="password" id="password" size="7" placeholder="주민번호 앞 6자리" maxlength="6">-
				<input type="password" class="form-control" name="password" id="password" size="7" maxlength="7" placeholder="주민번호 뒤 7자리">
				<p>
				<input type="submit" class="btn" value="찾기"> <input type="button" class="btn" value="돌아가기" onclick="history.back()">
			<p>
		</fieldset>
	</form>
	</div>
	<jsp:include page="/module/bottom.jsp"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  </body>
</html>