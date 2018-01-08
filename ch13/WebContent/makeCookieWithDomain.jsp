<%@page contentType="text/html; charset=UTF-8"%>
<%
 	Cookie cookie1 = new Cookie("id","madvirus");
    //url중 ".somehost.com"에 해당하는 서버로 쿠키를 모두 보냄
	cookie1.setDomain(".somehost.com");
    response.addCookie(cookie1); 
    
	Cookie cookie2 = new Cookie("only","onlycookie");
    response.addCookie(cookie2);
    
	Cookie cookie3 = new Cookie("invalid","invalidcookie");
	cookie3.setDomain("javacan.tistory.com");//특정 도메인 으로만 쿠키 전달
    response.addCookie(cookie3); 
%>
<html><body>
다음과 같이 쿠키를 생성했습니다.
<%=cookie1.getName()%>=<%=cookie1.getValue()%>
[<%=cookie1.getDomain()%>] 
<br>
<%=cookie2.getName()%>=<%=cookie2.getValue()%>
[<%=cookie2.getDomain()%>]
<br>
<%=cookie3.getName()%>=<%=cookie3.getValue()%>
[<%=cookie3.getDomain()%>]
<br>
</body></html>