<%@ page contentType="text/html; charset=UTF-8"%>
<!-- JSP에서 사용되는 지시어  -->    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
 <!-- 외부 스타일 시트 파일 링크 --> 
 <link rel="stylesheet" type="text/css" href="../css/main.css">
 <!-- 제이쿼리 라이브러리 링크 -->
 <script src="../js/jquery.js"></script>
 <!-- 현재 문서에 제이쿼리 문법을 사용하기 위한 링크 -->
</head>
<body>
 <div id="main_wrap">
  <!-- 상단 header 부분 -->
    <div id="header">
       <div id="logo"> <!-- 로그 영역 -->
         <a href="../index.jsp" onfocus="this.blur()">
           <!-- this.blur()는 사각형 점선을 제거하는 역할 -->
           <img src="../images/logo.gif" border="0"/>  
         </a>
       </div>
       <div id="top_menu"> <!-- 상단 메뉴 영역 -->
         <ul>
           <li> <a href="#" onfocus="this.blur()"> 공지사항</a></li>
           <li> <a href="../board/board_list.jsp" 
           		onfocus="this.blur()"> 게시판</a></li>
           <li> <a href="../bbs/bbs_list.jsp" 
          	 	onfocus="this.blur()"> 자료실</a></li>
           <li> <a href="#" onfocus="this.blur()"> QnA</a></li>
         </ul>
       </div>
       <div id="top_login"> <!-- 상단 로그인 영역 -->
         <ul>
          <li><a href="../index.jsp" onfocus="this.blur()">홈 </a></li>
          <li><a href="#" onfocus="this.blur()">로그인 </a></li>
          <li><a href="#" onfocus="this.blur()">회원가입 </a></li>
         </ul>       
       </div>
    </div> 
    
    
    
    
    
    