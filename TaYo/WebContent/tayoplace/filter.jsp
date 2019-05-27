<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
// 				console.log(xmlDoc);
				console.log(xml);
				/* jquery*/
				var xmlData = $(xml).find("item");//아이템 배열
				for(var i =0;i<xmlData.length; i++){
					if(i<5){ //항상보일 아이템	
						$('#destinations > div > div.container.h-100.pt-3 > table > tbody > tr:nth-child(1) > td.filter_body.si > div.allways_show').append(
								'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}else{ //토글에 넣을 아이템
						$('#destinations > div > div.container.h-100.pt-3 > table > tbody > tr:nth-child(1) > td.filter_body.si > div.city_toggle.collapse').append(
								'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}
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
				/* console.log(xml.trim()); */
				parser = new DOMParser();
				xmlDoc = parser.parseFromString(xml.trim(), "text/xml");
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
		<div class="row pb-3">
			<div class="col-sm-2 text-nowrap heading">
				<h3>여행자들의 일정보기</h3>
			</div>
		</div>
		<table class="table table-bordered ">
			<tr>
				<td class="filter_title">여행도시</td>
				<td class="filter_body si">
					<div class="allways_show">
					</div>
					<div class="city_toggle collapse"><!-- 버튼을 누르면 여기에 값이 나옵니다. --> 
					</div>
				</td>
				<td width="4%">
					<span class="fa fa-chevron-down" data-toggle="collapse" data-target=".city_toggle"> <!-- 버튼 -->
					</span>
				</td>
			</tr>
		</table><!-- 필터 -->
		
		<!--내용 -->
	</div> <!-- container -->


