<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 생성된 bean은 scope가 request범위이기 때문에 다음 페이지까지 이동 가능 -->
<jsp:useBean id="pinfo" class="model.Customer" scope="request" />
<jsp:setProperty property="name" name="pinfo" value="일지매" />
<jsp:setProperty property="gender" name="pinfo" value="여" />
<jsp:setProperty property="age" name="pinfo" value="23" />
<jsp:forward page="CustomerInfoView.jsp" />