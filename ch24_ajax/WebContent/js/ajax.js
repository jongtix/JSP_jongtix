/**
 * 패키지
 */
var ajax = {}; // 객체 생성
ajax.xhr = {}; // 객체 생성
ajax.xhr.Request = function(url, params, callback, method) {
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.sendRequest();
}

ajax.xhr.Request.prototype = {
	getXMLHttpRequest : function() {
		if (window.ActiveXObject) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
		} else {
			return new XMLHttpRequest();
		}
	},
	sendRequest : function() {
		this.req = this.getXMLHttpRequest();
		var httpMethod = this.method ? this.method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}

		var httpParams = (this.params == null || this.params == "") ? null
				: this.params;
		var httpUrl = this.url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl += "?" + httpParams;
		}
		this.req.open(httpMethod, httpUrl, true);
		this.req.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
		var request = this;
		this.req.onreadystatechange = function() {
			request.onStateChange.call(request);
		}
		this.req.send(httpMethod == 'POST' ? httpParams : null);
	},
	onStateChange : function() {
		this.callback(this.req);
	}
};