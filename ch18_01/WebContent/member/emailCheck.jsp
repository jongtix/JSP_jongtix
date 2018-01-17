<%@page import="dao.MemberDao1"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String email = request.getParameter("email");

	MemberDao1 dao = MemberDao1.getInstance();
	int result = dao.emailCheck(email); // email이 존재하지 않으면 1, 존재하면 2(사용불가)

	if (result == 1) {
		out.print("<script>");
		out.print("alert('사용할 수 있는 email입니다.');");
		out.print("window.self.close();");
		out.print("</script>");
	} else if (result == 2) {
		out.print("<script>");
		out.print("alert('사용할 수 없는 email입니다.');");
		out.print("window.opener.frm.emailId.value='';");
		out.print("window.opener.frm.emailId.focus();");
		out.print("window.self.close();");
		out.print("</script>");
	}
%>