<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본객체 사용하여 자원읽기 (경로 getResource)</title>
</head>
<body>
	<%
		String resourcePath = "/message/notice.txt"; // uri(상대)경로로 읽어옴
		char[] buff = new char[128]; // 길이각 128인 char 배열
		int len = -1; // 입력값이 없으면 -1 리턴
		URL url = application.getResource(resourcePath);
		try {
			InputStreamReader br = new InputStreamReader(url.openStream(), "utf-8");
			// read(배열) => 읽은 배열의 길이 리턴, 입력값이 없으면 -1 리턴
			while ((len = br.read(buff)) != -1) {
				out.print(new String(buff, 0, len));
			}
		} catch (IOException ex) {
			out.print("예외 발생 : " + ex.getMessage());
		}
	%>
</body>
</html>