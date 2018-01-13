<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 전송할 파일 정보 설정
	int maxSize = 5 * 1024 * 1024; // 5Mb
	String fileSave = "/fileSave";
	String realPath = getServletContext().getRealPath(fileSave);
	MultipartRequest multi = new MultipartRequest(request, // 전송할 request 객체
			realPath, // 전송할 경로
			maxSize, // 한번에 전송되는 최대 사이즈
			"utf-8", // 문자셋
			new DefaultFileRenamePolicy() // 파일 중복처리 방식
	);

	String user = multi.getParameter("user"); // 작성자
	String title = multi.getParameter("title"); // 제목

	// upload되는 파일명
	String name = "uploadFileName";
	String fileName = multi.getFilesystemName(name);

	// 로컬영역의 원래 파일명
	String originalName = multi.getOriginalFileName(name);

	// 전송될 파일의 내용 타입
	String type = multi.getContentType(name);
	// 전송될파일 속성이 file인 태그의 name 속성값을 이용한 파일 객체 생성
	File file = multi.getFile(name);
	out.print("파라미터 이름 : " + name + "<br>");
	out.print("실제 파일명 : " + originalName + "<br>");
	out.print("저장된 파일명 : " + fileName + "<br>");
	out.print("파일 크기 : " + file.length() + "<br>");
	out.print("파일 타입 : " + type + "<br>");
	out.print("작성자 : " + user + "<br>");
	out.print("제목 : " + title + "<br>");
%>