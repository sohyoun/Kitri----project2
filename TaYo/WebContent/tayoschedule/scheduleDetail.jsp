<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>

<style>
	#daylist {
		overflow-x: hidden;
		overflow-y: scroll;
		height: 30rem;
	}
	
	#placelist {
		overflow-x: hidden;
		overflow-y: scroll;
		height: 26rem;
	}
	
	#location {
		text-align: center;
		width: 100%;
		height: 100%;
	}
</style>

<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#planSave").click(function() {
		$("#planSaveModal").modal();
	});
	
	$("#daylist").sortable({axis: "y", revert: true, revertDuration: 0});
 	$(".list-group").sortable({axis: "y", revert: true, revertDuration: 0});
	
	$(".placeclass").draggable({
		connectToSortable: $(".list-group"),
		helper: "clone",
		revert: "invalid"
	});
});
</script>

<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
				<h3 class="text-wh">'나만의 일정을 계획해보세요'</h3>
				<div class="buttons mt-4">
					<a class="btn pull-right" id="planSave">저장 / 완료</a>
				</div>
			</div>
		</div>
	</div>
</section>

<div style="margin: 2rem;" align="center">
	<div class="container">
		<div class="row">
			<div id="daylist" class="col-sm-2">
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">1일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">명동</li>
					<li class="list-group-item" style="padding: 0.3rem;">인사동</li>
					<li class="list-group-item" style="padding: 0.3rem;">N 남산 타워</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">2일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">호수공원</li>
					<li class="list-group-item" style="padding: 0.3rem;">종로</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">3일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
					<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
					<li class="list-group-item" style="padding: 0.3rem;">관악산</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">4일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
					<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
					<li class="list-group-item" style="padding: 0.3rem;">관악산</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">5일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
					<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
					<li class="list-group-item" style="padding: 0.3rem;">관악산</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">6일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
					<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
					<li class="list-group-item" style="padding: 0.3rem;">관악산</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">7일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
					<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
					<li class="list-group-item" style="padding: 0.3rem;">관악산</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item" style="background-color:steelblue; color: white; padding: 0.3rem;">8일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
					<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
					<li class="list-group-item" style="padding: 0.3rem;">관악산</li>
					<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
				</ul>
				
				<div>
					<br>
					<button type="button" class="btn mr-4 btn-outline-primary">+</button>
					<button type="button" class="btn btn-outline-primary">-</button>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div>
					<div>
						<table class="table table-sm" style="align: center;">
							<tbody align="center">
								<tr>
									<td width="100">
										<select id="location" size="1" name="location">
											<option value="서울" selected="selected">서울
											<option value="경기">경기
											<option value="강원">강원
											<option value="충북">충북
											<option value="충남">충남
											<option value="전북">전북
											<option value="전남">전남
											<option value="경북">경북
											<option value="경남">경남
											<option value="세종">세종
											<option value="부산">부산
											<option value="대구">대구
											<option value="인천">인천
											<option value="광주">광주
											<option value="대전">대전
											<option value="울산">울산
											<option value="제주">제주
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
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">명동</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">인사동</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">N 남산 타워</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">이태원</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">호수공원</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">종로</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">광장시장</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;">청계천</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6">
				<div id="map" style="width: 100%; height: 100%; min-width: 50%; min-height: 50%"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d388e7ffead01bfd5045bc218f8e8830"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(33.450701, 126.570667),
						level: 3
					};
			
					var map = new daum.maps.Map(container, options);
				</script>
			</div>
		</div>
	</div>
</div>

<%@ include file="/tayoschedule/planSave.jsp" %>

<!-- //banner -->
<%@ include file="/temp/footer.jsp" %>