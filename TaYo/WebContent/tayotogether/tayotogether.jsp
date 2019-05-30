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
	
	
	var planDiv = $("#tayowithschedule001");
	$(planDiv).click(function(){
		location.href="/TaYo/tayotogether/ttPlan.jsp";
	});

});

</script>


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
					<a href="" id="tayo-search"><span class="fa fa-search" id="tayo-search-icon"></span></a>
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

<!-- 함께타요 일정 -->
<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p>
						<span>100 <span class="fa fa-thumbs-up"></span> | 12230 <span
							class="fa fa-eye"></span></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>부산
					</h6>
					<h5 class="my-2">모녀 부산여행</h5>
					<p class="">가족여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.05.01~2019.05.03
								(3)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> kkiruk 
					</h6>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p2.jpg" alt="" class="img-fluid" />
					<p>
						<span>98 <span class="fa fa-thumbs-up"> | 9917 <span
								class="fa fa-eye"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>전주, 여수
					</h6>
					<h5 class="my-2">전라도 먹방 여행</h5>
					<p class="">우정여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.03~2019.05.07
								(5)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> GoGotpfk 
					</h6>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p3.jpg" alt="" class="img-fluid" />
					<p>
						<span>71 <span class="fa fa-thumbs-up"> | 5560 <span
								class="fa fa-eye"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>강릉
					</h6>
					<h5 class="my-2">바다로 호캉스</h5>
					<p class="">커플여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.21~2019.04.22
								(2)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> sohyoun 
					</h6>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p4.jpg" alt="" class="img-fluid" />
					<p>
						<span>56 <span class="fa fa-thumbs-up"> | 3726 <span
								class="fa fa-eye"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>제천
					</h6>
					<h5 class="my-2">생애 첫 패러글라이딩</h5>
					<p class="">나홀로여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.19
								(1)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> lovetayo 
					</h6>
				</div>
			</div>
		</div>
<!-- 함께타요 일정 -->

<!-- 페이지넘김 -->
<div id="tayowith-paging">
<ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
 </ul>
</div>
<!-- 페이지넘김 -->

</div>
<!-- 함께타요 -->




<%@ include file="/temp/footer.jsp"%>