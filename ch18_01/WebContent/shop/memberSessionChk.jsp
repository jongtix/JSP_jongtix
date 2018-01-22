
<%
	String memberId = "";
	/* 어플리케이션의 전체 경로 */
	String path = application.getContextPath();
	memberId = (String) session.getAttribute("id");
	if (memberId == null || memberId.equals("")) {
		out.print("<script>alert('로그인을 하셔야 쇼핑을 할 수 있습니다.');</script>");
		response.sendRedirect(path + "/shop/shopMain.jsp");
	}
%>