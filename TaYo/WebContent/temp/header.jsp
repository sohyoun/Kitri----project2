<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Grand Tour Travel Category Flat Bootstrap Responsive Web Template | Home :: w3layouts</title>
<meta charset="utf-8">
<meta name="keywords" content="Grand Tour Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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




<!-- To be fixed modal window is not opened... -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- css files -->
<link href="/TaYo/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- bootstrap css -->
<link href="/TaYo/css/style.css" rel='stylesheet' type='text/css' />
<!-- custom css -->
<link href="/TaYo/css/font-awesome.min.css" rel="stylesheet">
<!-- fontawesome css -->

<!-- //css files -->
<link href="/TaYo/css/css_slider.css" type="text/css" rel="stylesheet" media="all">

<!-- google fonts -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- //google fonts -->
</head>
<style type="text/css">
nav ul {
    float: none;
}
</style>
<body>
	<nav class="navbar navbar-expand-md bg-light navbar-light ">
		<div class="container">
			<!-- bg-light -->
			<a class="navbar-brand" href="<%=root%>/head_nav/?act=main"> <img src="<%=root%>/images/bus.png" width="50px" height="50px"> TayoTayo
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link text-nowrap" href="<%=root%>/head_nav/?act=join">지역추천</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="<%=root%>/tayotogether/tayotogether.jsp">함께타기</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="<%=root%>/schedule?act=schedule">일정짜기</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="<%=root%>/head_nav/?act=join">지역추천</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link text-nowrap" href="<%=root%>/head_nav/?act=join" data-target="#myModal" data-toggle="modal">로그인</a></li>
					<li class="nav-item"><a class="nav-link text-nowrap" href="<%=root%>/head_nav/?act=join" data-target="#myModal" data-toggle="modal">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>