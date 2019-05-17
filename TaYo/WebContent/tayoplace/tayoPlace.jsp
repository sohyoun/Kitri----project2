<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
.form-inline {
	position: relative;
	left: 450px;
	top: 100px;
}

/* --------------------관광명소/ 음식점/ 여행일정------------------------------ */
.common_menu {
	width: 100%;
	height: 40px;
	line-height: 40px;
	border-radius: 5px;
	background: #223b68;
	color: white;
	margin-top: 10px;
	overflow: hidden;
}

.common_menu a {
	display: block;
	/* width:370px; */
	width: 33.33%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	float: left;
	font-size: 15px;
	color: white;
	border-right: 1px solid #4e6286;
	height: 40px;
}

.common_menu a:hover {
	background: #164c88;
}

.common_menu a.on {
	background: #1a7ad9;
}

.card-img-top {
	width: 400px;
	height: 200px;
}

.card {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: row;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
}
/* --------------------관광명소/ 음식점/ 여행일정------------------------------ */


.btn-primary{
	float: right;
}

.common_menu{
	color: YELLOW;
}
</style>



<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
				<h3 class="text-wh">
					<small> 어디로 여행을 가시나요? </small>
				</h3>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="도시명으로 검색">
					<a href="" id="tayo-search"><span class="fa fa-search"
						id="tayo-search-icon"></span></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //banner -->


<!-- 인기여행지 best -->
<section class="destinations py-5" id="destinations">
	<div class="container py-xl-5 py-lg-3">
		<!-- 이 div를 해줘야 크기가 맞춰짐 -->
		<!-- 필터 -->
		<table class="table table-bordered" id="filter">
			<tr>
				<td id="filter-title">필터</td>
				<td id="filter-body" colspan="2">
					<button type="button" class="btn btn-light">
						서울 | <span class="fa fa-remove">
					</button>
					<button type="button" class="btn btn-light">
						7-10일 | <span class="fa fa-remove">
					</button>
					<button type="button" class="btn btn-light">
						여름 | <span class="fa fa-remove">
					</button>
				</td>
			</tr>
			<tr>
				<td id="filter-title">여행도시</td>
				<td id="filter-body">
					<button type="button" class="btn btn-light">서울</button>
					<button type="button" class="btn btn-light">부산</button>
					<button type="button" class="btn btn-light">인천</button>
					<button type="button" class="btn btn-light">대전</button>
					<button type="button" class="btn btn-light">대구</button>
					<div id="city-toggle" class="collapse">
						<button type="button" class="btn btn-light">광주</button>
						<button type="button" class="btn btn-light">울산</button>
						<button type="button" class="btn btn-light">세종특별자치시</button>
						<button type="button" class="btn btn-light">가평군</button>
						<button type="button" class="btn btn-light">고양시</button>
						<button type="button" class="btn btn-light">과천시</button>
						<button type="button" class="btn btn-light">광명시</button>
						<button type="button" class="btn btn-light">광주시(경기)</button>
						<button type="button" class="btn btn-light">구리시</button>
						<button type="button" class="btn btn-light">군포시</button>
					</div>
				</td>
				<td width="4%"><span class="fa fa-chevron-down"
					data-toggle="collapse" data-target="#city-toggle"></td>
			</tr>
			<tr>
				<td id="filter-title">여행일</td>
				<td id="filter-body" colspan="2">
					<button type="button" class="btn btn-light">1-3일</button>
					<button type="button" class="btn btn-light">4-6일</button>
					<button type="button" class="btn btn-light">7-10일</button>
					<button type="button" class="btn btn-light">11-15일</button>
					<button type="button" class="btn btn-light">15일 이상</button>
				</td>
			</tr>
			<tr>
				<td id="filter-title">여행시기</td>
				<td id="filter-body" colspan="2">
					<button type="button" class="btn btn-light">봄</button>
					<button type="button" class="btn btn-light">여름</button>
					<button type="button" class="btn btn-light">가을</button>
					<button type="button" class="btn btn-light">겨울</button>
				</td>
			</tr>
		</table>
		<!-- 필터 -->

		<br>

		<h3 class="heading text-capitalize text-center">인기 여행지 BEST</h3>
		<p class="text mt-2 mb-5 text-center">타요인들의 가장 많은 좋아요를 받은 여행지입니다.
		</p>
		<div class="row inner-sec-w3layouts-w3pvt-lauinfo">
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">서울</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp1.jpg" class="img-fluid" alt="">
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
						<h4>경복궁</h4>
						<a href="booking.html">자세히보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">담양</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp2_2.jpg" class="img-fluid" alt="">
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
						<h4>메타세콰이어길</h4>
						<a href="booking.html">자세히보기</a>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">부산</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp3.jpg" class="img-fluid" alt="">
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
						<h4>감천문화마을</h4>
						<a href="">자세히보기</a>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">전주</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp4.jpg" class="img-fluid" alt="">
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
						<h4>한옥마을</h4>
						<a href="">자세히보기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 인기여행지 best -->


		<br> <br> <br> <br>
		<h3 class="heading text-capitalize ">Seoul</h3>



		<!-- 여행지 상세 선택 분류 -->
		<div class="common_menu">
			<a href="naver.com">관광명소</a> <a href="naver.com">음식점</a> <a
				href="naver.com">여행 일정</a>
		</div>
		<!-- 여행지 상세 선택 분류  -->


		<br>



		<!-- 여행지 상세 선택 분류2 -->
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab"
					data-toggle="tab" href="#nav-home" role="tab"
					aria-controls="nav-home" aria-selected="true">전체</a> <a
					class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
					href="#nav-profile" role="tab" aria-controls="nav-profile"
					aria-selected="false">관광지</a> <a class="nav-item nav-link"
					id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
					role="tab" aria-controls="nav-contact" aria-selected="false">액티비티</a>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">내용</div>
			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab">내용</div>
			<div class="tab-pane fade" id="nav-contact" role="tabpanel"
				aria-labelledby="nav-contact-tab">내용</div>
		</div>
		<!-- 여행지 상세 선택 분류2 -->



		<br>
		<br>
		<br>


		<!-- 관광지  박스 -->
		<div class="card" style="width: 70rem;">
			<img class="card-img-top" src="/TaYo/images/tp2_2.jpg"
				alt="Card image cap">
			<div class="card-body" style="display: inline;">
				<h5 class="card-title">인천국제공항</h5>
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
				<a href="#" class="btn btn-primary">상세보기</a>
			</div>
		</div>
		<br>
		<!-- 관광지  박스 -->
		
		<!-- 관광지  박스 -->
		<div class="card" style="width: 70rem;">
			<img class="card-img-top" src="/TaYo/images/tp1.jpg"
				alt="Card image cap">
			<div class="card-body" style="display: inline;">
				<h5 class="card-title">인천국제공항</h5>
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
				<a href="#" class="btn btn-primary">상세보기</a>
			</div>
		</div>
		<!-- 관광지  박스 -->
		<br>
		
		<!-- 관광지  박스 -->
		<div class="card" style="width: 70rem;">
			<img class="card-img-top" src="/TaYo/images/tp3.jpg"
				alt="Card image cap">
			<div class="card-body" style="display: inline;">
				<h5 class="card-title">인천국제공항</h5>
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
				<a href="#" class="btn btn-primary">상세보기</a>
			</div>
		</div>
		<!-- 관광지  박스 -->
		<br>
		
		<!-- 관광지  박스 -->
		<div class="card" style="width: 70rem;">
			<img class="card-img-top" src="/TaYo/images/tp4.jpg"
				alt="Card image cap">
			<div class="card-body" style="display: inline;">
				<h5 class="card-title">인천국제공항</h5>
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
				<a href="#" class="btn btn-primary">상세보기</a>
			</div>
		</div>
		<!-- 관광지  박스 -->
		<br>
		
		<!-- 관광지  박스 -->
		<div class="card" style="width: 70rem;">
			<img class="card-img-top" src="/TaYo/images/tp2_2.jpg"
				alt="Card image cap">
			<div class="card-body" style="display: inline;">
				<h5 class="card-title">인천국제공항</h5>
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
				<a href="#" class="btn btn-primary">상세보기</a>
			</div>
		</div>
		<!-- 관광지  박스 -->
		<br>

	</div>
</section>




<%@ include file="/temp/footer.jsp"%>