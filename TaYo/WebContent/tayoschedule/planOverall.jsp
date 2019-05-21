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
		width: 2rem;
		height: 2rem;
		background-color: navy;
		color: white;
		border-radius: 50%;
		text-align: center;
		line-height: 2rem;
		/* margin-left: 1rem; */
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
		background-color: #007bff;
		color: white;
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

		<div class="col-sm-7" style="overflow-y: auto; height: 100rem;">
				<div class="daytitle">
      				<div class="daynum" id="day1">DAY1</div>
      				<div class="daytitlecontent"><div class="daydate">2015.08.09 (일)</div><div class="daycplace">부산</div></div>
      			</div>
      			<div class="daydetail">
      				<div class="daydetailnum"><span class="circle">1</span></div>
      				<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
      				<div class="daydetailcontent">서울역 모임<span class="badge">버스역</span></div>
      				<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
      				<div class="daydetailsub">[소요시간] 장안동에서 인천국제공항 공항철도까지 2시간 소요 -12:05 공항리무진</div>
      				<div class="daydetailsub">[도착 예정시간] 14:00</div>
      				<div class="daydetailsub">[예상비용]  15,000원</div>
					<div class="daydetailsub">[체크리스트] </div>
      			</div>
      			<div><li class="btn-path"><button class="btn-to-path">경로 탐색</button></li></div>
      			<div class="daydetail">
      				<div class="daydetailnum"><span class="circle">2</span></div>
      				<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
      				<div class="daydetailcontent">부산역 도착<span class="badge">버스역</span></div>
      				<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
      				<div class="daydetailsub">[소요시간] 장안동에서 인천국제공항 공항철도까지 2시간 소요 -12:05 공항리무진</div>
      				<div class="daydetailsub">[도착 예정시간] 14:00</div>
      				<div class="daydetailsub">[예상비용] 점심 15,000원</div>
					<div class="daydetailsub">[체크리스트] </div>
      			</div>
      			<div>추천경로</div>
      			<div class="daytitle">
      				<div class="daynum" id="day2">DAY2</div>
      				<div class="daytitlecontent"><div class="daydate">2015.08.10 (월)</div><div class="daycplace">부산</div></div>
      			</div>
      			<div class="daydetail">
      				<div class="daydetailnum"><span class="circle">1</span></div>
      				<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
      				<div class="daydetailcontent">해운대<span class="badge">관광지</span></div>
      				<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
      				<div class="daydetailsub">[소요시간] 장안동에서 인천국제공항 공항철도까지 2시간 소요 -12:05 공항리무진</div>
      				<div class="daydetailsub">[도착 예정시간] 14:00</div>
      				<div class="daydetailsub">[예상비용] 점심 15,000원</div>
					<div class="daydetailsub">[체크리스트] </div>
      			</div>
      			<div>추천경로</div>
      			<div class="daydetail">
      				<div class="daydetailnum"><span class="circle">2</span></div>
      				<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
      				<div class="daydetailcontent">해운대카페거리<span class="badge">관광지</span></div>
      				<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
      				<div class="daydetailsub">[소요시간] 장안동에서 인천국제공항 공항철도까지 2시간 소요 -12:05 공항리무진</div>
      				<div class="daydetailsub">[도착 예정시간] 14:00</div>
      				<div class="daydetailsub">[예상비용] 점심 15,000원</div>
					<div class="daydetailsub">[체크리스트] </div>
      			</div>
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