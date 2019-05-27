<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>
<style>
.city_btn{
float: right;
}

.btn-light{
	margin-left:0.5rem;
}
.content_filter {
	height: 100%;
    width: 100%;
    border: 1px solid #cfcfcf;
    margin-bottom: 20px;
}
.filter_title {
    width: 140px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    color: #555555;
    font-size: 14px;
    font-family: 'nanum';
    font-weight: bold;
    float: left;
    border-right: 1px solid #e3e3e3;
    border-bottom: 1px dotted #c8c8ca;
}
.filter_right {
    border-bottom: 1px dotted #c8c8ca;
    width: 949px;
    float: left;
    height: 50px;
    line-height: 50px;
}
</style>

<script>
/* 	var isfilter;
	$(function() {
		//도시버튼 추가 (글자, 이벤트)
		$.ajax({
			url : "${pageContext.request.contextPath}/tourresioncode",
			type : 'get',
			success : function(xml) {
				/* 콘솔확이용 xml 파싱*/
				xmlParser = new DOMParser(); // DOMParser 객체를 생성함.
				xmlDoc = xmlParser.parseFromSdiving(xml, "text/xml");
				console.log('-xml 파시용 데이터-');
				console.log(xmlDoc);
				
				/* jquery*/
				var xmlData = $(xml).find("item");//아이템arr
				for(var i =0;i<xmlData.length; i++){
					if(i<5){ //항상보임					
						$('body > div.container.h-100.pt-3 > table > div:nth-child(2) > div.filter_body.si > div.allways_show').append(
								'<button class="btn btn-light"><span class= "' + $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}else{
						$('#city_toggle').append(
								'<button class="btn btn-light"><span class= "' + $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</span></button>');
					}
				}
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax 도시버튼 추가
		
// 		도시버튼 클릭 
		$(document).on("click", "body > div.container.h-100.pt-3 > table > div:nth-child(2) > div.filter_body.si button",function() {
			console.log($(this));
			console.log('도시코드'+$(this).children('span').atdiv("class"));
			
			//부모 div 안보이게
			var parentdiv =$(this).closest('div');
			parentdiv.css("display", "none");
			
			//필터에 넣을 아이템생성
			var filterItem= $(this).clone();
			$(filterItem).append(' | <span class="fa fa-remove"></span>');//제거버튼 추가
			$(filterItem).on("click", function() { //필터아이템 이벤트
				parentdiv.css("display", "table-");
				$(this).remove();
			});
			
			//필터에 넣을 아이템추가
			$('body > div.container.h-100.pt-3 > table >  div:nth-child(1) > div.filter_body').
			append(filterItem);			
		});
		
		//다른 아이템들 이벤트 추가
		$('body > div.container.h-100.pt-3 > table >  div button').
		click(function() {
			//부모 div 안보이게
			var parentdiv =$(this).closest('div');
			parentdiv.css("display", "none");
			
			//필터에 넣을 아이템생성
			var filterItem= $(this).clone();
			$(filterItem).atdiv("data-toggle", "collapse");
			$(filterItem).atdiv("data-target", "#city_toggle");
			$(filterItem).append(' | <span class="fa fa-remove"></span>');//제거버튼 추가
			$(filterItem).on("click", function() { //필터아이템 이벤트
				parentdiv.css("display", "table-");
				$(this).remove();
			});
			
			//필터에 넣을 아이템추가
			$('body > div.container.h-100.pt-3 > table >  div:nth-child(1) > div.filter_body').
			append(filterItem);			
		});
		
	});//end onload */
</script>
</head>
<body>


	<div class="container h-100 pt-3">
		<!-- 필터 -->
		<div class= "wrap">
			<div class="pb-3">
				<div class="text-nowrap heading">
					<h3>여행자들의 일정보기</h3>
				</div>
			</div>
			
			<div class= "content_filter">
				<div class="filter_title">필터</div>
				<div class="filter_right">
					<button type="button" class="btn btn-light">항상보임</button>
				</div>
			
	
				<div class="filter_title">여행도시</div>
				<div class="filter_right">
					<div class="city_box">
						<button type="button" class="btn btn-light">항상보임</button>
						<div class="city_toggle collapse" id="city_toggle"><!-- 버튼을 누르면 여기에 값이 나옵니다. --> 
							<button type="button" class="btn btn-light">숨겨짐</button>
						</div>
						<div class= "city_btn" >
							<span class="fa fa-chevron-down" data-toggle="collapse" data-target="#city_toggle"> <!-- 버튼 -->
						</span>		
					</div>
					</div>
					
				</div>
	
				<div class="filter_title">여행기간</div>
				<div class="filter_right" >
					<button class="btn btn-light"> <span class="1-3"> 1-3일</span></button>
					<button class="btn btn-light">4-6일</button>
					<button class="btn btn-light">7-10일</button>
					<button class="btn btn-light">11-15일</button>
					<button class="btn btn-light">15일 이상</button>
				</div>
	
		
				<div class="filter_title">여행시기</div>
				<div class="filter_right">
					<button class="btn btn-light">봄</button>
					<button class="btn btn-light">여름</button>
					<button class="btn btn-light">가을</button>
					<button class="btn btn-light">겨울</button>
				</div>
			
			</div> <!-- content_filter-->
		</div> <!-- wrap -->
		
			<!-- 필터 -->
	</div>


	<%@ include file="/temp/footer.jsp"%>