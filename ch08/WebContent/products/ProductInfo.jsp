<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pinfo" class="model.ProductInfo" scope="request" />
코드 :
<jsp:getProperty property="code" name="pinfo" /><br>
제품명 :
<jsp:getProperty property="name" name="pinfo" /><br>
가격 :
<jsp:getProperty property="price" name="pinfo" /><br>
