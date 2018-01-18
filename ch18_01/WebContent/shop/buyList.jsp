<%@page import="dao.BuyDao"%>
<%@page import="model.Buy"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = getServletContext().getContextPath();
	String buyer = (String) session.getAttribute("id");

	ArrayList<Buy> list = null;
	BuyDao dao = BuyDao.getInstance();
	int buyCount = dao.getBuyListCount(buyer);
	list = dao.getBuyList(buyer);

	int total = 0;
	for (int i = 0; i < list.size(); i++) {
		total += list.get(i).getBuy_price() * list.get(i).getBuy_count();
	}

	request.setAttribute("path", path);
	request.setAttribute("buyer", buyer);
	request.setAttribute("buyList", list);
	request.setAttribute("total", total);
	request.setAttribute("buyCount", buyCount);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table border="1" width="650" cellpadding="3" cellspacing="3"
		align="center">
		<caption>
			<h3>구매 목록</h3>
		</caption>
		<tr>
			<th><b>번호</b></th>
			<th><b>도서명</b></th>
			<th><b>판매가</b></th>
			<th><b>수량</b></th>
			<th><b>금액 </b></th>
			<th><b>상태</b></th>
		</tr>
		<c:if test="${empty buyList}">
			<tr>
				<td><b>구매 목록이 없습니다.</b></td>
			</tr>
		</c:if>
		<c:if test="${!empty buyList}">
			<c:forEach var="buy" items="${buyList}" varStatus="no">
				<tr>
					<td align="center" width="50"><b>${no.count}</b></
					<td width="300">
					<td width="300"><img alt=""
						src="${path}/imageFile/${buy.book_image}" border="0" width="30"
						height="50" align="middle"> ${buy.book_title}</td>
					<td align="center" width="100"><fmt:formatNumber
							value="${buy.buy_price}" pattern="###,##0" /></td>
					<td align="center" width="50"><fmt:formatNumber
							value="${buy.buy_count}" pattern="###,##0" /></td>
					<td align="center" width="150"><fmt:formatNumber
							value="${buy.buy_count * buy.buy_price}" pattern="###,##0" /></td>
					<td><select name="status" disabled>
							<option <c:if test="${buy.sanction == '준비중'}">seleced</c:if>>준비중</option>
							<option <c:if test="${buy.sanction == '배송중'}">seleced</c:if>>배송중</option>
							<option <c:if test="${buy.sanction == '배송완료'}">seleced</c:if>>배송완료</option>
							<option <c:if test="${buy.sanction == '반품처리'}">seleced</c:if>>반품처리</option>
					</select></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right"><b>총 금액: <fmt:formatNumber
							value="${total}" type="currency" currencySymbol=" ￦" />
				</b></td>
			</tr>
		</c:if>
	</table>
	<br>
	<center>
		<input type="button" value="메인으로"
			onclick="location.href='shopMain.jsp'">
	</center>
</body>
</html>