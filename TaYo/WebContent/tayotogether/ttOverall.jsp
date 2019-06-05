<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="tripSeq" value="${requestScope.tripSeq}"/>
<c:set var="dd" value="${requestScope.dd}"/>
<c:set var="startDate" value="${requestScope.startDate}"/>
<c:set var="endDate" value="${requestScope.endDate}"/>

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
	
	
</style>

<script>
$(function(){
	$("label[class='description']").click(function() {
		// to be implemented
	});
	
	$("button[class='btn btn btn-light']").click(function() {
		$("#pathModal").modal();

		$("#pathModal").on('shown.bs.modal', function() {
			var container = document.getElementById('mapModal');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
	
			var map = new daum.maps.Map(container, options);
		});
	});
	var tripDay = $("#tripDay").text();
	$.ajax({
		url : "${pageContext.request.contextPath}/togetheroveralldt",
		method:'get',
		data:{
				tripSeq : tripSeq,
				tripDay : tripDay
		},
		success : function(result){
			$("div.daydetaillist").html(result.trim());
		}
	});
});
</script>

<div class="container mb-4" data-spy="scroll" data-target="#dayinfo"
	data-offset="10">
	<div class="row">
		<div id="dayinfo" class="col-sm-1">
			<div class="btn-group-vertical">
				<span class="fa fa-chevron-up"></span>
				<c:forEach begin="1" end="${dd}" var="i">
				<a class="nav-link" href="#day${i}">${i}일차</a>
				</c:forEach>
				<span class="fa fa-chevron-down"></span>
			</div>
		</div>
		
		<div class="col-sm-7" style="overflow-y: auto; height: 100rem;">
			<c:forEach begin="1" end="${dd}" var="i">	
				<div class="daytitle">
      				<div class="daynum" id="day${i}">DAY<span id="tripDay">${i}</span></div>
      				<div class="daytitlecontent"><div class="daydate">2015.08.09 (일)</div><div class="daycplace">서울,전주</div></div>
      			</div>
      			<div class = "daydetaillist">
      			
      			</div>
      		</c:forEach>	
		</div>

		<!-- Load Map dynamically -->
		<div class="col-sm-4">
			<div id="map" style="width: 100%; height: 60%;"></div>
			<script>
				$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830&autoload=false', function () {
					daum.maps.load(function() {
						var container = document.getElementById('map');
						var options = {
							center: new daum.maps.LatLng(33.450701, 126.570667),
							level: 3
						};
				
						var map = new daum.maps.Map(container, options); 
						}); 
					});
			</script>

			<br>
			<div style="border: solid;">
				<div class="row">
					<div class="col-sm-4">관광지1</div>
					<div class="col-sm-4">관광지2</div>
					<div class="col-sm-4">관광지3</div>
				</div>
				<div class="row">
					<div class="col-sm-4">관광지4</div>
					<div class="col-sm-4">관광지5</div>
					<div class="col-sm-4">관광지6</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/tayoschedule/planpath.jsp"%>