<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/temp/header.jsp" %>

<style>
	.nav-link {
		padding: 0.5rem;
		display: inline-block;
	}
	
	.nav-tabs {
		display: inline-block;
	}
	
	.nav-item {
		display: inline-block;
	}
</style>

<script>
	$(function(){
		var aArr = $(".pdmenu>ul>li>a");
		
		$(aArr).click(function(){
			var vUrl = $(this).attr("href");
			$.ajax({
				url: vUrl,
				method: 'post',
				success: function (result) {
					$("#content").html(result);
				 }
			});
			return false;
		});
		
		//
		$("#modifyBtn").click(function() {
			location.href = '${pageContext.request.contextPath}/schedule?act=modifyPlan';
		});
		
		// Delete plan
		$("#deleteBtn").click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/schedule',
				data: 'act=deletePlan' + '&email=' + 'test@kitri.re.kr' + '&title=' + $("div[class='pname']").text().trim(),
				method: 'post',
				success: function(result) {
					alert("여행 일정 삭제가 " + result.trim());
					location.href = '${pageContext.request.contextPath}/schedule?act=myschedule';
				},
				error: function(error) {
					alert("여행 일정을 삭제하는 중 에러가 발생하였습니다.");
				}
			});
			return false;
		});
	});
</script>

<!-- Todo -->
<c:set var="basicDTO" value="${sessionScope.TripBasicDTO}"/>
<fmt:parseDate var="startPlanDate" value="${basicDTO.startDate}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="endPlanDate" value="${basicDTO.endDate}" pattern="yyyy-MM-dd"/>
<fmt:parseNumber value="${startPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"></fmt:parseNumber>
<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>

<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<div class="twplandetail">
			<div class="pdheader">
				<div class="pdheaderdetail">
					<div class="pdheaderdetailcontent">
						<div class="pname">${basicDTO.tripTitle}</div>
						<div class="ptime">${basicDTO.startDate} ~ ${basicDTO.endDate} (${endDate - startDate + 1})</div>
						<div class="twppeople">정원 : ? / ${basicDTO.tripNum}</div>
						<div class="pleader"><span class="fa fa-user-circle"> ${basicDTO.email}</span></div>
					</div>
				</div>
			</div>
			<div class="pdmenu">
				<ul class="nav nav-tabs" role="tablist">
		   			<li class="nav-item">
		     			<a class="nav-link" data-toggle="tab" href="${pageContext.request.contextPath}/schedule?act=overall">개요</a>
		    		</li>
		    		<li class="nav-item">
		     			<a class="nav-link" data-toggle="tab" href="${pageContext.request.contextPath}/schedule?act=planTable">일정표</a>
		    		</li>
		   			<li class="nav-item">
		    			<a class="nav-link" data-toggle="tab" href="${pageContext.request.contextPath}/schedule?act=planMap">지도</a>
		   			</li>
		   		</ul>
		   		<button id="deleteBtn" class="btn btn-link pull-right">삭제하기</button>
		   		<button id="modifyBtn" class="btn btn-link pull-right">수정하기</button>
			</div>
		</div>
	</div>
</section>

<div id="content"></div>


<%@ include file="/temp/footer.jsp" %>