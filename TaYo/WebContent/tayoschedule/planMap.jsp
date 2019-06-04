<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function() {
	var map;
	$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830&autoload=false', function () {
		daum.maps.load(function() {
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
		
			map = new daum.maps.Map(container, options); 
			}); 
		});
	
	
	var isFirst = true;
	var polylines = new Array();
	var markers = new Array();
	$("ul.list-group").on('click', "li.list-group-item", function() {
		var items = $(this).parent().parent().find("ul>div>ul");
		var index = $(this).text().trim();
		var titles = new Array();
		if (items.length == 0) {
			return false;
		}
		
		var LatLng = new Array();
		$(items).each(function() {
			if ($(this).parent().attr("id").trim() == index) {
				LatLng.push(new daum.maps.LatLng($(this).find("li.posy").text().trim(), $(this).find("li.posx").text().trim()));
				titles.push($(this).find("li.title").text().trim());
			}
		});
		var LatLngLength = LatLng.length;
		
		// Draw line to map
		$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830&autoload=false', function () {
			daum.maps.load(function() {
				map.panTo(LatLng[LatLngLength - 1]);
			}); 
		});
		
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
				title: titles[idx],
				image : markerImage
			});
			markers.push(marker);
		}
		
		return false;
	});
});
</script>

<c:set var="basicDTO" value="${sessionScope.TripBasicDTO}"/>
<c:set var="detailDTO" value="${basicDTO.detailList}"/>

<div style="margin: 2rem auto;" align="center">
	<div class="container">
		<div class="row">
			<!-- Load Map dynamically -->
			<div class="col-sm-2">
			</div>
			
			<div class="col-sm-7">
				<div id="map" style="width: 100%; height: 100%; min-height: 35rem;"></div>
				<script>
					
				</script>
			</div>
			
			<div class="col-sm-2">
				<ul class="list-group">
					<c:set var="olddays" value="-1"/>
					<c:forEach var="tabledays" items="${detailDTO}">
						<c:if test="${olddays != tabledays.trip_day}">
							<c:set var="olddays" value="${tabledays.trip_day}"/>
							<li class="list-group-item">DAY${tabledays.trip_day}</li>
						</c:if>
					</c:forEach>
				</ul>
				<ul style="display: none;">
					<c:set var="olddays" value="-1"/>
					<c:forEach var="tabledays" items="${detailDTO}">
						<c:if test="${olddays != tabledays.trip_day}">
							<c:set var="olddays" value="${tabledays.trip_day}"/>
							<div class="xylist" id="DAY${olddays}">
								<c:forEach var="places" items="${detailDTO}">
									<c:if test="${olddays == places.trip_day}">
										<ul>
											<li class="posy">${places.posY}</li>
											<li class="posx">${places.posX}</li>
											<li class="title">${places.place_name}</li>
										</ul>
									</c:if>
								</c:forEach>
							</div>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>