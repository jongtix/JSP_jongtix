	// calendar 함수
	function calendar(new_year, new_month){
		// 특정 年月을 시작일부터 조회(year, month, date)
		var	d = new Date(new_year, new_month-1, 1),
		    // 월별 일수 구하기
		    d_length = 32 - new Date(new_year, new_month-1, 32).getDate(),
		    year = d.getFullYear(),
		    month = d.getMonth(),
		    date = d.getDate(),
		    day = d.getDay();

		// caption 영역 날짜 표시 객체
		var caption_year = document.querySelector('.year'),
		    caption_month = document.querySelector('.month');

		var start_day = document.querySelectorAll('tr td');

		// 테이블 초기화
		for(var i = 0; i < start_day.length; i++){
			start_day[i].innerHTML = '&nbsp;';
		}
        
		var request = new Request();
		var enumArr = new Array();
		 enumArr = request.getParameterValues();

		// 한달치 날짜를 테이블에 시작 요일부터 순서대로 표시
		for(var i = day; i < day + d_length; i++){
			var cal_date = year+"-"+month+"-"+date;
		/*	alert(year);
			alert(month);*/
			if(parseInt(enumArr[i+1])==1){
		  start_day[i].innerHTML 
		  = "<input type='button' " +
		  		" style='width:30px;height:35px;background-size:cover;background-image:url(images/check.gif);' " +
		  		" onclick = 'chk("+year+","+(month+1)+","+date+")' value="+date+">";
			}else{
				start_day[i].innerHTML 
				  = "<input type='button'  style='width:30px;height:35px;' onclick = 'chk("+year+","+(month+1)+","+date+")' value="+date+">";
			}
		  date++;
		}

		// caption 날짜 표시
		caption_year.innerHTML = year;
		caption_month.innerHTML = month + 1;		
	}
	function chk(year,month,date){
		location.href="dailyCheck.jsp?year="+year+"&month="+month+"&date="+date;
	}

	function Request(){
		var requestParam="";
		//getParameter 함수
		this.getParameter = function(param){
			//현재 주소를 decoding
			var url = unescape(location.href);
			console.log(url);
			//파라미터 자르고, 다시 & 분자를 잘라서 배열에 넣음.
			var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
			console.log(paramArr);
			for(var i=0;i<paramArr.length;i++){
				var temp = paramArr[i].split("=");//파라미터 변수명을 담음
				console.log(temp);
				if(temp[0].toUpperCase() == param.toUpperCase()){
					//변수명과 일치할 경우 데이터 삽입
					requestParam = paramArr[i].split("=")[1];
					console.log(requestParam);
					break;
				}
			}
			return requestParam;
		};
		
		this.getParameterValues = function(){
			//현재 주소를 decoding
			var url = unescape(location.href);
			console.log(url);
			//파라미터 자르고, 다시 & 분자를 잘라서 배열에 넣음.
			var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
			console.log(paramArr);
			var Aray = new Array();
			for(var i=0;i<paramArr.length;i++){
				var temp = paramArr[i].split("=");//파라미터 변수명을 담음
				console.log(temp);
					//변수명과 일치할 경우 데이터 삽입
					//alert(temp[i]);
					requestParam1 = paramArr[i].split("=")[0];
					requestParam2 = paramArr[i].split("=")[1];
					Aray[i] = paramArr[i].split("=")[1];
					console.log(Aray[i]);
			}
			return Aray;
		};
		
	}
	
	(function(){
		var prev = document.getElementById('prev'),
			next = document.getElementById('next'),
			year = new Date().getFullYear(),
			month = new Date().getMonth() + 1;
		var cal = document.getElementById('calendar');
		calendar(year, month);
	})();
