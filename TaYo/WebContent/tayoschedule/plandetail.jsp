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
			location.href = '${pageContext.request.contextPath}/schedule?act=modify';
		});
		
		// Delete plan
		$("#deleteBtn").click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/schedule',
				data: 'act=deletePlan' + '&email=' + '${sessionScope.loginInfo}' + '&title=' + $("div[class='pname']").text().trim(),
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
		
		// join tayo together
		$("#joinBtn").click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/schedule',
				data: 'act=joinTT' + '&tripSeq=' + '${sessionScope.TripBasicDTO.tripSeq}',
				method: 'post',
				success: function(result) {
					alert("함께타요에 가입되었습니다.");
					location.href = '${pageContext.request.contextPath}/schedule?act=myschedule';
				},
				error: function(error) {
					alert("함께타요에 가입하는 중 에러가 발생하였습니다.");
				}
			});
			return false;
		});
		
		// out tayo together
		$("#outBtn").click(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/schedule',
				data: 'act=outTT' + '&tripSeq=' + '${sessionScope.TripBasicDTO.tripSeq}',
				method: 'post',
				success: function(result) {
					alert("함께타요에 탈퇴되었습니다.");
					location.href = '${pageContext.request.contextPath}/schedule?act=myschedule';
				},
				error: function(error) {
					alert("함께타요에 탈퇴하는 중 에러가 발생하였습니다.");
				}
			});
			return false;
		});
	});
</script>

<!-- Todo -->
<c:set var="basicDTO" value="${sessionScope.TripBasicDTO}"/>
<c:set var="ttLeaderDTO" value="${basicDTO.ttLeaderDTO}"/>
<fmt:parseDate var="startPlanDate" value="${basicDTO.startDate}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="endPlanDate" value="${basicDTO.endDate}" pattern="yyyy-MM-dd"/>
<fmt:parseNumber value="${startPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="startDate"/>
<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>

<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<div class="twplandetail">
			<div class="pdheader">
				<div class="pdheaderdetail">
					<div class="pdheaderdetailcontent">
						<div class="pname">${basicDTO.tripTitle}</div>
						<div class="ptime">${basicDTO.startDate} ~ ${basicDTO.endDate} (${endDate - startDate + 1})</div>
						<c:if test="${basicDTO.tripTheme eq '함께타요'}">
							<div class="twppeople">여행 인원 : ${ttLeaderDTO.nowNum}/${basicDTO.tripNum}명</div>
						</c:if>
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
		   		
		   		
		   		<%-- <c:if test="${sessionScope.loginInfo eq basicDTO.email}">
		   			<button id="deleteBtn" class="btn btn-link pull-right">삭제하기</button>
		   			<button id="modifyBtn" class="btn btn-link pull-right">수정하기</button>
		   		</c:if> --%>
		   		
		   		<%--내가 쓴 부분 --%>
		   		<c:choose>
		   			<c:when test="${sessionScope.loginInfo eq basicDTO.email}">
		   				<button id="deleteBtn" class="btn btn-link pull-right">삭제하기</button>
		   				<button id="modifyBtn" class="btn btn-link pull-right">수정하기</button>
		   			</c:when>
		   			<c:otherwise>
		   				<c:if test="${basicDTO.tripTheme eq '함께타요'}">
		   					<c:forEach var="partylist" items="${ttLeaderDTO.ttPartyList}">
		   						여기 안들어옴!!
		   						<c:choose>
		   							<c:when test="${sessionScope.loginInfo eq partylist}">
		   								<button id="outBtn" class="btn btn-link pull-right">탈퇴하기</button>
		   							</c:when>
		   							<c:otherwise>
		   								<button id="joinBtn" class="btn btn-link pull-right">가입하기</button>
		   							</c:otherwise>
		   						</c:choose>
							</c:forEach>
							
							<button id="outBtn" class="btn btn-link pull-right">탈퇴하기</button>
							<button id="joinBtn" class="btn btn-link pull-right">가입하기</button>
						</c:if>
		   			</c:otherwise>
		   		</c:choose>
		   		<%--내가 쓴 부분 --%>
		   		
			</div>
		</div>
	</div>
</section>

<div id="content"></div>


<%@ include file="/temp/footer.jsp" %>