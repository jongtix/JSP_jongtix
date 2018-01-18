<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = getServletContext().getContextPath();
	String book_king = request.getParameter("book_kind");
	String buyer = (String) session.getAttribute("id");
	ArrayList<Cart> cartList = null;
	ArrayList<Bank> accountList = null;
	Member member = null;
	int total = 0;

	CartDao dao = CartDao.getInstance();
	cartList = dao.getCartList(buyer);

	MemberDao1 mDao = MemberDao1.getInstance();
	member = mDao.selectMemberInfo(buyer);

	BuyDao bDao = BuyDao.getInstance();
	accountList = bDao.getAccount();

	for (int i = 0; i < cartList.size(); i++) {
		total += cartList.get(i).getBuy_price() * cartList.get(i).getBuy_count();
	}

	request.setAttribute("cartList", cartList);
	request.setAttribute("member", member);
	request.setAttribute("accountList", accountList);
	request.setAttribute("path", path);
	request.setAttribute("total", total);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="style.css" rel="stylesheet" type="text/css">
<title>구매 폼</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="address.js"></script>
</head>
<body>
	<div align="center">
		<b>구매 목록</b>
	</div>
	<c:if test="${empty cartList}">
		<b>장바구니 목록이 존재하지 않습니다.</b>
		<br>
		<input type="button" value="쇼핑 계속"
			onclick="location.href='list.jsp?book_kind=${book_kind}'">
	</c:if>
	<c:if test="${!empty cartList}">
		<form action="updateCart.jsp" name="inform" method="post">
			<table border="1" width="750" align="center">
				<tr>
					<th><b>번호</b></th>
					<th><b>책이름</b></th>
					<th><b>판매가</b></th>
					<th><b>수량</b></th>
					<th><b>금액</b></th>
				</tr>
				<c:forEach var="cart" items="${cartList}" varStatus="no">
					<tr>
						<td align="center" width="50">${no.count}</td>
						<td width="300"><img alt=""
							src="${path}/imageFile/${cart.book_image}" border="0" width="30"
							height="50" align="middle">${cart.book_title}</td>
						<td align="center" width="100"><fmt:formatNumber
								value="${cart.buy_price}" type="currency" currencySymbol="￦" /></td>
						<td align="center" width="150">${cart.buy_count}</td>
						<td align="center" width=""><fmt:formatNumber
								value="${cart.buy_price*cart.buy_count}" type="currency"
								currencySymbol="￦" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="right"><b>총 구매 금액: <fmt:formatNumber
								value="${total}" type="currency" currencySymbol="￦" /></b></td>
				</tr>
			</table>
		</form>
		<br>
		<br>
		<form action="buyPro.jsp" name="buyinput" method="post">
			<table width="600" border="1" cellspacing="0" cellpadding="3"
				align="center">
				<tr>
					<td colspan="2" align="center"><font size="+1"><b>주문자
								정보</b></font></td>
				</tr>
				<tr>
					<td width="200"><b>성명</b></td>
					<td width="400"><b>${member.name}</b></td>
				</tr>
				<tr>
					<td><b>전화번호</b></td>
					<td>${member.tel1}-${member.tel2}-${member.tel3}</td>
				</tr>
				<tr>
					<td><b>주소 </b></td>
					<td>${member.address1}<br> ${member.address2}
					</td>
				</tr>
				<tr>
					<td><b>결제 계좌</b></td>
					<td><select name="account">
							<c:forEach var="account" items="${accountList}" varStatus="">
								<option
									value="${account.account}-${account.bank}-${account.name}">${account.account}
									/ ${account.bank} / ${account.name}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<br> <br>
			<table width="600" border="1" cellspacing="0" cellpadding="3"
				align="center">
				<tr>
					<td colspan="2" align="center"><font size="+1"><b>배송지
								정보</b></font></td>
				</tr>
				<tr>
					<td width="100"><b>성명</b></td>
					<td width="400"><input type="text" name="deliveryname"
						value="${member.name}"></td>
				</tr>
				<tr>
					<td width="100"><b>전화번호</b></td>
					<td><input type="text" name="deliverytel1"
						value="${member.tel1}" size="3"> - <input type="text"
						name="deliverytel2" value="${member.tel2}" size="4"> - <input
						type="text" name="deliverytel3" value="${member.tel3}" size="4"></td>
				</tr>
				<tr>
					<td><b>배송지 주소</b></td>
					<td><input type="text" name="zipno" id="zipno" maxlength="7"
						size="7" value="${member.zipno}"> <input type="button"
						onclick="execDaumPostcode()" value="우편번호 찾기"> <input
						type="button" value="주소수정" onclick="execDaumPostcode()"><br>
						<input type="text" name="deliveryaddress1" id="address1"
						value="${member.address1}" size="60"><br> <input
						type="text" name="deliveryaddress2" value="${member.address2}"
						size="60" id="address2"><input type="hidden"
						id="jibunAddress"><span id="guide" style="color: #999"></span></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="결제하기"> <input type="reset" value="다시작성"> <input
						type="button" value="취소" onclick="location.href='shopMain.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</c:if>
</body>
</html>