<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Enumeration attr = session.getAttributeNames();
   while(attr.hasMoreElements()){
	   String attrName = (String)attr.nextElement();
	   String attrValue= (String)session.getAttribute(attrName);
	   out.print("세션의 이름은:"+attrName+"이고<br>");
	   out.print("세션 이름"+attrName+" 에 해당하는 값은:"+attrValue+"<br>");	   
   }
%>