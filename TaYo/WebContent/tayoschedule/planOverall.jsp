<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="margin: 2rem;" align="center">

	<!-- Using ScrollSpy Vertical -->

	<div class="row">
		<div id="daylist" class="col-sm-1">
			<div>
				<button class="btn btn-info">1일차</button>
			</div>
			<div>
				<button class="btn btn-info">2일차</button>
			</div>
			<div>
				<button class="btn btn-info">3일차</button>
			</div>
		</div>
		
		<div class="col-sm-7">
			<ul class="list-group">
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY1</label>
						<label class="label label-primary">서울</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY1</label>
						<label class="label label-primary">서울</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY1</label>
						<label class="label label-primary">서울</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY2</label>
						<label class="label label-primary">부산</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY2</label>
						<label class="label label-primary">부산</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY3</label>
						<label class="label label-primary">대구</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY3</label>
						<label class="label label-primary">대구</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY3</label>
						<label class="label label-primary">대구</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="d-inline-flex p-2 text-black">
						<label class="label label-default">DAY3</label>
						<label class="label label-primary">대구</label>
					</div>
				</li>
			</ul>
		</div>
		
		<!-- Load Map dynamically -->
		<div class="col-sm-4">
			<div id="map" style="width: 100%; height: 100%; min-height: 25rem"></div>
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
	</div>	
</div>