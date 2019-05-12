<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp" %>
<!-- banner -->
<section class="banner_w3lspvt" id="home">
	<div class="csslider infinity" id="slider1">
		<input type="radio" name="slides" checked="checked" id="slides_1" />
		<input type="radio" name="slides" id="slides_2" />
		<input type="radio" name="slides" id="slides_3" />
		<input type="radio" name="slides" id="slides_4" />
		<ul>
			<li>
				<div class="banner-top">
					<div class="overlay">
						<div class="container">
							<div class="w3layouts-banner-info">
								<h3 class="text-wh">'나만의 버스 여행 플래너'</h3>
								<h4 class="text-wh">타요타요</h4>
								<div class="buttons mt-4">
									<a href="" class="btn mr-2">About타요타요</a>
									<a href="<%=root%>/schedule?act=schedule" class="btn">일정 짜러 가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-top1">
					<div class="overlay">
						<div class="container">
							<div class="w3layouts-banner-info">
								<h3 class="text-wh">'관광지 / 맛집 찾기'</h3>
								<h4 class="text-wh">전국 방방 곳곳의 관광지와 맛집을 찾아 떠나 볼까요?</h4>
								<div class="buttons mt-4">
									<a href="" class="btn mr-2">About 타요타요</a>
									<a href="" class="btn">관광지/맛집 추천</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-top2">
					<div class="overlay">
						<div class="container">
							<div class="w3layouts-banner-info">
								<h3 class="text-wh">'여행지 일정 추천'</h3>
								<h4 class="text-wh">타요인들의 여행 일정을 참고해보세요!</h4>
								<div class="buttons mt-4">
									<a href="" class="btn mr-2">About 타요타요</a>
									<a href="" class="btn">여행지 일정 추천</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-top3">
					<div class="overlay1">
						<div class="container">
							<div class="w3layouts-banner-info">
								<h3 class="text-wh">'함께 타기'</h3>
								<h4 class="text-wh">새로운 친구들과 함께 여행을 떠나요!</h4>
								<div class="buttons mt-4">
									<a href="" class="btn mr-2">About 타요타요</a>
									<a href="<%=root%><%=root%>together<%=root%>together.jsp" class="btn">함께 타기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
		<div class="arrows">
			<label for="slides_1"></label>
			<label for="slides_2"></label>
			<label for="slides_3"></label>
			<label for="slides_4"></label>
		</div>
	</div>
</section>
<!-- //banner -->


<!-- tour packages -->
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<h3 class="heading text-capitalize text-center">인기 여행 일정</h3>
		<p class="text mt-2 mb-5 text-center">타요인들의 선택을 참고하세요!</p>
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="image-tour position-relative">
					<img src="<%=root%>/images/p1.jpg" alt="" class="img-fluid" />
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
					<img src="<%=root%>/images/p2.jpg" alt="" class="img-fluid" />
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
					<img src="<%=root%>/images/p3.jpg" alt="" class="img-fluid" />
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
					<img src="<%=root%>/images/p4.jpg" alt="" class="img-fluid" />
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
		<div class="view-package text-center mt-4">
			<a href="">더 많은 일정 보러가기</a>
		</div>
	</div> 
</section>
<!-- tour packages -->
	
<!-- destinations -->
<section class="destinations py-5" id="destinations">
	<div class="container py-xl-5 py-lg-3">
		<h3 class="heading text-capitalize text-center">인기 여행지 TOP5</h3>
		<p class="text mt-2 mb-5 text-center">지금 가장 인기있는 여행지는?</p>
		<div class="row inner-sec-w3layouts-w3pvt-lauinfo">
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">북촌 한옥마을</h4>
				<div class="image-position position-relative">
					<img src="<%=root%>/images/china.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>서울</h4>
						<a href="">보러가기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">북촌 한옥마을</h4>
				<div class="image-position position-relative">
					<img src="<%=root%>/images/china.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>서울</h4>
						<a href="">보러가기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">Malaysia</h4>
				<div class="image-position position-relative">
					<img src="<%=root%>/images/china.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>Malaysia</h4>
						<a href="">Book Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">Japan</h4>
				<div class="image-position position-relative">
					<img src="<%=root%>/images/china.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>Japan</h4>
						<a href="">Book Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">Singapore</h4>
				<div class="image-position position-relative">
					<img src="<%=root%>/images/china.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>Singapore</h4>
						<a href="">Book Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- destinations -->

<!-- how to book -->
<section class="book py-5">
	<div class="container py-lg-5 py-sm-3">
		<h2 class="heading text-capitalize text-center">TaYo에서 버스 여행을 꿈꾸세요!</h2>
		<div class="row mt-5 text-center">
			<div class="col-lg-4 col-sm-6">
				<div class="grid-info">
					<div class="icon">
						<span class="fa fa-map-signs"></span>
					</div>
					<h4>관광지 / 맛집 찾기</h4>
					<p class="mt-3">전국 방방곳곳의<br>관광지와 맛집을 찾아 떠나볼까요?</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 mt-sm-0 mt-5">
				<div class="grid-info">
					<div class="icon">
						<span class="fa fa-calendar"></span>
					</div>
					<h4>일정짜기</h4>
					<p class="mt-3">타요인들의 일정을 참고하여<br>나만의 버스 여행 계획을 짜세요!</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 mt-lg-0 mt-5">
				<div class="grid-info">
					<div class="icon">
						<span class="fa fa-gift"></span>
					</div>
					<h4>함께 타요</h4>
					<p class="mt-3">새로운 사람들과 버스 여행을 떠나세요!</p>
				</div>
			</div>
		</div>
	</div>
</section>
<br><br><br><br><br><br><br>
<!-- //how to book -->

<%@ include file="/temp/footer.jsp" %>