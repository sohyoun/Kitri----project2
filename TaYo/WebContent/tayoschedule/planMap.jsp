<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="margin: 2rem auto;" align="center">
	<div class="row">
		<!-- Load Map dynamically -->
		<div class="col-sm-8" style="margin-left : 12rem">
			<div id="map" style="width: 100%; height: 100%; min-height: 850px"></div>
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
		</div>
		
		<div class="col-sm-1">
			<ul class="list-group">
				<li class="list-group-item">DAY1</li>
				<li class="list-group-item">DAY2</li>
				<li class="list-group-item">DAY3</li>
				<li class="list-group-item">DAY4</li>
				<li class="list-group-item">DAY5</li>
			</ul>
		</div>
	</div>
</div>