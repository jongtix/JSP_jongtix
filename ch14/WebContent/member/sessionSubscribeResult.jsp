<%@page import="model.Member"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
회원id:${member.id}<br>
회원이름:${member.name}<br>
회원주소:${member.address}<br>
회원생일:${member.birth}<br>
회원전화번호:${member.tel}<br>
회원email:${member.email}<br><br>
<a href="loginform.html">로그인 하기</a>
