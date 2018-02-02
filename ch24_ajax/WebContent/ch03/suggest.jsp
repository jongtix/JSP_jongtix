<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!/* 선언부: 전역변수 선언, 함수 선언 */
	String[] keywords = { "AJAX", "AJAX프로그래밍", "자바", "자바프로그래밍", "자 아아아아", "JSP", "JAVA" };

	public List<String> search(String key) {
		if (key == null || key.equals("")) {
			return Collections.EMPTY_LIST;
		}
		String keyword = key.toUpperCase();
		List<String> list = new ArrayList<>();
		for (int i = 0; i < keywords.length; i++) {
			if (keywords[i].startsWith(keyword)) {
				list.add(keywords[i]);
			}
		}
		return list;
	}%>
<%
	request.setCharacterEncoding("utf-8");
	String key = request.getParameter("keyword");
	List<String> list = search(key);
	out.print(list.size() + "|");
	for (int i = 0; i < list.size(); i++) {
		out.print(list.get(i));
		if (i != (list.size() - 1)) {
			out.print(", ");
		}
	}
%>