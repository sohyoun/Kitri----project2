<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#daylist {
		overflow-x: hidden;
		overflow-y: auto;
		height: 30rem;
	}
	
	#placelist {
		overflow-x: hidden;
		overflow-y: auto;
		height: 26rem;
	}
	
	#location {
		text-align: center;
		width: 100%;
		height: 100%;
	}
	
	.list-group {
		margin-bottom: 0.5rem;
	}
	
	button[name="placebtn"], button[name="planbtn"], button[name="addplacebtn"] {
		float: right;
		width: 2rem;
		height : 2rem;
		text-align: center;
	}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/httpRequest.js"></script>
<script type="text/javascript">
$(function() {
	// Map
	var container = document.getElementById('map');
	var options = {
		center: new daum.maps.LatLng(37.485087, 126.898855),
		level: 7
	};
	var map = new daum.maps.Map(container, options);
	
	
	// Modal window
	$("#planSave").click(function() {
		$("#planSaveModal").modal();
	});
	
	// Sorting dayplan
	function sortlist() {
		var lists = $(".list-group");
		var length = lists.length;
		
		for (var i = 0; i < length; i++) {
			$(lists[i]).find(".list-group-item-1").text('DAY' + (i+1));
		}
	}
	
	// drag & drop and sorting
	$("#daylist").sortable({
		axis: "y",
		revert: false,
		revertDuration: 0,
		items: ".list-group:not(#controlday)",
		update: function(event, ui) {
			sortlist();
		}
	});
 	$(".list-group").sortable({
 		axis: "y",
 		revert: false,
 		revertDuration: 0,
 		items: ".list-group-item:not(.list-group-item-1)",
 		connectWith: ".list-group"
	});
 	
 	// Create dayplan (with drag & drop and sorting : also applied dynamically created elements)
	var buttons = $("#controlday>button");
	$(buttons[0]).click(function() {
		var length = $(".list-group").length;
		var obj = $("<ul class='list-group ui-sortable-handle'><li class='list-group-item-1' style='background-color:steelblue; color: white; padding: 0.3rem;'>" + "DAY" + (length + 1) + "</li></ul>");
		$(obj).sortable({
	 		axis: "y",
	 		revert: false,
	 		revertDuration: 0,
	 		items: ".list-group-item:not(.list-group-item-1)",
	 		connectWith: ".list-group"
		});
		$("#daylist").append(obj);
	});
	$(buttons[1]).click(function() {
		var length = $(".list-group").length;
		if (length != 1) {
			$("#daylist>ul:last").remove();
		} else {
			$("#daylist>ul:first").remove();
			var obj = $("<ul class='list-group ui-sortable-handle'><li class='list-group-item-1' style='background-color:steelblue; color: white; padding: 0.3rem;'>DAY1</li></ul>");
			$(obj).sortable({
		 		axis: "y",
		 		revert: false,
		 		revertDuration: 0,
		 		items: ".list-group-item:not(.list-group-item-1)",
		 		connectWith: ".list-group"
			});
			$("#daylist").append(obj);
		}
	});
	
	// Add/Remove place to specified dayplan
	var areaCode = "";
	var place = "";
	var x = "";
	var y = "";
	var contentid="";
	$("#tablebody").on('click', "tr>td>ul>li>button[name='placebtn']", function(){
		$("#daylist>ul>li.list-group-item-1").append("<button class='btn btn-sm btn-success' name='addplacebtn'>+</button>");
		areaCode = $(this).parent().attr("areaCode");
		place = $(this).parent().attr("value");
		x = $(this).parent().attr("axisx");
		y = $(this).parent().attr("axisy");
		contentid = $(this).parent().attr("contentid");
		console.log(contentid);
		$("#tablebody>tr>td>ul>li>button[name='placebtn']").remove();
		return false;
	});
	
	$("#daylist").on('click', "ul>li>button[name='planbtn']", function(){
		$(this).parent().remove();
		return false;
	});
	
	$("#daylist").on('click', "ul>li.list-group-item-1>button[name='addplacebtn']", function() {
		$(this).parent().parent().append("<li class='list-group-item ui-sortable-handle' style='padding: 0.3rem;' value='" + place + "' axisx='" + x + "' axisy='" + y + "' areaCode='" + areaCode + "' contentid='"+contentid+"'>" + place + "<button class='btn btn-sm btn-secondary' name='planbtn'>-</button></li>");
		$("[name='addplacebtn']").remove();
		$(".placeclass>li.list-group-item").append("<button class='btn btn-sm btn-primary' name='placebtn'>+</button>");
		return false;
	});
	
	var isFirst = true;
	var polylines = new Array();
	var markers = new Array();
	$("#daylist").on('click', "ul>li.list-group-item-1", function() {
		var items = $(this).parent().find(".list-group-item");
		if (items.length == 0) {
			return false;
		}
		
		var LatLng = new Array();
		$(items).each(function() {
			LatLng.push(new daum.maps.LatLng($(this).attr("axisy"), $(this).attr("axisx")));
		});
		var LatLngLength = LatLng.length;
		
		// Draw line to map
		map.panTo(LatLng[LatLngLength - 1]);
		
		if (isFirst != true) {
			var polyLength = polylines.length;
			for(var i = 0; i < polyLength; i++) {
				polylines[i].setMap(null);
			}
			polylines = null;
			polylines = new Array();

			var lenMarker = markers.length;
			for(var i = 0; i < lenMarker; i++) {
				markers[i].setMap(null);
			}
			markers = null;
			markers = new Array();
		} else {
			isFirst = false;
		}
		
		for (var idx = 0; idx < LatLngLength - 1; idx++) {
			var polyline = new daum.maps.Polyline({
				map: map, 
				path: LatLng.slice(idx, idx + 2),
				endArrow: true,
				strokeWeight: 2,
				strokeColor: '#FF00FF',
				strokeOpacity: 0.9,
				strokeStyle: 'solid'
			});
			polylines.push(polyline);
		}
		
		var markerImage = new daum.maps.MarkerImage("http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", new daum.maps.Size(24, 35));
		
		for (var idx = 0; idx < LatLngLength; idx++) {
			var marker = new daum.maps.Marker({
				map: map,
				position: LatLng[idx],
				title: $(items[idx]).attr("value"),
				image : markerImage
			});
			markers.push(marker);
		}
		
		return false;
	});
	
	
	// When press enter key
	$("#place").keydown(function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				url: '${pageContext.request.contextPath}/schedule',
				data: 'act=searchTour&location=' + $("#location").val() + '&place=' + $("#place").val(),
				method: 'post',
				success: function(xml) {
					
					parser = new DOMParser();
					xmlDoc = parser.parseFromString(xml.trim(), "text/xml");

					var html;
					var prevTitle = "";
					
					$("#tablebody").empty();
					
					$(xml).find("item").each(function() {
						var title = $(this).find("title").text();
						
						if (prevTitle != title) {
							prevTitle = title;
							var image = $(this).find("firstimage2").text();
							var axisx = $(this).find("mapx").text();
							var axisy = $(this).find("mapy").text();
							var areaCode = $(this).find("areaCode").text();
							var contentid = $(this).find("contentid").text();
							html += "<tr><td width='100'><img src='" + image + "' onError=\"this.src='${pageContext.request.contextPath}/images/noImage.png'\" width='80' height='40'/></td><td><ul class='placeclass'><li class='list-group-item' style='padding: 0.3rem;' value='" + title + "' axisx='" + axisx + "' axisy='" + axisy + "' areaCode='" + areaCode + 
							"' contentid='"+ contentid +"'>" + title + "<button class='btn btn-primary' name='placebtn'>+</button></li></ul></td></tr>";
						}
					});
					
					$("#tablebody").html(html);
				},
				error: function(error) {
					console.log(error);
				}
			});
			return false;
		}
	});
});
</script>

<!-- for modify plan -->
<c:set var="loginInfo" value="${sessionScope.loginInfo}"/>
<c:set var="basicDTO" value="${sessionScope.TripBasicDTO}"/>
<c:set var="detailDTO" value="${basicDTO.detailList}"/>

<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
				<h3 class="text-wh">'나만의 일정을 계획해보세요'</h3>
				<div class="buttons mt-4">
					<c:if test="${!empty loginInfo}">
						<a class="btn pull-right" id="planSave">임시 저장 / 완료</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>

<div style="margin: 2rem;" align="center">
	<div class="scheduleBody">
		<div class="row">
			<div id="daylist" class="col-sm-3">
				<div id="controlday">
					<button type="button" class="btn mr-4 btn-outline-primary">+</button>
					<button type="button" class="btn btn-outline-primary">-</button>
					<pre><br></pre>
				</div>
				<!-- new plan -->
				<c:if test="${empty basicDTO}">
					<ul class="list-group">
						<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">DAY1</li>
					</ul>
				</c:if>
				<!-- modify plan -->
				<c:if test="${!empty basicDTO}">
					<c:set var="olddays" value="-1"/>
						<c:forEach var="tabledays" items="${detailDTO}">
							<c:if test="${olddays != tabledays.trip_day}">
								<c:set var="olddays" value="${tabledays.trip_day}"/>
								<ul class='list-group ui-sortable-handle'>
									<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">DAY${tabledays.trip_day}</li>
									<c:forEach var="places" items="${detailDTO}">
										<c:if test="${olddays == places.trip_day}">
											<li class="list-group-item ui-sortable-handle" style="padding: 0.3rem;" value="${places.place_name}" axisx="${places.posX}" axisy="${places.posY}" areaCode="${places.loc_id}"
											contentId ="${places.content_id}">${places.place_name}
											<button class="btn btn-sm btn-secondary" name="planbtn">-</button></li>
										</c:if>
									</c:forEach>
								</ul>
							</c:if>
					</c:forEach>
				</c:if>
			</div>
			
			<div class="col-sm-4">
				<div>
					<div>
						<table class="table table-sm" style="align: center;">
							<tbody align="center">
								<tr>
									<td width="100">
										<select id="location" size="1" name="location">
											<option value="1">서울
											<option value="2">인천
											<option value="3">대전
											<option value="4">대구
											<option value="5">광주
											<option value="6">부산
											<option value="7">울산
											<option value="8">세종
											<option value="31">경기
											<option value="32">강원
											<option value="33">충북
											<option value="34">충남
											<option value="35">경북
											<option value="36">경남
											<option value="37">전북
											<option value="38">전남
											<option value="39">제주
										</select>
									</td>
									<td><input type="text" class="form-control" id="place" name="place" value="" placeholder=""></input></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="placelist">
						<table class="table table-bordered table-sm">
							<tbody id="tablebody" align="center">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-sm-5">
				<div id="map" style="width: 100%; height: 100%; min-width: 50%; min-height: 50%"></div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/tayoschedule/planSave.jsp" %>

<!-- //banner -->
<%@ include file="/temp/footer.jsp" %>