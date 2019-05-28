<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Grand Tour Travel Category Flat Bootstrap Responsive Web
	Template | Home :: w3layouts</title>
<meta charset="utf-8">
<meta name="keywords"
	content="Grand Tour Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<%
	String root = request.getContextPath();
%>

<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!--  datepicker from Bootstrap -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet"/> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script> -->
<!--  datepicker from JQuery UI -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<!-- css files -->
<link href="/TaYo/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- bootstrap css -->
<link href="/TaYo/css/style.css" rel='stylesheet' type='text/css' />
<link href="/TaYo/css/styletayo.css" rel='stylesheet' type='text/css' />
<!-- custom css -->
<link href="/TaYo/css/font-awesome.min.css" rel="stylesheet">
<!-- fontawesome css -->

<!-- //css files -->
<link href="/TaYo/css/css_slider.css" type="text/css" rel="stylesheet"
	media="all">

<!-- google fonts -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- //google fonts -->
</head>
<style type="text/css">
#navbarCollapse>ul {
	float: none;
}
</style>
<body>
	<nav class="navbar navbar-expand-md bg-light navbar-light ">
		<div class="container">
			<!-- bg-light -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"> <img
				src="${pageContext.request.contextPath}/images/bus.png" width="50px" height="50px">
				TayoTayo
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/tayoplace/tayoPlace.jsp">여행지추천</a></li>
					<li class="nav-item active"><a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/tayotogether/tayotogether.jsp">함께타요</a></li>
					<li class="nav-item active"><a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/schedule?act=schedule">일정만들기</a></li>
					<li class="nav-item active"><a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/tayorecomand/recomand.jsp">여행일정추천</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/head_nav/?act=join" data-target="#loginModal" data-toggle="modal">로그인</a></li>
					<li class="nav-item active"><a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/head_nav/?act=join" data-target="#registerModal" data-toggle="modal">회원가입</a></li>
				</ul>
			</div>
			<!--  login Modal -->
			<div class="modal fade" id="loginModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title"><img src="${pageContext.request.contextPath}/images/bus.png" width="50px" height="50px">    Tayo 로그인</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<label for="email">이메일 주소 : </label>
  							<input type="text" class="form-control" id="email" placeholder="example@email.com">
  							<label for="pwd">비밀번호 : </label>
  							<input type="password" class="form-control" id="pwd" placeholder="password">
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary btn-block" data-dismiss="modal">로그인</button>
						</div>
						
						<div class="modal-body">
							<button type="button" class="btn">비밀번호 찾기</button> | <button type="button" class="btn btn-link">회원가입</button>
						</div>

					</div>
				</div>
			</div>
			
			<!--  register Modal -->
			<div class="modal fade" id="registerModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title"><img src="${pageContext.request.contextPath}/images/bus.png" width="50px" height="50px">    Tayo 회원가입</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<label for="usrname">이름 : </label>
  							<input type="text" class="form-control" id="usrname" placeholder="name">
							<label for="usremail">이메일 주소 : </label>
  							<input type="text" class="form-control" id="usremail" placeholder="example@email.com">
  							<label for="usrpwd">비밀번호 : </label>
  							<input type="password" class="form-control" id="usrpwd" placeholder="password">
  							<div class="form-check-inline">
  								<label class="form-check-label">
    								<input type="radio" class="form-check-input" name="optradio">남
  								</label>
							</div>
							<div class="form-check-inline">
  								<label class="form-check-label">
    								<input type="radio" class="form-check-input" name="optradio">여
  								</label>
							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary btn-block" data-dismiss="modal">회원가입</button>
						</div>
						
						<div class="modal-body">
							<label>이미 회원이신가요?</label>
							<button type="button" class="btn btn-link">로그인</button>
							<div class="form-check">
  								<label class="form-check-label">
    								<input type="checkbox" class="form-check-input" value="">타요타요에 가입하면서 이용약관 과 개인정보 취급방침을 확인하고 이에 동의합니다.
  								</label>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</nav>