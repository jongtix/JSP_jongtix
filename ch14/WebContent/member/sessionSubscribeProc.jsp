<%@page import="dao.MemberDao1"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="model.Member"/>
<jsp:setProperty property="*" name="member"/>
<%
    /* 회원가입 처리 */
     MemberDao1 dao = new MemberDao1();
      out.print(member.getId());
     int result= dao.insertMember(member);
      if(result>0){
		session.setAttribute("member", member);
		response.sendRedirect("sessionSubscribeResult.jsp");
      }else{
		out.print("<script>");
		out.print("alert('입력실패!');");
		out.print("history.back();");
		out.print("</script>");
      } 	  
%>