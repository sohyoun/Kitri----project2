<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>
<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;"></div>
		</div>
	</div>
</section>





<hr>
	
<!-- 필터 -->
<div class="container h-100 pt-3">
	<div class="row pb-3">
		<div class="col-sm-2 text-nowrap heading">
			<h3>여행자들의 일정보기</h3>
		</div>
	</div>
<!-- 필터 -->
	<table class="table table-bordered ">
	  <tr style="display: none">
	  	<td class="filter_title">필터</td>
	  	<td class="filter_body" colspan="2" >
	  	<!-- <button type="button" class="btn btn-light">서울 | <span class="fa fa-remove"></span></button> -->
	  	</td>
	  </tr>	
      <tr>
        <td class="filter_title">여행도시</td>
        <td class="filter_body">
      	  <button type="button" class="btn btn-light">서울</button>
		  <button type="button" class="btn btn-light">부산</button>
	 	  <button type="button" class="btn btn-light">인천</button>
 		  <button type="button" class="btn btn-light">대전</button>
 		  <button type="button" class="btn btn-light">대구</button>
 		  <div class="collapse city_toggle" id="city_toggle">
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
		<!--버튼 -->
        <td width="4%"><span class="fa fa-chevron-down" data-toggle="collapse" data-target="#city_toggle"></span></td>
      </tr>
      <tr>
        <td class="filter_title">여행기간</td>
        <td class="filter_body"  colspan="2">
        	<button type="button" class="btn btn_light">1-3일</button>
			<button type="button" class="btn btn_light">4-6일</button>
			<button type="button" class="btn btn_light">7-10일</button>
 			<button type="button" class="btn btn_light">11-15일</button>
 			<button type="button" class="btn btn_light">15일 이상</button>
        </td>
      </tr>
      <tr>
        <td id="filter-title">여행시기</td>
        <td id="filter-body"  colspan="2">
 			 <button type="button" class="btn btn-light">봄</button>
			 <button type="button" class="btn btn-light">여름</button>
			 <button type="button" class="btn btn-light">가을</button>
 			 <button type="button" class="btn btn-light">겨울</button>
        </td>
      </tr>
  </table>

<!-- 필터 -->
	
	<!-- 	backup -->
<div class="container h-100 pt-3">


	<table class="table table-bordered" id="tayo_plans">
		<tr>
			<th class="text-nowrap ph-1">필터</th>
			<td> </td>
		</tr>
		<tr>
			<th class="text-nowrap ph-1">여행지</th>
			<td><span class="text-nowrap px-3 ">서울</span> <span class="text-nowrap px-3 ">대전</span> <span class="text-nowrap px-3 ">대구</span> <span class="text-nowrap px-3 ">부산</span></td>
		</tr>
		<tr>
			<th>여행기간</th>
			<td><span>1-3일</span> <span>7-10일</span> <span>11-15일</span></td>
		</tr>
		<tr>
			<th>여행시기</th>
			<td><span>봄</span> <span>여름</span> <span>가을</span><span>겨울</span></td>
		</tr>
		<tr>
			<th>여행테마</th>
			<td><span>가족여행</span> <span>나홀로여행</span> <span>함께타요</span> <span>커플여행</span> <span>친구와함께</span></td>
		</tr>
	</table>
	
</div>
<!-- backup -->

<hr>
<div class="container h-100 pt-5 pb-2">
	
	<div class="row">
		<h3>Day 1</h3>
	</div>
	<div class="row pt-3 ">
		<div class="col-3">
			<img src="/TaYo/images/p1.jpg" class="img-responsive w-100 " />
		</div>
		<div class="col-7">
			<div class="row">여행제목</div>
			<div class="row">여행경로 A - B - C</div>
			<div class="row ">여행테마</div>
		</div>
		<div class="col-2">
			<img src="/TaYo/images/p3.jpg">
		</div>
	</div>
	<div class="row pt-3">
		<div class="col-3">
			<img src="/TaYo/images/p1.jpg" class="img-responsive w-100 " />
		</div>
		<div class="col-7">
			<div class="row">여행제목</div>
			<div class="row">여행경로 A - B - C</div>
			<div class="row ">여행테마</div>
		</div>
		<div class="col-2">
			
		</div>
	</div>
</div>

<hr>

	<div class="row pt-5">
		<div class="col-4">
			<img src="/TaYo/images/p1.jpg" class="img-responsive w-100 " />
			<div class="row ">여행제목</div>
			<div class="row ">여행경로 A - B - C</div>
			<div class="row ">여행테마</div>
			<!-- 	<div class= "row ">여행 상세설명</div> -->
		</div>
		<div class="col-4">
			<img src="/TaYo/images/p2.jpg" class="img-responsive w-100 " />
			<div class="row ">여행제목</div>
			<div class="row ">여행일</div>
			<div class="row ">여행테마</div>
			<!-- <div class= "row ">여행 상세설명</div> -->
		</div>
	</div>
</div>




<hr>
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<h3 class="heading text-capitalize text-center">인기 여행 일정</h3>
		<p class="text mt-2 mb-5 text-center">타요인들의 선택을 참고하세요!</p>
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p>
						<span>100 <span class="fa fa-thumbs-up"> | 12230 <span class="fa fa-eye"> | 19 <span class="fa fa-comment"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>부산
					</h6>
					<h5 class="my-2">모녀 부산여행</h5>
					<p class="">가족여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.05.01~2019.05.03 (3)</span></li>
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
						<span>98 <span class="fa fa-thumbs-up"> | 9917 <span class="fa fa-eye"> | 10 <span class="fa fa-comment"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>전주, 여수
					</h6>
					<h5 class="my-2">전라도 먹방 여행</h5>
					<p class="">우정여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.03~2019.05.07 (5)</span></li>
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
						<span>71 <span class="fa fa-thumbs-up"> | 5560 <span class="fa fa-eye"> | 9 <span class="fa fa-comment"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>강릉
					</h6>
					<h5 class="my-2">바다로 호캉스</h5>
					<p class="">커플여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.21~2019.04.22 (2)</span></li>
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
						<span>56 <span class="fa fa-thumbs-up"> | 3726 <span class="fa fa-eye"> | 3 <span class="fa fa-comment"></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>제천
					</h6>
					<h5 class="my-2">생애 첫 패러글라이딩</h5>
					<p class="">나홀로여행</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.19 (1)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> lovetayo 
					</h6>
				</div>
			</div>
		</div>
		<div class="view-package text-center mt-4">
			<a href="">더 많은 일정 보러가기</a>
		</div>
	</div>
</section>




<%@ include file="/temp/footer.jsp"%>