<%@page import="model.Member"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member) session.getAttribute("member");
%>
ID : ${member.id}
<br>
이름 : ${member.name}
<br>
주소 : (${member.zipno}) ${member.address1} ${member.address2}
<br>
전화번호 : ${member.tel}
<br>
E-mail : ${member.email}
<br>
<br>
<a href="loginform.html">로그인 하기</a>
