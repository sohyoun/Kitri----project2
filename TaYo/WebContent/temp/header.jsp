<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/temp/header_headimport.jsp" %>
</head>

<script>
	$(function() {
		 //alert("메인페이지 들어왔어!");
		$("button#login").click(function(){
		  	var $email = $("input#email").val();
			var $pass = $("input#pass").val();
			/* console.log($email);
			console.log($pass); */ 
			$.ajax({
				url : "${pageContext.request.contextPath}/login",
				data : $("form.loginform").serialize(),
				method : 'post',
				success : function(result){
					//console.log(result)
					//alert(result)
					if(result =='1'){//회원가입성공
						location.href = "${pageContext.request.contextPath}/index.jsp";						
					}else if(result =='2'){//관리자 페이지로
	 					location.href = "${pageContext.request.contextPath}/tayoadmin/index.jsp";						
					}else{
						alert('로그인 실패');
					}
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log('error'+errorThrown);
				}
			});
			return false;
		}); 
		//로그아웃 버튼
		$("#header_logout").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/logout",
				method : 'post',
				success : function(result){
					location.href = "${pageContext.request.contextPath}/index.jsp";
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log('error'+errorThrown);
				}
			});
			return false;
		});
		
		
		//회원가입 버튼
		$(function(){
			$('username')
			$('#header_register_btn').click(function() {
				console.log('header_register_btn');
				$.ajax({
					url : "${pageContext.request.contextPath}/register",
					data : $("form.registerform").serialize(),
					method : 'post',
					success : function(result){
// 						location.href = "${pageContext.request.contextPath}/tayoadmin/index.jsp";
						console.log('button#login ajax: ' +result.trim())
						if(result.trim() ==1){
							console.log('회원가입에 성공하였습니다.');
							location.href = "${pageContext.request.contextPath}/index.jsp";
						}else{
							console.log('회원가입 실패.');
						}
						
						
						console.log('${sessionScope.logininfo}');
					},
					error : function(jqXHR, textStatus, errorThrown){
						console.log('error'+errorThrown);
					}
				});
			});
		});
	});//end function 

</script>

<body>
	<nav class="navbar navbar-expand-md bg-light navbar-light ">
		<div class="container">
			<!-- bg-light -->
			<!--  nav Modal -->
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/index.jsp"> <img
				src="${pageContext.request.contextPath}/images/bus.png" width="50px"
				height="50px"> TayoTayo
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarCollapse">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link text-nowrap"
						href="${pageContext.request.contextPath}/tayoplace/tayoPlace.jsp">여행지추천</a></li>
					<li class="nav-item active"><a class="nav-link text-nowrap"
						href="${pageContext.request.contextPath}/tayotogether/tayotogether.jsp">함께타요</a></li>
					<li class="nav-item active">
						<a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/schedule?act=schedule">일정만들기</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/tayorecomand/recomand.jsp">여행일정추천</a>
					</li>
				</ul>
				
				<%-- href="${pageContext.request.contextPath}/head_nav/?act=join" --%>
				<%-- href="${pageContext.request.contextPath}/head_nav/?act=join" --%>
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${empty sessionScope.loginInfo}">
							<li class="nav-item active">
								<a class="nav-link text-nowrap" data-target="#loginModal" data-toggle="modal" href="#">
								로그인</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link text-nowrap" data-target="#registerModal" data-toggle="modal" href="#">
								회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item active">
								<span>${fn:trim(sessionScope.loginInfo)}님 환영합니다. <a class="nav-link text-nowrap " href="#" id="header_logout" style="display:inline">로그아웃</a></span>
							</li>
							<li class="nav-item active">
								<a class="nav-link text-nowrap" href="${pageContext.request.contextPath}/tayoadmin/email/emailwrite.jsp">신고하기</a>
							</li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
			<!--  end nav Modal -->
			
			<!--  login Modal -->
			<div class="modal fade" id="loginModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">
								<img src="${pageContext.request.contextPath}/images/bus.png"
									width="50px" height="50px"> Tayo 로그인
							</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
					<div class="modal-body">
						<form class ="loginform">
							<label for="email">이메일 주소 : </label> <input type="text" class="form-control" id = "email" name="email" placeholder="example@email.com" required="required">
							<label for="pwd">비밀번호 : </label> <input type="password" class="form-control" id = "pass" name="pass" placeholder="password" required="required">
						</form>
					</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button id="login" class="btn btn-primary btn-block" data-dismiss="modal">로그인</button>
						</div>

						<div class="modal-body">
							<button type="button" class="btn">비밀번호 찾기</button>|
							<button type="button" class="btn btn-link" >회원가입</button> 
						</div>

					</div>
				</div>
			</div>
			<!--  end login Modal -->
			
			<!--  register Modal -->
			<div class="modal fade" id="registerModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">
								<img src="${pageContext.request.contextPath}/images/bus.png"
									width="50px" height="50px"> Tayo 회원가입
							</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<form class ="registerform">
							<div class="modal-body">
									<label for="usrname">이름 : </label> 
									<input type="text" class="form-control" id="usrname" name="usrname" placeholder="name"> 
									<label for="usremail">이메일 주소 : </label> 
									<input type="text" class="form-control" id="usremail" name="usremail" placeholder="example@email.com"> 
									<label for="usrpwd">비밀번호 : </label> 
									<input type="password" class="form-control" id="usrpwd" name="usrpwd" placeholder="password">
									<div class="form-check-inline"> 
										<label class="form-check-label"> 
											<input type="radio" class="form-check-input" name="optradio" value="M"> 남 
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> 
											<input type="radio"	class="form-check-input" name="optradio" value="W">여
										</label>
									</div>
							</div>
	
							<!-- Modal footer -->
							<div class="modal-footer">
								<button class="btn btn-primary btn-block"
									data-dismiss="modal" id="header_register_btn">회원가입</button>
							</div>
						</form>
						<div class="modal-body">
							<label>이미 회원이신가요?</label>
							<a><button class="btn btn-link" >로그인</button></a>
							<div class="form-check">
								<label class="form-check-label"> 
								<input type="checkbox" class="form-check-input" value="">
								타요타요에 가입하면서 이용약관 과
									개인정보 취급방침을 확인하고 이에 동의합니다.
								</label>
							</div>
						</div>
					</div>
				</div>
			</div><!-- 회원가입 -->
			<!--  end register Modal -->
		</div>
	</nav>