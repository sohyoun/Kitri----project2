<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>


<script>
	//지역 가져오기
	$(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/tourresioncode",
			type : 'get',
			success : function(xml) {
				/* jquery 테스트 */
				var xmlData = $(xml).find("item");
				var listLength = xmlData.length;

				if (listLength) {
					$(xmlData).each(function() {
						//console.log(this);
						$('body > div.container.h-100.pt-3 > table > tbody > tr:nth-child(2) > td.filter_body.si').append('<button class="btn btn-light"><span class= "' + $(this).find("code").text() + '">' + $(this).find("name").text() + '</span></button>');
						/* contentStr += $(this).find("contentid").text(); */
					});
				}//end if
			},//end success
			error : function(err) {
				console.log(err);
			}//end error
		});//end ajax

	});
</script>
</head>
<body>


	<div class="container h-100 pt-3">
		<!-- 필터 -->
		<div class="row pb-3">
			<div class="col-sm-2 text-nowrap heading">
				<h3>여행자들의 일정보기</h3>
			</div>
		</div>
		<table class="table table-bordered ">
			<tr style="display: none">
				<td class="filter_title">필터</td>
				<td class="filter_body" colspan="2">
					<!-- <button type="button" class="btn btn-light">서울 | <span class="fa fa-remove"></span></button> -->
				</td>
			</tr>
			<tr>
				<td class="filter_title">여행도시</td>
				<td class="filter_body si">
					<div class="collapse city_toggle" id="city_toggle">
						<button type="button" class="btn "></button>
					</div>
				</td>
				<td width="4%">
					<span class="fa fa-chevron-down" data-toggle="collapse" data-target="#city_toggle">
					
					</span>
				</td>
			</tr>
			<tr>
				<td class="filter_title">여행기간</td>
				<td class="filter_body" colspan="2">
					<button type="button" class="btn btn_light">1-3일</button>
					<button type="button" class="btn btn_light">4-6일</button>
					<button type="button" class="btn btn_light">7-10일</button>
					<button type="button" class="btn btn_light">11-15일</button>
					<button type="button" class="btn btn_light">15일 이상</button>
				</td>
			</tr>
			<tr>
				<td id="filter_title">여행시기</td>
				<td id="filter-body" colspan="2">
					<button type="button" class="btn btn-light">봄</button>
					<button type="button" class="btn btn-light">여름</button>
					<button type="button" class="btn btn-light">가을</button>
					<button type="button" class="btn btn-light">겨울</button>
				</td>
			</tr>
		</table>
			<!-- 필터 -->
	</div>


	<%@ include file="/temp/footer.jsp"%>