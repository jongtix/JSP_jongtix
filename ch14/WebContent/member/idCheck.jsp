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
/* DBMS에서 집계함수(count(),sum(),avg()) 는 null값이 없음 
   - 건수가 없으면 0, 있으면 건수를 리턴 */
String sql = "select count(*) from member2 where id=?";
ResultSet rs = null;
//파라미터 받기
String id = request.getParameter("id");

 try{
	 Context init = new InitialContext();
	 DataSource ds 
	     = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
	 conn = ds.getConnection();
	 
		pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);

	    rs = pstmt.executeQuery();
	    if(rs.next()){
	    	/* 집계함수로 조회된 데이타의 값 비교 없으면 0  */
	    	 if(rs.getInt(1)==0){
	    	out.print("<script>");
	    	out.print("alert('사용할수 있는 id입니다.');");
	    	/* 부모창의 특정요소에 값 지정
	    		window.opener.frm.요소명.속성;
	    	*/
	    	out.print("window.opener.frm.password.focus();");
	    	/* 자기자신을 닫을 때 window.self.close() */
	    	out.print("window.self.close();");
	    	out.print("</script>");
	    	}else{/* 있으면 결과값은 > 0 */
	    		out.print("<script>");
		    	out.print("alert('사용할수 없는 id입니다.');");
		    	/* 부모창의 특정요소에 값 지정
	    		window.opener.frm.요소명.속성;
	    	    */
		    	out.print("window.opener.frm.id.value='';");
		    	out.print("window.opener.frm.id.focus();");		    	
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