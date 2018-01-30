<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	   int result = (Integer)request.getAttribute("result");

       if(result>0){
    	   out.print("<script>");
    	   out.print("alert('수정성공');");
    	   out.print("location.href='list.do'");
    	   out.print("</script>");
       }else{
    	   out.print("<script>");
    	   out.print("alert('수정실패');");
    	   out.print("history.back();");
    	   out.print("</script>");
       }
%>