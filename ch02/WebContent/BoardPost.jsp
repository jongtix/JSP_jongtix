<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기 결과</title>
</head>
<body>
	<h2>글쓰기 내용</h2>
	<%
		request.setCharacterEncoding("utf-8"); // 파라미터로 넘어온 객체의 문자셋을 현재 페이지에 맞게 설정
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//저장파일명에 날짜 시간 이름 붙이기
		Date date = new Date(); // 현재의 시스템 타임을 사용
		Long time = date.getTime(); // 시간
		String fileName = time + ".txt";
		String filePath = application.getRealPath("/WEB-INF/Board/" + fileName);// 파일 저장 경로 설정
		FileWriter writer = new FileWriter(filePath);
		try {
			String str = "제목 : " + title + "\r\n";
			str += "글쓴이 : " + name + "\r\n";
			str += "내용 : " + content;
			writer.write(str);
			out.print("저장 완료");
			out.print("파일 저장 경로 : " + filePath);
		} catch (IOException e) {
			out.print("파일에 데이터를 쓸 수 없습니다.");
		} finally {
			try {
				writer.close();
			} catch (Exception e1) {
				out.print(e1.getMessage());
			}
		}
	%>
</body>
</html>