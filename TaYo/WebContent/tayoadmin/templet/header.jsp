<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>	

<c:set var ="login" value = "${sessionScope.loginInfo}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TayoTayo</title>
 
<link rel="stylesheet" type="text/css" href="resource/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="resource/css/local.css" />
<script type="text/javascript" src="resource/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src ="resource/bootstrap/js/bootstrap.js"></script>
<script type = "../chart/chart.js"></script>
<script type = "../chart/chart.min.js"></script>
<script type = "../chart/utils.js"></script>

<!-- you need to include the shieldui css and js assets in order for the charts to work -->
<link id="gridcss" rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/dark-bootstrap/all.min.css" />
<script type="text/javascript" src="resource/bootstrap/js/chart.js"></script> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
body{
	overflow-x:hidden;
}
</style>
</head>
<script>
$(function(){
	$("li#board").click(function(){
		//alert("관리 클릭 들어옴?")
		$.ajax({
			url : '${pageContext.request.contextPath}/adminmembercnt',
			method : 'get',
			success : function(result){
				
			},
			error : function(){
				alert("정말 실패 ");
			}
			
		});
	});
	return false;
});

</script>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"> </span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img src="images/bus.png" width="50" height="50" /> <a
					class="navbar-brand" href="index.jsp">TayoTayo</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul id="active" class="nav navbar-nav side-nav">
					<li><a href="index.jsp"><i class="fa fa-bullseye"></i>홈</a></li>
					<li id ="board"><a href="board.jsp"><i class="fa fa-list-ol"></i>관리</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right navbar-user">
					<li class="dropdown messages-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-envelope"></i> Messages <span class="badge">2</span>
							<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">2 New Messages</li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><i class="fa fa-bell"></i></span> <span
									class="message">Security alert</span>
							</a></li>
							<li class="divider"></li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><i class="fa fa-bell"></i></span> <span
									class="message">Security alert</span>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
						</ul></li>
					<li class="dropdown user-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i>관리자 : ${login} 님<b class="caret"></b></a>
						<ul class="dropdown-menu"> 
							<li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-power-off"></i>Log Out</a></li>

						</ul></li>
				</ul>
			</div>
		</nav>