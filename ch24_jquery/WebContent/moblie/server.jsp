<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div data-role="page">
		<div data-role="header">
			<h1>입력 결과</h1>
		</div>

		<div data-role="content" class="content">
			이름:
			<%=request.getParameter("name")%><p>
				주소:
				<%=request.getParameter("addr")%>
			<p>
		</div>
	</div>
</body>
</html>