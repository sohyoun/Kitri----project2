<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }    
}

$(function() {
	var os = $("form>select[name=os]").val();
	console.log(os);
	var numOfRows = $("form>input[name=numOfRows]").val();
	console.log(numOfRows);
	var pageNo = $("form>input[name=pageNo]").val();
	console.log(pageNo);
	
	$("form.tourXML").click(function() {		
		/* var numOfRows= $("input[name=numOfRows]").val(window.navigator); */
		
		var xhr = new XMLHttpRequest();
		var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon'; /*URL*/
		var queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + 'k5EXfZI2TpJSTBIMzczHGdJ7mCb%2Fh6d9TdvqF6scwSylPdfUG%2FRj%2FceWuVcQhBuxPzR9oBAz9w%2Fq6bHhHOLCuQ%3D%3D'; /*Service Key*/
// 		queryParams += '&' + encodeURIComponent('ServiceKey') + '='+ encodeURIComponent('k5EXfZI2TpJSTBIMzczHGdJ7mCb%2Fh6d9TdvqF6scwSylPdfUG%2FRj%2FceWuVcQhBuxPzR9oBAz9w%2Fq6bHhHOLCuQ%3D%3D'); /*공공데이터포털에서 발급받은 인증키*/
		queryParams += '&' + encodeURIComponent('numOfRows') + '='+ encodeURIComponent('10'); /*한 페이지 결과 수*/
		queryParams += '&' + encodeURIComponent('pageNo') + '='
				+ encodeURIComponent('1'); /*현재 페이지 번호*/
		queryParams += '&' + encodeURIComponent('MobileOS') + '='
				+ encodeURIComponent('ETC'); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰),ETC*/
		queryParams += '&' + encodeURIComponent('MobileApp') + '='
				+ encodeURIComponent('AppTest'); /*서비스명=어플명*/
		queryParams += '&' + encodeURIComponent('contentId') + '='
				+ encodeURIComponent('126508'); /*콘텐츠ID*/
		queryParams += '&' + encodeURIComponent('contentTypeId') + '='
				+ encodeURIComponent(''); /*관광타입(관광지, 숙박 등) ID*/
		queryParams += '&' + encodeURIComponent('defaultYN') + '='
				+ encodeURIComponent('Y'); /*기본정보 조회여부*/
		queryParams += '&' + encodeURIComponent('firstImageYN') + '='
				+ encodeURIComponent('Y'); /*원본, 썸네일 대표이미지 조회여부*/
		queryParams += '&' + encodeURIComponent('areacodeYN') + '='
				+ encodeURIComponent('Y'); /*지역코드, 시군구코드 조회여부*/
		queryParams += '&' + encodeURIComponent('catcodeYN') + '='
				+ encodeURIComponent('Y'); /*대,중,소분류코드 조회여부*/
		queryParams += '&' + encodeURIComponent('addrinfoYN') + '='
				+ encodeURIComponent('Y'); /*주소, 상세주소 조회여부*/
		queryParams += '&' + encodeURIComponent('mapinfoYN') + '='
				+ encodeURIComponent('Y'); /*좌표 X,Y 조회여부*/
		queryParams += '&' + encodeURIComponent('overviewYN') + '='
				+ encodeURIComponent('Y'); /*콘텐츠 개요 조회여부*/
		xhr.open('GET', url + queryParams);
				//XMLHttpRequest
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
// 				alert('Status: ' + this.status + ' Headers: '
// 						+ JSON.stringify(this.getAllResponseHeaders()) + ' Body: '
// 						+ this.responseText);
				
// 				$("body").append(this.responseText); 
				 console.log(this); 
				/* console.log(this.responseText); */
				
				var xml = this.responseXML;
				
				var str= "";
				str += "addr1: " +xml.getElementsByTagName("addr1")[0].childNodes[0].nodeValue+"<br>";
				str += "addr2: " +xml.getElementsByTagName("addr2")[0].childNodes[0].nodeValue+"<br>";
				str += "homepage: " +xml.getElementsByTagName("homepage")[0].childNodes[0].nodeValue+"<br>";
				str += "mapx: " +xml.getElementsByTagName("mapx")[0].childNodes[0].nodeValue+"<br>";
				str += "mapy: " +xml.getElementsByTagName("mapy")[0].childNodes[0].nodeValue+"<br>";
				$("body").append(str);
			}
		};//end onreadystatus
 		xhr.send();
		return false;
	});//end submit
	
});

	
</script>

</head>
<body>

<form class ="tourXML">
한페이지 결과 수: <input type="number" name="numOfRows" min="1" maxlength="4" value="1" oninput="maxLengthCheck(this)"><br>
페이지 번호: <input type="number" name="pageNo" min="1" maxlength="4" value="1"  oninput="maxLengthCheck(this)"><br>
OS 구분: 
<select name="os">
  <option  value="ETC" selected="selected">ETC</option>
  <option  value="AND">AND</option>
  <option  value="IOS">IOS</option>
</select>
<br>
<button >값 얻어오기</button>
<br>
</form>

<hr>

</body>
</html>