<%@page import="dao.BuyDao"%>
<%@page import="model.Buy"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../manager/managerSessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	ArrayList<Buy> list = null;
	Buy buy = null;
	BuyDao dao = BuyDao.getInstance();
	int count = dao.getBuyListCount();
	list = dao.getBuyList();

	request.setAttribute("list", list);
	request.setAttribute("buyCount", count);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="../manager/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Shop Mall</title>
</head>
<body>
	<h3>
		<b>구매 목록</b>
	</h3>
	<a href="../manager/managerMain.jsp"><b>관리자 메인으로</b></a>
	<br>
	<table border="1" width="1100" cellpadding="3" cellspacing="3"
		align="center">
		<caption>
			<b>상품 주문 목록</b>
		</caption>
		<tr>
			<th><b>순번</b></th>
			<th><b>주문 번호</b></th>
			<th><b>주문자</b></th>
			<th><b>도서명</b></th>
			<th><b>주문 가격</b></th>
			<th><b>주문 수량</b></th>
			<th><b>주문 일자</b></th>
			<th><b>결제 계좌</b></th>
			<th><b>배송자명</b></th>
			<th><b>연락처</b></th>
			<th><b>배송지 주소</b></th>
			<th><b>배송 현황</b></th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="12">주문된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="buy" items="${list}" varStatus="no">
				<tr>
					<td>${no.count}</td>
					<td>${buy.buy_id}</td>
					<td>${buy.buyer}</td>
					<td>${buy.book_title}</td>
					<td>\<fmt:formatNumber value="${buy.buy_price }"
							pattern="###,##0" /></td>
					<td><fmt:formatNumber value="${buy.buy_count }"
							pattern="###,##0" /></td>
					<td>${buy.buy_date }</td>
					<td>${buy.account }</td>
					<td>${buy.deliveryname }</td>
					<td>${buy.deliverytel }</td>
					<td>${buy.deliveryaddress }</td>
					<td>
						<form action="orderStatusPro.jsp" method="post">
							<input type="hidden" name="buy_id" value="${buy.buy_id}">
							<select name="sanction">
								<option <c:if test="${buy.sanction == '준비중'}">selected</c:if>
									value="준비중">준비중</option>
								<option <c:if test="${buy.sanction == '배송중'}">selected</c:if>
									value="배송중">배송중</option>
								<option <c:if test="${buy.sanction == '배송완료'}">selected</c:if>
									value="배송완료">배송완료</option>
								<option <c:if test="${buy.sanction == '구매확정'}">selected</c:if>
									value="구매확정">구매확정</option>
								<option <c:if test="${buy.sanction == '반품신청'}">selected</c:if>
									value="반품신청">반품신청</option>
								<option <c:if test="${buy.sanction == '교환신청'}">selected</c:if>
									value="교환신청">교환신청</option>
							</select><br> <input type="submit" value="수정" align="right">
						</form>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>