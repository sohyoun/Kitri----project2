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
				xmlDoc = xmlParser.parseFromString(xml.trim(), "text/xml");
				console.log('-xml 파시용 데이터-');  
				console.log(xmlDoc);
				/* jquery*/
				var xmlData = $(xml).find("item");//아이템 배열
				for(var i =0;i<xmlData.length; i++){
					if(i<5){ //항상보일 아이템  /* .h-100.pt-4 > table > tbody > tr:nth-child(2) > */
						$('body > div.container  td.filter_body.si > div.allways_show').append(
								'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}else{ //토글에 넣을 아이템			/* .h-100.pt-4 > table > tbody > tr:nth-child(2) >  */			
						$('body > div.container td.filter_body.si > div.city_toggle.collapse').append(
								'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}
				}
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax 도시버튼 추가
		
		//도시버튼 클릭 이벤트 추가(동적)
		var filterbody =$('div.container > table > tbody > tr:nth-child(1) > td.filter_body');
		$(document).on("click", ".filter_body.si button",function() {			
			addFilterBtn(this);//필터 버튼  추가		
		});
		
		//도시 외 아이템들 이벤트 추가
		$('div.container > table > tbody > tr button').
		click(function() {
			addFilterBtn(this);//필터 버튼  추가
		});
		
		//필터 버튼 추가
		function addFilterBtn(item){	//부모 tr 안보이게
			var parentTr =$(item).closest('tr');
			parentTr.css("display", "none");
			//아이템생성
			var filterItem= $(item).clone();
			
			$(filterItem).children("div").css("float", "left");
			$(filterItem).html(filterItem.html()+' | <span class="fa fa-remove"></span>');
			$(filterItem).on("click", function() { //필터아이템 이벤트
				parentTr.css("display", "table-row");
				$(this).remove();
				//필터 안의 값들 출력
				outFilter();
			});			
			//필터에 추가
			filterbody.append(filterItem);
			//필터 안의 값들 출력
			outFilter();
		}//end setFilterBtnEvent
		
		function outFilter(){
			//필터 안의 값들 출력
			var filterArr= filterbody.children();	
			for(var i =0; i<filterArr.length;i++){
				console.log(filterArr[i]);	
// 				class="filter_value" data-type="season"
				console.log($(filterArr[i]).children().attr("data-type"));
				console.log($(filterArr[i]).children().text());
			}
			//필터값에 대한 데이터 갱신
			
		}
		
		
	});//end onload
</script>


	<div class="container h-100 pt-4">
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
				</td>
			</tr>
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

			<tr>
				<td class="filter_title">여행기간</td>
				<td class="filter_body" colspan="2">
					<button class="btn btn-light"> <div data-type="day" data-value="1">1-3일</div></button>
					<button class="btn btn-light"> <div data-type="day" data-value="2">4-6일</div></button>
					<button class="btn btn-light"> <div data-type="day" data-value="3">7-10일</div></button>
					<button class="btn btn-light"> <div data-type="day" data-value="4">11-15일</div></button>
					<button class="btn btn-light"> <div data-type="day" data-value="5">15일 이상</div></button>
				</td>
			</tr>
			<tr>
				<td class="filter_title">여행시기</td>
				<td class="filter_body" colspan="2">
					<button class="btn btn-light"><span  data-type="season" data-value="1">봄</span></button>
					<button class="btn btn-light"><span  data-type="season" data-value="2">여름</span></button>
					<button class="btn btn-light"><span  data-type="season" data-value="3">가을</span></button>
					<button class="btn btn-light"><span  data-type="season" data-value="4">겨울</span></button>
				</td>
			</tr>
		</table><!-- 필터 -->
		
		<!--내용 -->
	</div> <!-- container -->