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
	String sql = "select count(*) from member2 where id=?";

	//파라미터 받기
	String id = request.getParameter("id");

	try {
		MemberDao1 dao = MemberDao1.getInstance();
		int result = dao.userCheck(id);
		if (result == 2) {
			out.print("<script>");
			out.print("alert('사용할 수 있는 id입니다.');");
			/* 부모창의 특정요소에 값 지정
				window.opener.frm.요소명.속성;
			*/
			out.print("window.opener.frm.password.focus();");
			/* 자기자신을 닫을 때 window.self.close() */
			out.print("window.self.close();");
			out.print("</script>");
		} else {/* 있으면 결과값은 > 0 */
			out.print("<script>");
			out.print("alert('사용할 수 없는 id입니다.');");
			/* 부모창의 특정요소에 값 지정
			window.opener.frm.요소명.속성;
			*/
			out.print("window.opener.frm.id.value='';");
			out.print("window.opener.frm.id.focus();");
			out.print("window.self.close();");
			out.print("</script>");
		}
	} catch (Exception e) {
		out.print(e.getMessage());
	}
%>