<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="tripSeq" value="${requestScope.tripSeq}"/>
<c:set var="dd" value="${requestScope.dd}"/>
<script>
$(function(){
	$("li.nav-item > a").click(function(){
		var $url = $(this).attr("href");
		console.log("${pageContext.request.contextPath}/"+$url);
		$.ajax({
			url : '${pageContext.request.contextPath}/'+$url,
			method:'get',
			data:'tripSeq=${tripSeq}&dd=${dd}',
			success : function(result){
				$("#Overall").html(result.trim());
			}
		});
		return false;
	});
});
</script>

<section class="packages">
	<div class="container py-sm-3">
	<div class="twplandetail">
		<div class="pdheader">
		<div class="pdheaderdetail">
		<div class="pdheaderdetailcontent">
			<div class="pname">${requestScope.tripTitle}</div>
			<div class="ptime">${requestScope.startDate}~${requestScope.endDate} (${requestScope.dd})</div>
			<div class="twppeople">정원 : ${requestScope.nowNum}/${requestScope.tripNum}</div>
			<div class="pleader"><span class="fa fa-user-circle"> ${requestScope.email}</div>
		</div>
		</div>
		</div>
		<div class="pdmenu">
		<ul class="nav nav-tabs" role="tablist">
   			<li class="nav-item">
     			<a class="nav-link active" data-toggle="tab" href="togetheroverall">개요</a>
    		</li>
    		<li class="nav-item">
     			<a class="nav-link" data-toggle="tab" href="#schedule">일정표</a>
    		</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#map">지도</a>
   			</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#question">문의게시판</a>
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
    		<div id="Overall" class="container tab-pane active"><br>
    				
    		</div>
    		<div id="schedule" class="container tab-pane fade"><br>
      			
   	 		</div>
    		<div id="map" class="container tab-pane fade"><br>
      			
    		</div>
    		<div id="question" class="container tab-pane fade"><br>
      			
    		</div>
  		</div>
	</div>
	</div>
</section>
<div class="rrrrrrr">
</div>
