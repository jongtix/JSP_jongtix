<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 예제</title>
</head>
<body>
	<!-- 파일은 사이즈가 크므로 전송방식이 body에 데이터를 묶어서 보내는 post방식으로 지정해야함 -->
	<form action="fileUploadProc.jsp" method="post"
		enctype="multipart/form-data" name="fileForm">
		작성자 : <input type="text" name="user"><br> 제목 : <input
			type="text" name="title"><br> 파일명 : <input type="file"
			name="uploadFileName"><br> <input type="submit"
			value="파일 올리기">
	</form>
</body>
</html>