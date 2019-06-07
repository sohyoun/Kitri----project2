<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="tripSeq" value="${requestScope.tripSeq}"/>
<c:set var="tripTitle" value="${requestScope.tripTitle}"/>
<c:set var="startDate" value="${requestScope.startDate}"/>
<c:set var="endDate" value="${requestScope.endDate}"/>
<c:set var="nowNum" value="${requestScope.nowNum}"/>
<c:set var="tripNum" value="${requestScope.tripNum}"/>
<c:set var="email" value="${requestScope.email}"/>
<c:set var="dd" value="${requestScope.dd}"/>
<c:set var="likeCount" value="${requestScope.likeCount}"/>
<script>
$(function(){
	//plandetail(개요/일정표/지도/문의게시판) 보기
	$("li.nav-item > a").click(function(){
		var $url = $(this).attr("href");
		console.log("${pageContext.request.contextPath}/"+$url);
		$.ajax({
			url : '${pageContext.request.contextPath}/togetherplans',
			method:'get',
			data:'tripSeq=${tripSeq}&dd=${dd}&startDate=${startDate}&url='+$url,
			success : function(result){
				$("div.container.tab-pane.dcontents").html(result.trim());
			}
		});
		return false;
	});
	
	//좋아요 하트 처리
	$("#disheart").click(function(){
		//fullheart로 바꾸기 & 좋아요 수 +1
		$("#disheart").css("display", "none");
		$("#fullheart").css("display", "block");
		$.ajax({
			url : '${pageContext.request.contextPath}/togetherheart',
			method : 'get',
			data : 'tripSeq=${tripSeq}&likeCount=${likeCount}&heart=1'
		});
		console.log("${likeCount}");
		return false;
	});
	$("#fullheart").click(function(){
		//disheart로 바꾸기 & 좋아요 수 -1
		//document.getElementById("disheart").style.display = "block";
		//document.getElementById("fullheart").style.display = "none";
		$("#disheart").css("display", "block");
		$("#fullheart").css("display", "none");
		$.ajax({
			url : '${pageContext.request.contextPath}/togetherheart',
			method : 'get',
			data : 'tripSeq=${tripSeq}&likeCount=${likeCount}&heart=-1'
		});
		console.log("${likeCount}");
		return false;
	});
});
</script>
<style>
.nav-link {
		padding: 0.5rem;
	}
.pdiv{
	width: 50%;
	float: left;
}
.plike {
	width : 50%;
	float : right;
}
.pheartimg {
	float : right;
	height: 50px;
}
</style>
<section class="packages">
	<div class="container py-sm-3">
	<div class="twplandetail">
		<div class="pdheader">
		<div class="pdheaderdetail">
		<div class="pdheaderdetailcontent">
			<div class="pdiv">
				<div class="pname">${tripTitle}</div>
				<div class="ptime">${startDate}~${endDate} (${dd})</div>
				<div class="twppeople">정원 : ${nowNum}/${tripNum}</div>
				<div class="pleader"><span class="fa fa-user-circle"> ${email}</div>
			</div>
			<div class="plike">
				<span id="disheart" style="display:block;"><img class="pheartimg" src="/TaYo/images/heart_2.png"></span>
				<span id="fullheart" style="display:none;"><img class="pheartimg" src="/TaYo/images/disheart.png"></span>
			</div>
		</div>
		</div>
		</div>
		<div class="pdmenu">
		<ul class="nav nav-tabs" role="tablist">
   			<li class="nav-item">
     			<a class="nav-link active" data-toggle="tab" href="togetheroverall">개요</a>
    		</li>
    		<li class="nav-item">
     			<a class="nav-link" data-toggle="tab" href="togetherschedule">일정표</a>
    		</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="togethermap">지도</a>
   			</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="togetherquestion">문의게시판</a>
   			</li>
   			<div class="joinbtnlist">
		<%!int twBtn = 1; %>
		<%if(twBtn == 1) { %>
   			<li>
				<button type="button" class="btn btn-primary">가입신청</button>
   			</li>
		<%} else if(twBtn ==2){ %>
   			<li>
				<button type="button" class="btn btn-success">가입신청중</button>
   			</li>
		<%} else { %>
   			<li>
				<button type="button" class="btn btn-danger">가입탈퇴</button>
   			</li>
		<%} %>
   			<li>
				<button type="button" class="btn btn-secondary">문의하기</button>
   			</li>
			</div>
 		</ul>
		</div>
		<div class="tab-content">
    		<div id="togetheroverall" class="container tab-pane active dcontents"><br>
    				
    		</div>
    		<div id="schedule" class="container tab-pane fade dcontents"><br>
      			
   	 		</div>
    		<div id="map" class="container tab-pane fade dcontents"><br>
      			
    		</div>
    		<div id="question" class="container tab-pane fade dcontents"><br>
      			
    		</div>
  		</div>
	</div>
	</div>
</section>
<div class="rrrrrrr" style="height: 2000px;">
</div>
