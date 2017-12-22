<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!private PrintWriter logFile;

	public void jspInit() {
		String filename = "c:/data/datetime_log.txt";
		try {
			logFile = new PrintWriter(new FileWriter(filename));
		} catch (IOException e) {
			System.out.printf("%TT - %s파일을 열 수 없습니다.", new GregorianCalendar(), filename);
		}
	}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재의 날짜와 시간</title>
</head>
<body>
	<%
		GregorianCalendar now = new GregorianCalendar();
		String date = String.format("현재 날짜 : %TY년 %Tm월 %Te일", now, now, now); // 대소문자 구분
		String time = String.format("현재 시간 : %TI시 %TM분 %TS초", now, now, now);
		out.print(date + "<br>");
		out.print(time + "<br>");
		if (logFile != null) {
			logFile.printf("%TF %TT에 호출되었습니다.%n", now, now);
		}
	%>
</body>
</html>
<%!public void jspDestroy() {
		if (logFile != null) {
			logFile.close();
		}
	}%>