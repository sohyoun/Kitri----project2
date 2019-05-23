<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>


<style type="text/css">

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

</style>





<!-- 크기 맞춰주는 DIV -->
	<div class="container py-xl-5 py-lg-3">
		<!-- 이 div를 해줘야 크기가 맞춰짐 -->
		<!-- 크기 맞춰주는 DIV -->
		
		
		<h3 class="heading text-capitalize ">서울 Seoul</h3>

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

	</div>









<%@ include file="/temp/footer.jsp"%>
