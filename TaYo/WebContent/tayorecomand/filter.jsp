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
				console.log(xmlDoc);
				
				/* jquery*/
				var xmlData = $(xml).find("item");//아이템 배열
				for(var i =0;i<xmlData.length; i++){
					if(i<5){ //항상보일 아이템			
						$('body > div.container.h-100.pt-3 > table > tbody > tr:nth-child(2) > td.filter_body.si > div.allways_show').append(
								'<button class="btn btn-light"><span class= "' + $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}else{ //토글에 넣을 아이템
						$('#city_toggle').append(
								'<button class="btn btn-light"><span class= "' + $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}
				}
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax 도시버튼 추가
		
		//도시버튼 클릭 이벤트 추가(동적)
		var filterbody =$('body > div.container.h-100.pt-3 > table > tbody > tr:nth-child(1) > td.filter_body');
		$(document).on("click", ".filter_body.si button",function() {			
			setFilterBtnEvent(this);		
		});
		
		//다른 아이템들 이벤트 추가
		$('body > div.container.h-100.pt-3 > table > tbody > tr button').
		click(function() {
			setFilterBtnEvent(this);
		});
		
		//필터 버튼 이벤트 추가
		function setFilterBtnEvent(item){	//부모 tr 안보이게
			var parentTr =$(item).closest('tr');
			parentTr.css("display", "none");
			//필터에 넣을 아이템생성
			var filterItem= $(item).clone();
			$(filterItem).append(' | <span class="fa fa-remove"></span>');//제거버튼 추가
			$(filterItem).on("click", function() { //필터아이템 이벤트
				parentTr.css("display", "table-row");
				$(this).remove();
			});			
			//필터에 넣을 아이템추가
			filterbody.append(filterItem);	
			
			
			$.ajax({
				
			});//end ajax
			
		}//end setFilterBtnEvent
		
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
			<tr> <!-- style="display: none" -->
				<td class="filter_title">필터</td>
				<td class="filter_body" colspan="2">
					<!-- <button type="button" class="btn btn-light">서울 | <span class="fa fa-remove"></span></button> -->
				</td>
			</tr>
<!-- 			<div class="city_toggle collapse" id="city_toggle">버튼누르면 값이 여기에 생긴다. -->
			<tr>
			
				<td class="filter_title">여행도시</td>
				<td class="filter_body si">
					<div class="allways_show">
					</div>
					<div class="city_toggle collapse" id="city_toggle"><!-- 버튼을 누르면 여기에 값이 나옵니다. --> 
					</div>
				</td>
				<td width="4%">
					<span class="fa fa-chevron-down" data-toggle="collapse" data-target="#city_toggle"> <!-- 버튼 -->
					</span>
				</td>
				
			</tr>
<!-- 			</div> -->
			<tr>
				<td class="filter_title">여행기간</td>
				<td class="filter_body" colspan="2">
					<button class="btn btn-light"> <span class="1"> 1-3일</span></button>
					<button class="btn btn-light">4-6일</button>
					<button class="btn btn-light">7-10일</button>
					<button class="btn btn-light">11-15일</button>
					<button class="btn btn-light">15일 이상</button>
				</td>
			</tr>
			<tr>
				<td class="filter_title">여행시기</td>
				<td class="filter_body" colspan="2">
					<button class="btn btn-light">봄</button>
					<button class="btn btn-light">여름</button>
					<button class="btn btn-light">가을</button>
					<button class="btn btn-light">겨울</button>
				</td>
			</tr>
		</table><!-- 필터 -->
		
		<!--내용 -->
	</div> <!-- container -->


