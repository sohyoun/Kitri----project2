<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<%
	String root = request.getContextPath();
%>
<script>
$(function() {	
	$("button").click(function() {
		$.ajax({          
		  		url  : "<%=root%>/tourcate",
				type : 'get',
				success : function(xml) {
					/* console.log(xml.trim()); */
					parser = new DOMParser();
					xmlDoc = parser.parseFromString(xml.trim(), "text/xml");
					console.log(xmlDoc);
					/* xml 테스트 */
					var items = xmlDoc.getElementsByTagName("item");
					/* for (var i = 0; i < items.length; i++) {
						$("body").append(items[i].getElementsByTagName("contentid")[0].textContent);
						$("body").append(items[i].getElementsByTagName("contenttypeid")[0].textContent);
						$("body").append(items[i].getElementsByTagName("mapx")[0].textContent);
						$("body").append(items[i].getElementsByTagName("mapy")[0].textContent + '<br>');
					} */

					/* jquery 테스트 */
					var xmlData = $(xml).find("item");
					var listLength = xmlData.length;
					if (listLength) {
						var contentStr = "";
						$(xmlData).each(function() {
							contentStr += $(this).find("contentid").text();
						});
						console.log(contentStr)
						//                      $("#after").append(contentStr);
					}//end if
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax
	return false;
	});//end a.click

});
</script>

</head>
<body>
	<button>카테고리 얻어오기</button>
	<hr>
	버튼을 누르고 console을 확인해주세요.
	<br> 필수 입력값: MobileOS, MobileApp, ServiceKey
</body>
</html>