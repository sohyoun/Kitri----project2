<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/temp/header.jsp" %>

<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
				<h3 class="text-wh">'쉽고 간단한 여행 일정 만들기'</h3>
				<div class="buttons mt-4">
					<a href="<%=root%>/schedule?act=newschedule" class="btn mr-2">새로운 일정</a>
					<a href="" class="btn">나의 일정</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- tour packages -->
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<h3 class="heading text-capitalize text-center">인기 여행 일정</h3>
		<p class="text mt-2 mb-5 text-center">타요인들의 선택을 참고하세요!</p>
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p><span>100 <span class="fa fa-thumbs-up"> | 12230 <span class="fa fa-eye"> | 19 <span class="fa fa-comment"></span></p>
				</div>
				<div class="package-info">
					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>부산</h6>
					<h5 class="my-2">모녀 부산여행</h5>
					<p class="">가족여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.05.01~2019.05.03 (3)</span></li>
					</ul>
					<h6 class="mt-1"><span class="fa fa-user-circle"> kkiruk</h6>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p2.jpg" alt="" class="img-fluid" />
					<p><span>98 <span class="fa fa-thumbs-up"> | 9917 <span class="fa fa-eye"> | 10 <span class="fa fa-comment"></span></p>
				</div>
				<div class="package-info">
					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>전주, 여수</h6>
					<h5 class="my-2">전라도 먹방 여행</h5>
					<p class="">우정여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.03~2019.05.07 (5)</span></li>
					</ul>
					<h6 class="mt-1"><span class="fa fa-user-circle"> GoGotpfk</h6>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p3.jpg" alt="" class="img-fluid" />
					<p><span>71 <span class="fa fa-thumbs-up"> | 5560 <span class="fa fa-eye"> | 9 <span class="fa fa-comment"></span></p>
				</div>
				<div class="package-info">
					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>강릉</h6>
					<h5 class="my-2">바다로 호캉스</h5>
					<p class="">커플여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.21~2019.04.22 (2)</span></li>
					</ul>
					<h6 class="mt-1"><span class="fa fa-user-circle"> sohyoun</h6>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p4.jpg" alt="" class="img-fluid" />
					<p><span>56 <span class="fa fa-thumbs-up"> | 3726 <span class="fa fa-eye"> | 3 <span class="fa fa-comment"></span></p>
				</div>
				<div class="package-info">
					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>제천</h6>
					<h5 class="my-2">생애 첫 패러글라이딩</h5>
					<p class="">나홀로여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.19 (1)</span></li>
					</ul>
					<h6 class="mt-1"><span class="fa fa-user-circle"> lovetayo</h6>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- tour packages -->

<!-- //banner -->
<%@ include file="/temp/footer.jsp" %>