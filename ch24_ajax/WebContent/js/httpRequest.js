var httpRequest = null;

function getHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	} else {
		return new XMLHttpRequest();
	}
}

// sendRequest(경로, 파라미터, 콜백함수, 전송방식)
function sendRequest(url, params, callback, method) {
	httpRequest = getHttpRequest();
	var httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}

	var httpParams = (params == null || params == "") ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl += "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader('Content-type',
			'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
}

function log(msg) {
	var con = document.getElementById('console');
	if (msg != null) {
		con.innerHTML += msg + "<br>";
	}
}