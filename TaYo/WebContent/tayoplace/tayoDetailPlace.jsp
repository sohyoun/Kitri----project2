<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>
<style>

.carouselExampleControls{
	width: 50px;
	height: 100px;
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


<br>


<!-- 사진 슬라이드 부분 -->
<div class="container py-xl-5 py-lg-3">
	<!-- 이 div를 해줘야 크기가 맞춰짐 -->
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="/TaYo/images/tp1.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/TaYo/images/tp2.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/TaYo/images/tp3.jpg"
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


</div>
<!-- 이 div를 해줘야 크기가 맞춰짐 -->



<%@ include file="/temp/footer.jsp"%>