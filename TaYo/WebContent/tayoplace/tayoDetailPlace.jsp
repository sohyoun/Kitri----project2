<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>

<style>
.carouselExampleControls {
	width: 50px;
	height: 100px;
}

.w-100 {
	width: 1200px !important;
	height: 300px;
}

#tayowith-schedule {
	margin-top: 30px;
	margin-bottom: 100px;
}

h1, h2, h3, h4, h5 {
	margin: 0;
	color: #323648;
	font-weight: bold;
}

.detail {
	width: 100%;
	height: 50px;
	border: 1px solid #d8d8d8;
}

.spot_img_box {
	width: 100%;
	height: 281px;
	overflow: hidden;
	margin-bottom: 15px;
}

.spot_info_box {
	width: 100%;
	background: white;
	border: 1px solid #d8d8d8;
}

.spot_info {
	width: 100%;
	padding: 10px;
}

.spot_name {
	font-size: 35px;
	color: #363636;
	margin-top: 5px;
	font-weight: bold;
}

.spot_name span {
	color: #898989;
	font-weight: normal;
}

.spot_addr {
	background: url('/TaYo/images/addr_icon4.png') no-repeat;
	font-size: 15px;
	color: #808080;
	padding-left: 20px;
	height: 15px;
	line-height: 15px;
	margin-top: 10px;
	margin-bottom: 15px;
}

.spot_tip {
	width: 100%;
	font-size: 14px;
	color: #555555;
	line-height: 24px;
	text-align: justify;
	margin-bottom: 15px;
}

.spot_info_ico {
	float: left;
	margin-top: 3px;
	margin-right: 5px;
}

.spot_info {
	padding: 2rem 1rem;
	margin-bottom: 2rem;
	background-color: #e9ecef;
	border-radius: 0.3rem;
}
</style>



<!-- 이 div를 해줘야 크기가 맞춰짐 -->
<div class="container py-xl-5 py-lg-3">


	<!-- 관광지 이름,주소부분 -->
	<div class="spot_name">
		N 서울 타워 <span> N Seoul Tower</span>
	</div>
	<div class="spot_addr">126 Namsangongwon-gil, Yongsan-gu, Seoul,
		South Korea</div>
	<!-- 관광지 이름,주소부분  -->

	<br>

	<!-- 사진 슬라이드 부분 -->
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="/TaYo/images/tower2.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/TaYo/images/tower1.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/TaYo/images/tower3.jpg"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- 사진 슬라이드 부분 -->

	<br>

	<!-- 관광지 설명부분-->
	<div class="spot_tip">
		<img class="spot_info_ico" src="/TaYo/images/info_icon.png"> 한국
		최초의 타워 관광명소로 높이가 236.7m에 이르며 실제 남산의 높이까지 더하면 480m에 이르러 동양 최고의 타워라 할 수
		있다 1969년 방송 송출 전파탑으로 세워졌으며 1980년 전망대가 일반인에게 공개되면서 서울의 랜드마크로 자리잡기 시작하였다
		2005년 리모델링을 통해 복합 문화 공간으로 변모하였으며 서울의 상징으로 해가진 밤에도 다채로운 조명으로 타워의 외관이 더욱
		돋보인다 총 5층으로 되어 있으며 1/2층은 입장료 없이 입장이 가능하며 5층에 자리잡고 있는 360도 파노라마 회전 전망
		레스토랑은 서울 전경을 한눈에 내려 볼 수 있는 곳으로 특히 해질무렵에 노을이 물드는 한강의 아름다운 모습을 볼 수 있다 그
		외에도 타워에서 크고 작은 이벤트로 관광객들에서 재미와 휴식공간을 제공하여 사랑받는 곳이다
	</div>
	<!-- 관광지 설명부분 -->

	<!-- 관광지 카테고리 및 설명부분-->
	<div class="spot_info">
		<table class="spot_info_table" id="spot_info_default" width="100%">
			<tbody>
				<tr>
					<th></th>
					<td></td>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>명소 &gt; 공항</td>
					<!-- <th>웹사이트</th>
					<td><a href="http://www.airport.kr" target="_blank">www.airport.kr</a></td> -->
				</tr>
				<tr>
					<th>가는방법</th>
					<td colspan="3">[Line Airport Railroad(공항철도)]Incheon
						International Airport(인천국제공항)역 인천국제공항역에 하차 또는 공항 리무진 버스 이용.</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>82 1577-2600</td>
					<td colspan="2">&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 관광지 카테고리 및 설명부분-->



	<hr><br> 
	<!-- 인기여행지 best -->
	<h4 class="heading text-capitalize text-bold">이 장소와 함께 일정에 포함된
		인기장소</h4>
	<br>
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

	<br> 


	<hr><br> 
	<!-- 함께타요 일정 -->
	<h4 class="heading text-capitalize text-bold">타요 추천 여행일정!</h4>
	<div class="row" id="tayowith-schedule">
		<div class="col-lg-3 col-sm-6">
			<div class="image-tour position-relative">
				<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
				<p>
					<span>100 <span class="fa fa-thumbs-up"></span> | 12230 <span
						class="fa fa-eye"></span> | 19 <span class="fa fa-comment"></span>
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
							class="fa fa-eye"> | 10 <span class="fa fa-comment"></span>
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
							class="fa fa-eye"> | 9 <span class="fa fa-comment"></span>
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
							class="fa fa-eye"> | 3 <span class="fa fa-comment"></span>
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


</div>
<!-- 이 div를 해줘야 크기가 맞춰짐 -->



<%@ include file="/temp/footer.jsp"%>