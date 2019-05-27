<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>
<script>
$(function(){
	var planDiv = $("#tayoschedule001");
	$(planDiv).click(function(){
		location.href="/TaYo/tayoschedule/plandetail.jsp";
	});
});
</script>


<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
			<h3 class="text-wh">'~~~님이 계획한 일정입니다.'</h3>
			</div>
		</div>
	</div>
</section>

<!-- my page nav -->
<nav class="navbar navbar-expand-md bg-primary navbar-dark ">
		<div class="container">  
			<!-- bg-light -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link text-nowrap" href="">나의 여행일정</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="">나의 좋아요</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="">나의 함께타요</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="">My Page</a></li>
				</ul>
			</div>

		</div>
	</nav>
<!-- my page nav -->

<div class="container py-lg-4 py-sm-3"><input type="button" class="btn btn-link" value="완성된 일정"> | <input type="button" class="btn" value="계획중인 일정"></div>

<!-- tour packages -->
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<div class="row">
			<div class="col-lg-3 col-sm-6" id="tayoschedule001" style="cursor:pointer">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p><span>100 </span><span class="fa fa-thumbs-up"> | 12230 </span><span class="fa fa-eye"> | 19 </span><span class="fa fa-comment"></span></p>
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
			
		</div>
	</div>
</section>
<!-- tour packages -->

<%@ include file="/temp/footer.jsp" %>