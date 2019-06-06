<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>

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
	width: 350px;
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
	background-clip: border-box; /
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
}
/* --------------------관광명소/ 음식점/ 여행일정------------------------------ */

/* 상세보기 버튼 */
.btn-primary {
	float: right;
}

/* 페이징처리 버튼 */
.pagination {
	margin-right: 450px;
}

/* -------------------- 체크박스 부분------------------------------ */
.checkContainer {
	display: block;
	position: relative;
	padding-left: 35px;
	margin-bottom: 12px;
	cursor: pointer;
	font-size: 22px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	display: inline;
	margin-left: 50px;
}

/* Hide the browser's default checkbox */
.checkContainer input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
}

/* 체크 박스 체크부분 */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 25px;
	width: 25px;
	background-color: #eee;
}

/* On mouse-over, add a grey background color */
.checkContainer:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.checkContainer input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the checkmark when checked */
.checkContainer input:checked ~ .checkmark:after {
	display: block;
}

/* Style the checkmark/indicator */
.checkContainer .checkmark:after {
	left: 9px;
	top: 5px;
	width: 5px;
	height: 10px;
	border: solid white;
	border-width: 0 3px 3px 0;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}
/* -------------------- 체크박스 부분------------------------------ */
</style>








<!-------------------------------여기부터 banner 들어가는 부분 ------------------------------------------>
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
<!-------------------------------여기부터 banner 들어가는 부분 ------------------------------------------>


<!-- 크기 맞춰주는 DIV -->
<section class="destinations py-5" id="destinations">
	<div class="container py-xl-5 py-lg-3">
		<!-- 이 div를 해줘야 크기가 맞춰짐 -->
		<!-- 크기 맞춰주는 DIV -->




		<!------------------------------- 인기여행지 best  ------------------------------------------>
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
		<!------------------------------- 인기여행지 best  ------------------------------------------>

		<br>


		<!------------------------------- 필터  ------------------------------------------>
		<jsp:include page="filter.jsp"></jsp:include>
		<!------------------------------- 필터  ------------------------------------------>


		<!------------------------------- 옵션박스  ------------------------------------------>
		<jsp:include page="optionbox.jsp"></jsp:include>
		<!------------------------------- 옵션박스  ------------------------------------------>


<!------------------------------- api  ------------------------------------------>
		<div id="placelist">

			<table class="table table-bordered table-sm">
				<tbody id="tablebody" align="center">



					<!-- 관광지  박스 -->
					 <div class="card" style="display: none; width: 70rem;">
						<img class="card-img-top">
						<div class="card-body" style="display: inline;">
							<h5 class="card-title"></h5>
							<p class="card-text"></p>
							<p class="card-text"></p>
							<a href="#" class="btn btn-primary">상세보기</a>
						</div>
					</div>
					<br> 
					<!-- 관광지  박스 -->




				</tbody>
			</table>
		</div>
<!------------------------------- api  ------------------------------------------>



<!-- 		<br> <br> <br> -->


<!-- 		<!-- 관광지  박스 --> 
<!-- 		<div class="card" style="width: 70rem;"> -->
<!-- 			<img class="card-img-top" src="/TaYo/images/tp2_2.jpg" -->
<!-- 				alt="Card image cap"> -->
<!-- 			<div class="card-body" style="display: inline;"> -->
<!-- 				<h5 class="card-title">인천국제공항</h5> -->
<!-- 				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South -->
<!-- 					Korea 지도보기</p> -->
<!-- 				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 -->
<!-- 					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p> -->
<!-- 				<a href="#" class="btn btn-primary">상세보기</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<br> -->
<!-- 관광지  박스 --> 

<!-- 		관광지  박스 -->
<!-- 		<div class="card" style="width: 70rem;"> -->
<!-- 			<img class="card-img-top" src="/TaYo/images/tp1.jpg" -->
<!-- 				alt="Card image cap"> -->
<!-- 			<div class="card-body" style="display: inline;"> -->
<!-- 				<h5 class="card-title">인천국제공항</h5> -->
<!-- 				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South -->
<!-- 					Korea 지도보기</p> -->
<!-- 				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 -->
<!-- 					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p> -->
<!-- 				<a href="#" class="btn btn-primary">상세보기</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- 관광지  박스 --> 
<!-- 		<br> -->

		<!-- 관광지  박스 --> 
<!-- 		<div class="card" style="width: 70rem;"> -->
<!-- 			<img class="card-img-top" src="/TaYo/images/tp3.jpg
" -->
<!-- 				alt="Card image cap"> -->
<!-- 			<div class="card-body" style="display: inline;"> -->
<!-- 				<h5 class="card-title">인천국제공항</h5> -->
<!-- 				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South -->
<!-- 					Korea 지도보기</p> -->
<!-- 				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 -->
<!-- 					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p> -->
<!-- 				<a href="#" class="btn btn-primary">상세보기</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
	<!-- 관광지  박스 -->
<!-- 		<br> -->

		<!-- 관광지  박스 --> 
<!-- 		<div class="card" style="width: 70rem;"> -->
<!-- 			<img class="card-img-top" src="/TaYo/images/tp4.jpg" -->
<!-- 				alt="Card image cap"> -->
<!-- 			<div class="card-body" style="display: inline;"> -->
<!-- 				<h5 class="card-title">인천국제공항</h5> -->
<!-- 				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South -->
<!-- 					Korea 지도보기</p> -->
<!-- 				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 -->
<!-- 					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p> -->
<!-- 				<a href="#" class="btn btn-primary">상세보기</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- 관광지  박스 --> 
<!-- 		<br> -->

	<!-- 관광지  박스 --> 
<!-- 		<div class="card" style="width: 70rem;"> -->
<!-- 			<img class="card-img-top" src="/TaYo/images/tp2_2.jpg" -->
<!-- 				alt="Card image cap"> -->
<!-- 			<div class="card-body" style="display: inline;"> -->
<!-- 				<h5 class="card-title">인천국제공항</h5> -->
<!-- 				<p class="card-text">2851-19 Unseo-dong, Jung-gu, Incheon, South -->
<!-- 					Korea 지도보기</p> -->
<!-- 				<p class="card-text">인천국제공항은 대한민국 인천광역시 중구 운서동에 위치한 대한민국 최대 규모의 -->
<!-- 					국제공항으로, 대한민국의 대부분 국제선이 이곳을 통해 운항된다. 인천국제공항은 2001년 3월 29일 개항과 동...</p> -->
<!-- 				<a href="#" class="btn btn-primary">상세보기</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
	<!-- 관광지  박스 --> 
<!-- 		<br> -->



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