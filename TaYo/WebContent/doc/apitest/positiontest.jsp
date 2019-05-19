<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%String root= request.getContextPath(); %>
<script>
// 참고: https://api.jquery.com/jQuery.parseXML/
$(function() {
	$("a").click(function() {
		$.ajax({          
		    url: '<%=root%>/tourAPI',
		    type: 'get',
		    data:{
		     	x: "126.981611",
		    	y: "37.568477", 
		    	radius: "2000" /* 반경 (m) */
		    },
		    success: function(xml){
		    	/* console.log(xml.trim()); */
		    	
		    	parser = new DOMParser();
		    	xmlDoc = parser.parseFromString(xml.trim(),"text/xml");
		    	console.log(xmlDoc);
		    	/* xml 테스트 */
		    	var items= xmlDoc.getElementsByTagName("item");
		    	for(var i=0; i<items.length; i++){
		    		$("body").append(items[i].getElementsByTagName("title")[0].textContent);
		    		$("body").append(items[i].getElementsByTagName("mapx")[0].textContent);
		    		$("body").append(items[i].getElementsByTagName("mapy")[0].textContent);
		    	}
		    	
		    	/* jquery 테스트 */
		    	 var xmlData = $(xml).find("item");
                    var listLength = xmlData.length;
                    if (listLength) {
                        var contentStr = "";
                        $(xmlData).each(function(){
                            contentStr += "[기호 "+ $(this).find("title").text() +"] "
                                          + $(this).find("mapx").text() + "후보(" 
                                          + $(this).find("mapy").text() + ")</br>";
                        });
                        console.log(contentStr)
//                      $("#after").append(contentStr);
                    }
		    },//end success
		    error: function(err) {
				console.log(err);
			}
		});//end ajax
		return false;
	});//end a.click
	
});

  
</script>
</head>
<body>
<a href="#">데이터 불러오기</a> 
</body>
</html>