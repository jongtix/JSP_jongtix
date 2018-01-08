<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<!-- 세션 invalidate()  -->
	<%
		session.invalidate();
	%>
	<script type="text/javascript">
		alert("로그아웃되었습니다.");
		window.location.href = 'loginform.html';
	</script>
</body>
</html>