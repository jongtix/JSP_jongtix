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
Connection  conn = null;

PreparedStatement pstmt=null;
String sql = "select count(*) from member2info where email=?";
ResultSet rs = null;
//파라미터 받기
String email = request.getParameter("email");

 try{
	 Context init = new InitialContext();
	 DataSource ds 
	     = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
	 conn = ds.getConnection();
	 
	   //3단계 - 1.쿼리 객체 설정
		pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, email);

	    rs = pstmt.executeQuery();
	    if(rs.next()){
	    	 if(rs.getInt(1)==0){
	    	out.print("<script>");
	    	out.print("alert('사용할수 있는 email입니다.');");
	    	out.print("window.self.close();");
	    	out.print("</script>");
	    	}else{
	    		out.print("<script>");
		    	out.print("alert('사용할수 없는 email입니다.');");
		    	out.print("window.opener.frm.email.value='';");
		    	out.print("window.opener.frm.email.focus();");
		    	out.print("window.self.close();");
		    	out.print("</script>");
	    	}
	    }
}catch(Exception e){
	out.print(e.getMessage());
}finally{
	try{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}catch(Exception e){
		out.print(e.getMessage());
	}
} 
%>