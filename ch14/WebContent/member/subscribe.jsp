<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<%
   String ok = request.getParameter("ok");
   if(ok==null){
	   out.print("<script>");
	   out.print("alert('개인정보 정책에 동의하셔야합니다.');");
	   out.print("window.location.href='joinProc2.jsp';");
	   out.print("</script>");
   }
%>
<title>회원가입 화면</title>
<script type="text/javascript">
 function chk(){
	 var id = document.getElementById('id');
	 var pwd = document.getElementById('password');
	 var pwd2 = document.getElementById('password2');
	 if(!id.value){ alert("ID를 입력하세요");
		 			id.focus();
		 			return false; }
	 if(!pwd.value){ alert("패스워드를 입력하세요");
		 			 pwd.focus();
		 			 return false; }
	 if(!pwd2.value){ alert("패스워드확인을 입력하세요");
		 			  pwd2.focus();
		 			  return false; }
	 if(pwd.value!=pwd2.value){
		 alert("입력값이 서로 다릅니다.");
		 pwd.value="";
		 pwd2.value="";
		 pwd.focus();
		 return false;
	 }
	 return true;
 }
</script>
<script type="text/javascript">
function open_chk(){
	var id = document.getElementById('id').value;
	if(id.length==0){
		alert("id를 입력하세요");
		document.getElementById('id').focus();
		return ;
	}
	//팝업윈도우 호출(BOM)
	//window.open(파일명,"title",속성);
	//여기(subscribe.jsp)가 부모(opener)가 됨.
	window.open("idCheck.jsp?id="+id,"idchk","height=100,width=450,resize=yes");
} //idCheck.jsp?id=dd
</script>
<script type="text/javascript">
function open_emailChk(){
	var email = document.getElementById('email').value;
	if(email.length==0){
		alert("email을 입력하세요");
		document.getElementById('email').focus();
		return;
	}
	window.open("emailCheck.jsp?email="+email,"emailchk","height=100,width=450,resize=yes");
}
</script>
</head>
<body>
<form action="sessionSubscribeProc.jsp" onsubmit="return chk()" name="frm">
	<table border=1 bgcolor="yellow">
	<tr><td>*ID:</td><td><input type="text" name="id" id="id" >
				<input type="button" name="isId" id="isId" value="IDcheck" 
				       onclick="open_chk()">
	</td>
	</tr>
	<tr><td>*PASSWORD</td>
	    <td><input type="password" name="password" id="password"></td>
	</tr>
	<tr><td>PASSWORD확인</td>
	    <td><input type="password" name="password2" id="password2"></td>
	</tr>
	<tr><td>*이름</td><td><input type="text" name="name" id="name" required></td>
	</tr>
	<tr><td>생일</td><td><input type="date" name="birth" id="birth"></td>
	</tr>
	<tr><td>*주소</td><td><input type="text" name="address" id="address" required></td>
	</tr>
	<tr><td>tel</td><td><input type="text" name="tel" id="tel"></td>
	</tr>
	<tr><td>*email</td><td><input type="email" name="email" id="email" required>
	<input type="button" name="isEmail" id="isEmail" value="EmailCheck" onclick="open_emailChk()"></td>
	</tr>
	<tr>
		<td colspan=2 align="center"><input type="submit" value="확인">
		                             <input type="reset" value="다시작성">
		 </td>
	</tr>
	
	</table>
</form>
</body>
</html>