<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix ="x" uri ="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<style>
	.list-group-item {
		padding: 0;
		margin: 0;
	}
	
	.labelday {
		display: inline-block;
		width: 5rem;
		text-align: center;
		background-color: darkgray;
		color: white;
	}
	
	.labellocation {
		display: inline-block;
		width: 5rem;
		text-align: center;
		background-color: lightgray;
		color: black;
	}
	
	.circle {
		width: 2rem;
		height: 2rem;
		background-color: #223b68;
		color: white;
		border-radius: 50%;
		text-align: center;
		font-weight: bold;
		line-height: 2rem;
		/* margin-left: 1rem; */
		display: inline-block; 
	}
	
	.nav-link {
		padding: 0.5rem;
	}
	
	.btn-path {
		margin: auto;
	}
	
	.btn-to-path {
		width: 10rem;
		height: 1.5rem;
		color: #ff9320;
	}
	
	.btn.btn-sm.btn-link {
		padding : 0rem;
		margin-top : -0.7rem;
	}
</style>

<script>
$(function(){
	var map;
	$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830&autoload=false', function () {
		daum.maps.load(function() {
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(37.485087, 126.898855),
				level: 3
			};
	
			map = new daum.maps.Map(container, options); 
		}); 
	});
	
	$("button[name='pdinfo']").click(function() {
		var pdtitle = $(this).parent().parent().find("div[class='daydetailtitle']");
		var pdsub = $(this).parent().parent().find("div[class='daydetailsub']");
		var pdtitleinput = $(this).parent().parent().find("input[name='pdtitletext']");
		var pdsubtext = $(this).parent().parent().find("textarea[name='pdsubtext']");
		
		$(pdtitle).hide();
		$(pdsub).hide();
		$(pdtitleinput).val($(pdtitle).text().trim());
		$(pdsubtext).val($(pdsub).text().trim());
		$(this).parent().parent().find("div[name='pdmenu']").show();
		
		return false;
	});
	
	$("button[name='pdsave']").click(function() {
		var pdtitle = $(this).parent().parent().find("div[class='daydetailtitle']");
		var pdsub = $(this).parent().parent().find("div[class='daydetailsub']");
		var pdtitleinput = $(this).parent().parent().find("input[name='pdtitletext']");
		var pdsubtext = $(this).parent().parent().find("textarea[name='pdsubtext']");
		
		$(this).parent().parent().find("div[name='pdmenu']").hide();
		$(pdtitle).html("<strong>"+$(pdtitleinput).val().trim()+"</strong>");
		$(pdsub).text($(pdsubtext).val().trim());
		$(pdtitle).show();
		$(pdsub).show();
		
		var detailday = $(this).parent().parent().find("span[class='circle']");
		
		$.ajax({
			url : '${pageContext.request.contextPath}/schedule',
			data : 'act=saveTitleContent' + '&day=' + $(detailday).attr("day") + '&order=' + $(detailday).text().trim() + '&detailtitle=' + $(pdtitleinput).val().trim() + '&detailsub=' + $(pdsubtext).val().trim(),
			method : 'post',
			success : function(result) {
				if (result == '실패하였습니다.') {
					alert('제목 및 내용 저장에 ' + result);
				}
			},
			error : function(error) {
				alert(error);
			}
		});
		return false;
	});
	
	// show path (do not using modal window)
	$("button[class='btn btn btn-light']").click(function() {
// 		$("#pathModal").modal();

// 		$("#pathModal").on('shown.bs.modal', function() {
// 			var container = document.getElementById('mapModal');
// 			var options = {
// 				center: new daum.maps.LatLng(37.485087, 126.898855),
// 				level: 3
// 			};
	
// 			var map = new daum.maps.Map(container, options);
// 		});
	});
});
</script>

<c:set var="areaCodes" value="${sessionScope.areaCodes}"/>
<x:parse var="area" xml="${areaCodes}"/>

<c:set var="basicDTO" value="${sessionScope.TripBasicDTO}"/>
<c:set var="detailDTO" value="${basicDTO.detailList}"/>

<div class="container mb-4" data-spy="scroll" data-target="#dayinfo" data-offset="10">
	<div class="row">
		<div id="dayinfo" class="col-sm-1">
			<div class="btn-group-vertical" style="position: sticky; top: 1rem">
				<span class="fa fa-chevron-up"/>
				<c:set var="olddays" value="-1"/>
				<c:forEach var="tabledays" items="${detailDTO}">
					<c:if test="${olddays != tabledays.trip_day}">
						<a class="nav-link" href="#day${tabledays.trip_day}">DAY${tabledays.trip_day}</a>
						<c:set var="olddays" value="${tabledays.trip_day}"/>
					</c:if>
				</c:forEach>
				<span class="fa fa-chevron-down"/>
			</div>
		</div>

		<div class="col-sm-7" style="overflow-y: auto; height: 50rem;">
			<c:set var="olddays" value="-1"/>
			<c:set var="idx" value="1"/>
			<c:set var="length" value="${fn:length(detailDTO)}"/>
			<c:forEach var="tabledays" items="${detailDTO}">
				<c:if test="${olddays != tabledays.trip_day}">
					<c:set var="olddays" value="${tabledays.trip_day}"/>
					<div class="daytitle">
						<div class="daynum" id="day${tabledays.trip_day}">DAY${tabledays.trip_day}</div>
						<jsp:useBean id="myDate" class="java.util.Date"/>
						<fmt:parseDate var="startPlanDate" value="${basicDTO.startDate}" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${startPlanDate.time + (tabledays.trip_day - 1)*(1000*60*60*24)}" integerOnly="true" var="startDate"/>
						<c:set target="${myDate}" property="time" value="${startDate}"/>
						<fmt:formatDate var="convertday" value="${myDate}" pattern="yyyy-MM-dd (E)"/>
						<div class="daytitlecontent">
							<div class="daydate">${convertday}</div>
							<c:set var="flag" value="false"/>
							<x:forEach var="areaCode" select="$area/response/body/items/item">
								<c:if test="${not flag}">
									<x:set var="codeValue" select="$areaCode/code"/>
									<x:set var="locName" select="$areaCode/name"/>
									<c:set var="loc" value="${tabledays.loc_id}"/>
									<x:if select="$codeValue = $loc">
										<div class="daycplace"><x:out select="$locName"/></div>
										<c:set var="flag" value="true"/>
									</x:if>
								</c:if>
							</x:forEach>
						</div>
					</div>
					<c:set var="index" value="1"/>
					<c:forEach var="places" items="${detailDTO}">
						<c:if test="${olddays == places.trip_day}">
							<div class="daydetail">
								<div class="daydetailnum"><span class="circle" day="${places.trip_day}">${index}</span></div>
								<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
								<div class="daydetailcontent">${places.place_name}<br><button class="btn btn-sm btn-link" name="pdinfo">제목&내용 수정</button></div>
								<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
								<div class="daydetailtitle" name="title"><strong>${places.detail_title}</strong></div>
								<div class="daydetailsub" name="detailsub" style="height: 4.5rem; overflow-y: auto; white-space: pre-line; word-wrap: break-word">${places.detail_content}</div>
								<div name="pdmenu" style="display: none;">
									<input type="text" name="pdtitletext" placeholder="제목을 입력하세요." style="width: 70%"/>
									<textarea name="pdsubtext" placeholder="내용을 입력하세요." cols="51" rows="2" style="resize: none; margin-top: 0.5rem"></textarea>
									<button class="btn btn-sm btn-link" name="pdsave">저장</button>
								</div>
							</div>
							<c:if test="${idx != length}">
								<div><li class="btn-path"><button class="btn btn btn-light">경로 탐색</button></li></div>
								<c:set var="idx" value="${idx + 1}"/>
							</c:if>
							<c:set var="index" value="${index + 1}"/>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</div>

		<!-- Load Map dynamically -->
		<div class="col-sm-4">	
			<div id="map" style="width: 100%; height: 40%; position: sticky; top: 1rem"></div>
			<br>
			<div style="border-width: 2px; position: sticky; top: 22.5rem">
				<ul class="list-group">
					<li class="list-group-item">경로1</li>
					<li class="list-group-item">경로2</li>
					<li class="list-group-item">경로3</li>
					<li class="list-group-item">경로4</li>
					<li class="list-group-item">경로5</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@ include file="/tayoschedule/planpath.jsp"%>