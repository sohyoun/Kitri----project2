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
.btn-primary {
	float: right;
}

.common_menu {
	color: YELLOW;
}

/* 
.attraction_menu{
	width:100%;
	padding-top:15px;
} */
.attraction_cate {
	height: 33px;
	line-height: 33px;
	width: 117px;
	border-left: 1px solid #b8b8ba;
	border-top: 1px solid #b8b8ba;
	text-align: center;
	float: left;
	cursor: pointer;
	color: #555555;
	font-size: 13px;
}

.attraction_cate.on {
	background: #ff9320;
	color: white;
}

.attraction_cate.last {
	border-right: 1px solid #b8b8ba;
}

.category_list {
	width: 100%;
	margin-bottom: 12px;
	border: 1px solid #bbbbbd;
}

.category_box {
	width: 100%;
	height: 40px;
	line-height: 40px;
	color: #808080;
	font-size: 13px;
	text-align: left;
	border-top: 1px solid #e5e5e6;
}

.category_box.first {
	border-top: none;
}

.category_box.hide {
	display: none;
}

.category_btn {
	float: left;
	width: 25%;
	padding-left: 45px;
	cursor: pointer;
	background: url('/res/img/city/tag_check_null.png') no-repeat;
	background-position: 7% center;
}

.category_btn.on {
	background: url('/res/img/city/tag_check_checked.png') no-repeat;
	background-position: 7% center;
}

.category_more {
	width: 100%;
	text-align: center;
	background: #ebebed;
	border-top: 1px solid #dcdcdd;
	height: 40px;
	line-height: 40px;
	color: #555555;
	font-size: 13px;
	cursor: pointer;
}

.category_more img {
	margin-left: 3px;
}


.pagination{
	margin-right: 450px; 
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


<!-- 크기 맞춰주는 DIV -->
<section class="destinations py-5" id="destinations">
	<div class="container py-xl-5 py-lg-3">
		<!-- 이 div를 해줘야 크기가 맞춰짐 -->
		<!-- 크기 맞춰주는 DIV -->




		<!-- 필터 -->
		<table class="table table-bordered" id="filter">
			<tr>
				<td id="filter-title">여행도시</td>
				<td id="filter-body">
					<button type="button" class="btn btn-light">서울</button>
					<button type="button" class="btn btn-light">경기</button>
					<button type="button" class="btn btn-light">인천</button>
					<button type="button" class="btn btn-light">부산</button>
					<button type="button" class="btn btn-light">대구</button>
					<button type="button" class="btn btn-light">광주</button>
					<button type="button" class="btn btn-light">대전</button>
					<button type="button" class="btn btn-light">울산</button>
					<button type="button" class="btn btn-light">제주</button>
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
		</table>
		<!-- 필터 -->

		<br>

		<!-- 인기여행지 best -->
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



		<div class="wrap">
			<div class="attraction_menu">
				<div class="attraction_cate on" data-id="">전체</div>
				<div class="attraction_cate " data-id="301">관광지</div>
				<div class="attraction_cate " data-id="302">레저/액티비티</div>
				<div class="attraction_cate " data-id="303">나이트라이프</div>
				<div class="attraction_cate last" data-id="tip">여행TIP</div>
				<div class="clear"></div>
			</div>
			<div class="category_list">
				<div class="category_box"></div>
				<div class="category_more">
					카테고리 더보기<img src="/res/img/city/spot_list/category_more.gif" alt="" />
				</div>
			</div>
		</div>


		<!-- 여행지 상세 선택 분류2 -->
		<nav>
			<div class="nav nav-tabs">
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





		<div class="card text-center1">
			<div class="card-header1">
				<ul class="nav nav-tabs card-header-tabs1">
					<li class="nav-item1"><a class="nav-link active1" href="#">Active</a>
					</li>
					<li class="nav-item1"><a class="nav-link1" href="#">Link</a></li>
					<li class="nav-item1"><a class="nav-link disabled1" href="#">Disabled</a>
					</li>
				</ul>
			</div>
			<div class="card-body1">
				<h5 class="card-title1">Special title treatment</h5>
				<p class="card-text1">With supporting text below as a natural
					lead-in to additional content.</p>
				<a href="#" class="btn btn-primary1">Go somewhere</a>
			</div>
		</div>



























		<br> <br> <br>


		<!-- 관광지  박스 -->
		<div class="card" style="width: 70rem;">
			<img class="card-img-top" src="/TaYo/images/tp2_2.jpg"
				alt="Card image cap">
			<div class="card-body" style="display: inline;">
				<h5 class="card-title">인천국제공항</h5>
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South
					Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의
					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
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
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South
					Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의
					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
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
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South
					Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의
					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
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
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South
					Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의
					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
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
				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South
					Korea 지도보기</p>
				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의
					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p>
				<a href="#" class="btn btn-primary">상세보기</a>
			</div>
		</div>
		<!-- 관광지  박스 -->
		<br>



		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
		</nav>
	</div>
</section>




<%@ include file="/temp/footer.jsp"%>