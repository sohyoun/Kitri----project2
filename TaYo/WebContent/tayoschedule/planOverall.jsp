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
	
	// 지도 위치 표현하기 2019-06-11
	$(document).on("click","div.daydetailfa > span.fa.fa-info-circle",function() {
		console.log('정보표현하기');
	});
	
	$(document).on("click","div.daydetailfa > span.fa.fa-map-marker",function() {
		console.log('지도표현하기');
		
		var posx =$(this).attr('posx').trim();
		var posy =$(this).attr('posy').trim();
		console.log(posx);
		console.log(posy);
		var moveLatLon = new daum.maps.LatLng(posy, posx);
		
		
		//지도 부드럽게 이동시킵니다.
		map.panTo(moveLatLon);
		//지도이동시킵니다.
		//map.setCenter(moveLatLon);
	});


	
	
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
	
	var pathBtn = $("button[class='btn btn btn-light']");
	var pathBtnlen = $(pathBtn).length;
	for(var i = 0; i < (pathBtnlen - 1); i++) {
		var prev = $(pathBtn[i]).parent().parent().prev("div[class='daydetail']").find("span[class='circle']").attr("day");
		var next = $(pathBtn[i + 1]).parent().parent().next("div[class='daydetail']").find("span[class='circle']").attr("day");
		
		if (prev != next) {
			$(pathBtn[i + 1]).css("visibility", "hidden");
			i++;
		}
	}
	
	// show path (do not using modal window)
	$("button[class='btn btn btn-light']").click(function() {
		var prev_place = $(this).parent().parent().prev("div[class='daydetail']").find("div[class='daydetailcontent']");
		var next_place = $(this).parent().parent().next("div[class='daydetail']").find("div[class='daydetailcontent']");

		var prev_place_posx = $(prev_place).attr("posx");
		var prev_place_posy = $(prev_place).attr("posy");
		var next_place_posx = $(next_place).attr("posx");
		var next_place_posy = $(next_place).attr("posy");
		
		// Calculate BusLane
		/*var site = "https://api.odsay.com/v1/api/";
		var okey = "sIq59IU6tz/SecRuKDsmnGG0YOmNO2b8Xbv6HoKjAC0";
		
		var xhr = new XMLHttpRequest();
		var url = site+"searchPubTransPath?apiKey="+okey+"&lang=0&SX="+prev_place_posx+"&SY="+prev_place_posy+"&EX="+next_place_posx+"&EY="+next_place_posy+"&OPT=0&SearchType=0&SearchPathType=2";
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				var result = resultObj.result;
				var str = "";
				
				if (result != null) {
					str += "<div class='box'>";
					str += "<p>검색 결과 구분 : " + result.searchType + "</p>";
					str += "<p>직통 검색 결과 : " + ((result.outTrafficCheck == 0) ? "없음" : "있음") + "</p>";
					str += "<p>버스 결과 수 : " + result.busCount + "</p>";
					str += "<p>출발지 반경 : " + result.startRadius + "</p>";
					str += "<p>도착지 반경 : " + result.endRadius + "</p>";
					str += "<p>이동 거리 : " + result.pointDistance + "</p>";
					
					intermediatePath = Array(result.path.length);
					
					for (var i = 0; i < result.path.length; i++) {
						str += "<p>---------------" + (i + 1) + "번째 경로---------------</p>"
						str += "<p>" + (i + 1) + "번째 경로의 타입 : " + result.path[i].pathType + " (버스)</p>";
						str += "<p>" + (i + 1) + "번째 경로의 총 이동거리(도보 제외) : " + result.path[i].info.trafficDistance + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 총 도보 이동거리 : " + result.path[i].info.totalWalk + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 총 거리 : " + result.path[i].info.totalDistance + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 총 소요시간 : " + result.path[i].info.totalTime + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 총 요금 : " + result.path[i].info.payment + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 버스 환승 카운트 : " + result.path[i].info.busTransitCount + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 출발 정류장 : " + result.path[i].info.firstStartStation + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 도착 정류장 : " + result.path[i].info.lastEndStation + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 총 정류장 수 : " + result.path[i].info.totalStationCount + "</p>";
						str += "<p>" + (i + 1) + "번째 경로의 보정 값 : " + result.path[i].info.mapObj + "</p>";
						
						intermediatePath[i] = Array(result.path[i].subPath.length);
						interj = 0;
						
						for (var j = 0; j < result.path[i].subPath.length; j++) {
							str += "<p>+++++++++++++++세부 경로 : " + (j + 1) + "+++++++++++++++</p>"
							str += "<p>이동거리 : " + result.path[i].subPath[j].distance + "</p>";
							str += "<p>이동 소요시간 : " + result.path[i].subPath[j].sectionTime + "</p>";
							str += "<p>이동 수단 : " + result.path[i].subPath[j].trafficType + "</p>";
							
							if (result.path[i].subPath[j].trafficType == 2) {
								str += "<p>이동 정류장 수 : " + result.path[i].subPath[j].stationCount + "</p>";
								str += "<p>출발 정류장 ID : " + result.path[i].subPath[j].startID + "</p>";
								str += "<p>출발 정류장 이름 : " + result.path[i].subPath[j].startName + "</p>";
								str += "<p>출발 정류장 X 좌표 : " + result.path[i].subPath[j].startX + "</p>";
								str += "<p>출발 정류장 Y 좌표 : " + result.path[i].subPath[j].startY + "</p>";
								str += "<p>도착 정류장 ID : " + result.path[i].subPath[j].endID + "</p>";
								str += "<p>도착 정류장 이름 : " + result.path[i].subPath[j].endName + "</p>";
								str += "<p>도착 정류장 X 좌표 : " + result.path[i].subPath[j].endX + "</p>";
								str += "<p>도착 정류장 Y 좌표 : " + result.path[i].subPath[j].endY + "</p>";
								
								for (var k = 0; k < result.path[i].subPath[j].lane.length; k++) {
									str += "<p>===============버스 정보 : " + (k + 1) + "===============</p>";
									str += "<p>버스 ID : " + result.path[i].subPath[j].lane[k].busID + "</p>";
									str += "<p>버스 번호 : " + result.path[i].subPath[j].lane[k].busNo + "</p>";
									str += "<p>버스 타입 : " + result.path[i].subPath[j].lane[k].type + "</p>";
								}
								
								intermediatePath[i][interj] = Array(result.path[i].subPath[j].passStopList.stations.length);
								for (var k = 0; k < result.path[i].subPath[j].passStopList.stations.length; k++) {
									str += "<p>***************경로 상세 : " + (k + 1) + "***************</p>";
									str += "<p>순번 : " + (result.path[i].subPath[j].passStopList.stations[k].index + 1) + "</p>";
									str += "<p>정류장 ID : " + result.path[i].subPath[j].passStopList.stations[k].stationID + "</p>";
									str += "<p>정류장 이름 : " + result.path[i].subPath[j].passStopList.stations[k].stationName + "</p>";
									str += "<p>정류장 X 좌표 : " + result.path[i].subPath[j].passStopList.stations[k].x + "</p>";
									str += "<p>정류장 Y 좌표 : " + result.path[i].subPath[j].passStopList.stations[k].y + "</p>";
									intermediatePath[i][interj][k] = new daum.maps.LatLng(result.path[i].subPath[j].passStopList.stations[k].y, result.path[i].subPath[j].passStopList.stations[k].x);
								}
								
								interj++;
							}
						}
					}
				}
				
				// Show Daum Map
				$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830&autoload=false', function () {
					daum.maps.load(function() {
						map.panTo(new daum.maps.LatLng(next_place_posy, next_place_posx));
					}); 
				});
				
				var isFirst = true;
				var markers = new Array();
				
				if (isFirst != true) {
					var lenMarker = markers.length;
					for(var i = 0; i < lenMarker; i++) {
						markers[i].setMap(null);
					}
					markers = null;
					markers = new Array();
				} else {
					isFirst = false;
				}
				
				var markerImage = new daum.maps.MarkerImage("http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", new daum.maps.Size(24, 35));
				
				var marker = new daum.maps.Marker({
					map: map,
					position: new daum.maps.LatLng(prev_place_posy, prev_place_posx),
					image : markerImage
				});
				markers.push(marker);
				
				var marker2 = new daum.maps.Marker({
					map: map,
				    position: new daum.maps.LatLng(next_place_posy, next_place_posx),
				    image: markerImage
				});
				markers.push(marker);
				
				
				// Show Line : (syVal, sxVal) -> (start station y-axis, start station x-axis) -> (intermediate station y-axis, intermediate station x-axis)
				//             -> (destination station y-axis, destination station x-axis) -> (eyVal, exVal)
				
				var linePath = startPath.concat(intermediatePath[0][0]).concat(endPath);
				
				var polyline = new daum.maps.Polyline({
				    path: linePath,
				    strokeWeight: 5,
				    strokeColor: '#FFAE00',
				    strokeOpacity: 1,
				    strokeStyle: 'solid'
				});
				
				polyline.setMap(map);
				
				
				console.log(intermediatePath);
			}
		}
 */

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
								<div class="daydetailcontent" posx="${places.posX}" posy="${places.posY}">${places.place_name}<br><button class="btn btn-sm btn-link" name="pdinfo">제목&내용 수정</button></div>

								
								<div class="daydetailfa" > <span class="fa fa-map-marker" posx="${places.posX}" posy="${places.posY}" style="cursor:pointer;"></span>  <span class="fa fa-info-circle" style="cursor:pointer;"></span></div>
								

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