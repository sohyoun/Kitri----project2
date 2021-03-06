<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	var isfilter;
	$(function() {
		//도시버튼 추가 (글자, 이벤트)
		$.ajax({
			url : "${pageContext.request.contextPath}/tourresioncode",
			type : 'get',
			success : function(xml) {
				/* 콘솔확이용 xml 파싱*/
				xmlParser = new DOMParser(); // DOMParser console 확인용 객체 생성.
				xmlDoc = xmlParser.parseFromString(xml, "text/xml");
				console.log('-xml 파시용 데이터-');
				console.log(xml);
				/* jquery*/
				var xmlData = $(xml).find("item");//아이템 배열
				
				for(var i =0;i<xmlData.length; i++){
					$('#destinations > div > div.container.h-100.pt-3 > table > tbody > tr:nth-child(1) > td.filter_body.si > div.allways_show').append(
							'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					
				}
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax 도시버튼 추가
		
		
		
		
		//도시버튼 클릭 이벤트 추가(동적)// > div.allways_show >
		$(document).on("click", "#destinations > div > div.container.h-100.pt-3 > table > tbody > tr > td.filter_body.si  button",function() {
			console.log(this);
			var div= $(this).children();
			var data_type = $(div).attr("data-type");
			var data = $(div).attr("data");
			$.ajax({
			url : "${pageContext.request.contextPath}/tourresion",
			type : 'get',
			data:{
				city:data
			},
			success : function(xml) {
			
				parser = new DOMParser();
				xmlDoc = parser.parseFromString(xml.trim(), "text/xml");
				
				var html;
				var prevTitle = "";
				
				$("#tablebody").empty();
				
			
				$(xml).find("item").each(function() {
					var title = $(this).find("title").text();
					var addr1 = $(this).find("addr1").text();
					var addr2 = $(this).find("addr2").text();
					var readcount = $(this).find("readcount").text();
				
					if (prevTitle != title) {
						prevTitle = title;
						var image = $(this).find("firstimage2").text();
						
						
						/* html += "<tr><td width='100'><img src='" + image + "' onError=\"this.src='${pageContext.request.contextPath}/images/noImage.png'\" width='80' height='40'/></td><td><ul class='placeclass'><li class='list-group-item' style='padding: 0.3rem;' value='" + title + "'>" + title + addr2 + readcount+ "<button class='btn btn-primary' name='placebtn'>+</button></li></ul></td></tr>"; */
					 	
					 html += "<tr><td><div class='card' style='width: 70rem; display: flex;'> "
						if(image!=''){
						html += "<img src='" + image + "' onError=\"this.src='${pageContext.request.contextPath}/images/noImage.png' style='width: 400px;height: 200px;'>"
						}
						html += "<div class='card-body' style='display: inline;'>"
						html += "	<h5 class='card-title'>" + title + "</h5>"
						html += "	<p class='card-text'>"+ addr2 +"</p>"
							html += "	<p class='card-text'>" + readcount +"</p>"
								html += "	<a href=''#' class='btn btn-primary'>상세보기</a>"
								html += "</div>"
									html += "</div></td></tr>";	
									
									
				/* 				
					$("div.card>div.card-body>h5.card-title").html(title);
					$("div.card>div.card-body>p.card-text").html(addr1); */
						
						
				
					}
				});
				$("#tablebody").html(html);
				console.log(xmlDoc);
				/* jquery*/
// 				console.log(xml);
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax 도시버튼 추가
		});
		
		
		
	});//end onload
</script>

<div class="container h-100 pt-3">
	<!-- 필터 -->
	<table class="table table-bordered ">
		<tr>
			<td class="filter_title">여행도시</td>
			<td class="filter_body si">
				<div class="allways_show"></div>
				<div class="city_toggle collapse">
					<!-- 버튼을 누르면 여기에 값이 나옵니다. -->
				</div>
			</td>
			<td width="4%"><span class="fa fa-chevron-down"
				data-toggle="collapse" data-target=".city_toggle"> <!-- 버튼 -->
			</span></td>
		</tr>
	</table>
	<!-- 필터 -->


	<!--내용 -->
</div>
<!-- container -->


