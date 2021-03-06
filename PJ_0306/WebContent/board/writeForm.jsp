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
    <title>게시글 작성</title>
    <style type="text/css">
    </style>
  </head>
  <body>
	<jsp:include page="/module/top.jsp"/>
	<div class="container">
<form action="writePro.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${board.num }"> <input
			type="hidden" name="ref" value="${board.ref }"> <input
			type="hidden" name="re_level" value="${board.re_level }"> <input
			type="hidden" name="re_step" value="${board.re_step }"> <input
			type="hidden" name="pageNum" value="${pageNum }">
		<table border="1">
			<caption>
				<b>게시판</b>
			</caption>
			<tr>
				<th>제목</th>
				<td><c:if test="${board.num==0 }">
						<input type="text" name="subject" required="required">
					</c:if> <c:if test="${board.num!=0 }">
						<input type="text" name="subject" required="required" value="[답변]">
					</c:if></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"required="required"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="text" name="email"required="required"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"required="required"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="password2"required="required"></td>
			</tr>
			<tr>
				<th>분류선택</th>
				<td><select name="item_kind"required="required">
						<option value="">선택</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="all">all</option>
				</select></td>
			</tr>
			<tr>
				<th>물품명</th>
				<td><input type="text" name="item_name"required="required"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="item_price"required="required"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="text" name="item_count"required="required"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="item_image" size="16"
					maxlength="16" required="required"></td>
			</tr>
			<tr>
				<th>대여기간</th>
				<td><input type="date" name="startday"required="required">-<input
					type="date" name="endday"required="required"></td>
			</tr>
			<tr>
				<th>거래방법</th>
				<td><select name="trans_type"required="required">
						<option value="">선택</option>
						<option value="안전거래">안전거래</option>
						<option value="택배">택배</option>
						<option value="직접거래">직접거래</option>
				</select></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="30" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"><input
					type="reset" value="취소">
					<input type="button" value="글목록"
					onclick="location.href='list.do?pageNum=${pageNum}'"></td>
			</tr>


		</table>
	</form>
	</div>
	<jsp:include page="/module/bottom.jsp"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  </body>
</html>