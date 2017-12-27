<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 레이아웃</title>
</head>
<body>
	<table width="400" border=1 cellspacing=0 cellpadding=0>
		<tr>
			<td colspan=2><jsp:include page="/module/top.jsp" /></td><!-- 동일한 상단 메뉴 -->
		</tr>
		<tr>
			<td width="100" valign="top"><jsp:include
					page="/module/left.jsp" /></td><!-- 동일한 navi부분 -->
			<td width="300" valign="top"><!-- 다른 페이지 -->
				<!-- 내용 부분 시작 --> 레이아웃 1 <br> <br> <br> <!-- 내용 부분 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan=2><jsp:include page="/module/bottom.jsp" /></td><!-- 동일한 하단 메뉴 -->
		</tr>
	</table>
</body>
</html>