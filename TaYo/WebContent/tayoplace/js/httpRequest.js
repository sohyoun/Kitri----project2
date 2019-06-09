function getXMLHttpRequest(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e1){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
}//서버와 통신가능한 자바스크립트의 객체입니다.

var httpRequest = null;

function sendRequest(url, params, callback, method){
	httpRequest = getXMLHttpRequest();
	
	var httpMethod = method ? method : 'GET'; //
	if(httpMethod != 'GET' && httpMethod != 'POST'){
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if(httpMethod == 'GET' && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	//alert("method == " + httpMethod + "\turl == " + httpUrl + "\tparam == " + httpParams);
	httpRequest.open(httpMethod, httpUrl, true);//비동기적인 방식으로 연결해라.
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.onreadystatechange = callback;//readtstate 가 바뀔때마다 callback하라
	//
	//alert(httpMethod == 'POST' ? httpParams : null);
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);//post방식은 send라는 함수 안에 넣어보내기
}