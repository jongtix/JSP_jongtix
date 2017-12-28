<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
</head>
<body>
	<h3>상품 정보</h3>
	<table border=1 bgcolor="yellow">
		<caption>
			<h3>상품 정보</h3>
		</caption>
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>가격</td>
			<td rowspan=2>비고</td>
		</tr>
		<tr>
			<td>${code}</td>
			<td>${name}</td>
			<td>${price}</td>
		</tr>
	</table>
</body>
</html>