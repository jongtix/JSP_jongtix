<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비번 찾기</title>
  <!-- 외부 스타일 시트 파일 링크 -->
  <link rel="stylesheet" type="text/css" href="../css/member.css">
  <!-- 제이쿼리 라이브러리 링크 -->
  <script src="../js/jquery.js"> </script>
  <script>
    function pwd_check(){ // 비번 찾기 데이터 검증 함수
    	/*회원의 비번은 아이디 와 이름으로 조회할 수 있다. */
    	if($.trim($("#pwd_id").val())==""){
    		alert("아이디를 입력하세요.");
    		$("#pwd_id").val("").focus();
    		return false;
    	}
    	if($.trim($("#pwd_name").val())==""){
    		alert("회원 이름을 입력하세요.");
    		$("#pwd_name").val("").focus();
    		return false;
    	}	
    }
  </script>  
</head>
<body>
    <div id="pwd_wrap">
       <h2 class="pwd_title">비번 찾기</h2>
       <form name="f" method="post" action="pwd_find.do"
             onsubmit="return pwd_check()">
         <table id="pwd_t">
           <tr>
              <th>아이디</th>
              <td> <input type="text" name="pwd_id" id="pwd_id"
                     size ="14"/>
               </td>
           </tr>
           <tr>
              <th>회원이름</th>
              <td> <input type="text" name="pwd_name" id="pwd_name"
                     size ="14"/>
               </td>
           </tr> 
         </table>
         <div id="pwd_menu">
           <input type="submit" value="찾기" />
           <input type="reset" value="취소"
                  onClick="$('#pwd_id').focus();"/>
            <!-- 취소 버튼을 클릭한 경우 pwd_id 텍스트 상자로 커서를 이동시킨다. -->
            <!-- 제이쿼리를 인라인 방식으로 삽입한 방식 -->
         </div>
       </form>      
    </div>
</body>
</html>











