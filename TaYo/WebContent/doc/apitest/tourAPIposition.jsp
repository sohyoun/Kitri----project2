<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>

$(function() {
	var xhr = new XMLHttpRequest();
	var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'k5EXfZI2TpJSTBIMzczHGdJ7mCb%2Fh6d9TdvqF6scwSylPdfUG%2FRj%2FceWuVcQhBuxPzR9oBAz9w%2Fq6bHhHOLCuQ%3D%3D'; /*Service Key*/
	// queryParams += '&' + encodeURIComponent('ServiceKey') + '=' + encodeURIComponent('인증키 (URL- Encode)'); /*공공데이터포털에서 발급받은 인증키*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('12'); /*한 페이지 결과 수*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*현재 페이지 번호*/
	queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰), ETC*/
	queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /*서비스명=어플명*/
	queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /*(A=제목순, B=조회순, C=수정일순, D=생성일순, E=거리순)*/
	queryParams += '&' + encodeURIComponent('contentTypeId') + '=' + encodeURIComponent('15'); /*관광타입(관광지, 숙박 등) ID*/
	queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('126.981611'); /*GPS X좌표(WGS84 경도 좌표)*/
	queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('37.568477'); /*GPS Y좌표(WGS84 위도 좌표)*/
	queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('2000'); /*거리 반경(단위m), Max값 20000m=20Km*/
	queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /*목록 구분 (Y=목록, N=개수)*/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
//	         alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders())+' Body: '+this.responseText);
	        var xml = this.responseXML;
	        console.log(this);

			console.log('xml'+xml);  
			console.log(xml);  
			
			var items= xml.getElementsByTagName('item');
			var nodes= items[0].childNodes;
			var nodeNames='';
			for(var i =0; i<nodes.length ; i++){
				nodeNames+=nodes[i].nodeName+' ';
			}
			$("body").append(nodeNames+'<br>');
			for(var i =0; i<items.length; i++){
				$("body").append(i+' '+items[i].getElementsByTagName('title')[0].textContent+' ');
				$("body").append(i+' '+items[i].getElementsByTagName('mapx')[0].textContent+' ');
				$("body").append(i+' '+items[i].getElementsByTagName('mapy')[0].textContent+' ');
				$("body").append(items[i].getElementsByTagName('contentid')[0].textContent+'<br>');
			}
	    }
	};

	xhr.send('');
});

</script>
</head>
<body>

</body>
</html>