<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	var isfilter;
	$(function() {
		var cityMap={};
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
				for(var i =0; i < xmlData.length; i++){
					if(i<5){ //항상보일 아이템  /* .h-100.pt-4 > table > tbody > tr:nth-child(2) > */
						$('body > div.container  td.filter_body.si > div.allways_show').append(
								'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}else{ //토글에 넣을 아이템			/* .h-100.pt-4 > table > tbody > tr:nth-child(2) >  */			
						$('body > div.container td.filter_body.si > div.city_toggle.collapse').append(
								'<button class="btn btn-light"><div data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}
					cityMap[''+$(xmlData[i]).find("code").text()] = $(xmlData[i]).find("name").text();
					
				}
				console.log('citymap');
				console.log(cityMap);
			},//end success
			
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax 도시버튼 추가
		
		//도시버튼 클릭 이벤트 추가(동적)
		var filterbody =$('body > div.container > table > tbody > tr:nth-child(1) > td.filter_body');
		$(document).on("click", ".filter_body.si button",function() {			
			addFilterBtn(this);//필터 버튼  추가		
		});
		
		//도시 외 아이템들 이벤트 추가
		$('div.container> table > tbody > tr button').
		click(function() {
			addFilterBtn(this);//필터 버튼  추가
		});
		
		//목차 버튼 추가
		$(document).on("click", "div.mokcha > a", function() {
			var mokcha = $(this).attr("href");
			console.log(mokcha);
			//필터 안의 값들 출력
			outFilter(mokcha);
			return false;
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
		
		function outFilter(mokcha){
			if(mokcha == undefined){
				mokcha = 1;
			}
			console.log('mokcha:' +mokcha);
			
			//ajax에서는 planobject 전달 가능
			var data = {}; //json을 위한 object
			data['cityMap']= cityMap;
			data['current_page']= ''+mokcha;
			//필터 안의 값들 json형태로
			var filterArr= filterbody.children();	
			for(var i =0; i<filterArr.length;i++){
				var key =$(filterArr[i]).children().attr("data-type");
				var value;
				if(key=='day'){//일자 일때
					console.log($(filterArr[i]).children());
					var start_day = $(filterArr[i]).children().attr('start-day');
					var end_day =  $(filterArr[i]).children().attr('end-day');
					data['start_day'] = start_day;
					data['end_day'] = end_day;
				}else{//그 외
					value =$(filterArr[i]).children().text();
					data[key] = value;
				}
			}
			console.log('data');
 			console.log(data);
// 			console.log('json'+JSON.stringify(data));
			//필터값에 대한 데이터리스트 갱신
			$.ajax({
				url : "${pageContext.request.contextPath}/recomand",
				type : 'post',
				data: {
					jsonData : JSON.stringify(data)
				},
				success : function(data) {
					$('.filterResult').html(data);
// 					console.log(data);
				},
				error: function(err){
					console.log("recomand call error");
// 					console.log(err);
				}				
			});
		}//end outFilter
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
				<button class="btn btn-light"> <div data-type="day" start-day="1" end-day="3">1-3일</div></button>
				<button class="btn btn-light"> <div data-type="day" start-day="4" end-day="6">4-6일</div></button>
				<button class="btn btn-light"> <div data-type="day" start-day="7" end-day="10">7-10일</div></button>
				<button class="btn btn-light"> <div data-type="day" start-day="11" end-day="15">11-15일</div></button>
				<button class="btn btn-light"> <div data-type="day" start-day="15" >15일 이상</div></button>
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
		<tr>
			<td class="filter_title">여행테마</td>
			<td class="filter_body" colspan="2">
				<button class="btn btn-light"><span  data-type="theme" data-value="나홀로">나홀로</span></button>
				<button class="btn btn-light"><span  data-type="theme" data-value="친구">친구</span></button>
				<button class="btn btn-light"><span  data-type="theme" data-value="커플">커플</span></button>
				<button class="btn btn-light"><span  data-type="theme" data-value="함께타요">함께타요</span></button>
			</td>
		</tr>
	</table><!-- 필터 -->
	
	<!-- 필터결과 -->
	<div class="filterResult">
	</div>
		
		<!--내용 -->
</div> <!-- container -->
