<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>
<script>
$(function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/together',
		method: 'post',
		success : function(result) {
			$("div.bestcontents").html(result.trim());
		}
	});

});

</script>
<style>
.tayo-search {
	background: #007bff;
	color : #fff;
	margin: 0px;
	margin-left:5px;
	padding: 0px;
	padding-top : 3.5px;
	width: 5%;
	border-radius: 0.25rem;
	text-align: center; 
}

</style>
<div class="tayowithbody">
<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
				<h3 class="text-wh">
					<small>여행 친구를 만들어 </small> '함께 타요'
				</h3>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="도시명으로 검색">
					<a href="" class="tayo-search"><span class="fa fa-search" id="tayo-search-icon"></span></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //banner -->


<!-- 마감임박 -->
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<h3 class="heading text-capitalize text-center">
			<span class="fa fa-warning"></span> 마감임박 함께 타요
		</h3>
		<p class="text mt-2 mb-5 text-center">마감이 얼마 남지 않았어요! 서두르세요!</p>
		<div class="bestcontents">

		</div>
		<div class="view-package text-center mt-4">
			<a href="">더 많은 일정 보러가기</a>
		</div>
	</div>
</section>
<!-- 마감임박 -->

<!-- 함께타요 -->
<div class="container mt-3">
	<h3 class="heading text-capitalize text-center">함께 타요</h3>
	<p class="text mt-2 mb-5 text-center">타요인들과 함께 여행을 떠나 새로운 추억을
		쌓아보세요!</p>
<!-- 필터 -->
	<jsp:include page="togetherfilter.jsp"></jsp:include>
<!-- 필터 -->




</div>
<!-- 함께타요 -->
</div>



<%@ include file="/temp/footer.jsp"%>