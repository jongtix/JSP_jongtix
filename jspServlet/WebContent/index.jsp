<%@ page contentType="text/html; charset=UTF-8"%>
<!-- JSP에서 사용되는 지시어  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
<!-- 외부 스타일 시트 파일 링크 -->
<link rel="stylesheet" type="text/css" href="./css/main.css">
<!-- 제이쿼리 라이브러리 링크 -->
<script src="./js/jquery.js"></script>
<!-- 현재 문서에 제이쿼리 문법을 사용하기 위한 링크 -->
</head>
<body>
	<div id="main_wrap">
		<!-- 상단 header 부분 -->
		<div id="header">
			<div id="logo">
				<!-- 로고 영역 -->
				<a href="index.jsp" onfocus="this.blur()"> <!-- this.blur()는 사각형 점선을 제거하는 역할 -->
					<img src="./images/logo.gif" border="0" />
				</a>
			</div>
			<div id="top_menu">
				<!-- 상단 메뉴 영역 -->
				<ul>
					<li><a href="#" onfocus="this.blur()">공지사항</a></li>
					<li><a href="./board/board_list.jsp" onfocus="this.blur()">게시판</a></li>
					<!-- 게시판을 클릭하면 해당 문서로 이동한다. -->
					<li><a href="./bbs/bbs_list.jsp" onfocus="this.blur()">자료실</a></li>
					<li><a href="#" onfocus="this.blur()">QnA</a></li>
				</ul>
			</div>
			<div id="top_login">
				<!-- 상단 로그인 영역 -->
				<ul>
					<li><a href="index.jsp" onfocus="this.blur()">홈 </a></li>
					<li><a href="#" onfocus="this.blur()">로그인 </a></li>
					<li><a href="#" onfocus="this.blur()">회원가입 </a></li>
				</ul>
			</div>
		</div>

		<div class="clear"></div>

		<!-- 본문 영역 -->
		<div id="article">
			<div id="left_menu">
				<script>
					// 자바스크립트 영역
					function login_check() { // id와 password 검증 함수
						// 자바스크립트를 이용한 방식
						if (window.document.f.id.value == "") {
							alert("아이디를 입력하세요.");
							f.id.focus();
							return false;
						}
						// 제이쿼리를 이용한 방식
						if ($.trim($("#pwd").val()) == "") {
							alert("비번을 입력하세요.");
							$("#pwd").val("").focus();
							return false;
						}
					}
					/* 공지창 띄우기 */
					function pwd_find() {
						window.open("./member/pwd_find.jsp", "비번찾기",
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
						<tr>
							<!-- 1행을 작성하는 태그 -->
							<th>아이디</th>
							<!-- th 태그는 제목 열을 작성할 경우 -->
							<td><input type="text" name="id" id="id" size="14"
								class="input_box"> <!-- input type="text" 속성은 키보드로 데이터를 입력할 
                                                     수 있는 태그이다. type="text"는 생략이 가능 -->
							</td>
						</tr>
						<tr>
							<!-- 2행을 작성하는 태그 -->
							<th>비밀번호</th>
							<!-- th 태그는 제목 열을 작성할 경우 -->
							<td><input type="password" name="pwd" id="pwd" size="14"
								class="input_box"> <!-- input type="password" 속성은 키보드로 데이터를 입력할 
                                                     경우 암호문으로 표시된다. -->
							</td>
						</tr>
					</table>
					<div id="login_menu">
						<input type="submit" value="로그인" class="input_b" /> <input
							type="button" value="비번찾기" onClick="pwd_find()" class="input_b" />
						<!-- [비번찾기] 버튼을 클릭하면 pwd_find()함수를 호출하여 
                                  비빈을 찾을 수 있도록 한다.  -->
					</div>
				</form>
			</div>
			<div id="article_c">
				<p class="artcle_cont">메인 내용</p>
			</div>
		</div>
		<div class="clear"></div>

		<!-- 꼬리말 영역  -->
		<div id="footer">
			<h2 class="footer_title">서울시 용산구 용산 첨단 디지털 단지 3차 3077호 TEL)
				02)123-4567, FAX) 02-000-1010</h2>
		</div>
	</div>
</body>
</html>











