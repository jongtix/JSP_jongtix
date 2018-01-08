<%@ page contentType="text/html; charset=UTF-8"%>

<!-- include는 외부 파일을 추가하는 역할을 한다. -->
<%@ include file="../include/header.jsp" %>

    <div id="article">
       <div id="left_menu">
          <script>
           // 자바스크립트 영역
           function login_check(){ // id와 password 검증 함수
        	   // 자바스크립트를 이용한 방식
        	   if(window.document.f.id.value==""){
        		   alert("아이디를 입력하세요.");
        		   f.id.focus();
        		   return false;
        	   }
              // 제이쿼리를 이용한 방식
              if($.trim($("#pwd").val())==""){
            	  alert("비번을 입력하세요.");
            	  $("#pwd").val("").focus();
            	  return false;
              }
           }
           /* 공지창 띄우기 */
           function pwd_find(){
        	   window.open("../member/pwd_find.jsp", "비번찾기",
        			"width =300px, height=300px");
        	   // 공지창에 보일 파일은  pwd_find.jsp, 공지창 이름 "비번찾기"
        	   // 공지창의 폭과 높이는 300픽셀, 300 픽셀
           }
          </script>
         <form name="f" method="post" action="http://www.naver.com"
               onsubmit="return login_check()">
          <!-- form 태그는 사용자가 입력한 데이터를 서버로 전송하는 태그
               name은 폼 이름, method 데이터 전송방식(get/post)
               onsubmit 속성은 데이터 전송 전에 데이터를 검증하는 함수 호출 -->
            <table id="login_t">
              <tr>  <!-- 1행을 작성하는 태그 -->
               <th> 아이디 </th>  <!-- th 태그는 제목 열을 작성할 경우 -->
               <td> <input type="text" name="id" id="id" size="14"
                     class="input_box">
                 <!-- input type="text" 속성은 키보드로 데이터를 입력할 
                                                     수 있는 태그이다. type="text"는 생략이 가능 -->
               </td>
             </tr>                                             
             <tr>  <!-- 2행을 작성하는 태그 -->
               <th> 비밀번호 </th>  <!-- th 태그는 제목 열을 작성할 경우 -->
               <td> <input type="password" name="pwd" 
                           id="pwd" size="14" class="input_box">
                 <!-- input type="password" 속성은 키보드로 데이터를 입력할 
                                                     경우 암호문으로 표시된다. -->
               </td>
             </tr>
            </table>
            <div id="login_menu">
              <input type="submit" value="로그인" class="input_b"/>
              <input type="button" value="비번찾기" 
                     onClick="pwd_find()" class="input_b"/>
              <!-- [비번찾기] 버튼을 클릭하면 pwd_find()함수를 호출하여 
                                  비빈을 찾을 수 있도록 한다.  -->
            </div>                     
         </form>
       </div>
       <div id="article_c">
          <p class="artcle_cont"> 
          <font color="red" size ="4">여기는 게시판 영역입니다. </font></p>  
       </div>
     </div> 

<%@ include file="../include/footer.jsp" %>
