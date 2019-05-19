<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		width: 3rem;
		height: 2.5rem;
		background-color: lightgreen;
		border-radius: 50%;
		text-align: center;
		line-height: 2.5rem;
		margin-left: 1rem;
		display: inline-block;
	}
	
	.nav-link {
		padding: 0;
	}
	
	.btn-path {
		margin: auto;
	}
	
	.btn-to-path {
		width: 10rem;
		height: 1.5rem;
		background-color: brown;
		color: white;
	}
	
	img {
		display: inline-block;
		margin-left: 1rem;
	}
</style>

<script>
$(function(){
	$("label[class='description']").click(function() {
		// to be implemented
	});
	
	$("button[class='btn-to-path']").click(function() {
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
});
</script>

<div class="container mb-4" data-spy="scroll" data-target="#dayinfo"
	data-offset="10">
	<div class="row">
		<div id="dayinfo" class="col-sm-1">
			<div class="btn-group-vertical">
				<a class="nav-link" href="#day1">1일차</a>
				<a class="nav-link" href="#day2">2일차</a>
				<a class="nav-link" href="#day3">3일차</a>
			</div>
		</div>

		<div class="col-sm-7" style="overflow-y: auto; height: 31rem;">
			<ul class="list-group">
				<li class="list-group-item" id="day1">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">1</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">2</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">3</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">4</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">5</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">6</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">7</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">8</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY1</label>
					<label class="labellocation">서울</label>
					<font>관광지1</font><br>
					<div class="circle">9</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item" id="day2">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">1</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">2</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">3</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">4</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">5</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">6</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">7</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY2</label>
					<label class="labellocation">부산</label>
					<font>관광지3</font><br>
					<div class="circle">8</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item" id="day3">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">1</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">2</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">3</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">4</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">5</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">6</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">7</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">8</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
				<li class="btn-path"><button class="btn-to-path">경로 탐색</button></li>
				<li class="list-group-item">
					<label class="labelday">DAY3</label>
					<label class="labellocation">대구</label>
					<font>관광지3</font><br>
					<div class="circle">9</div>
					<img alt="Sample image" src="/TaYo/images/bus.png" width="80" height="40">
					<label class="description">설명 입력</label>
				</li>
			</ul>
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