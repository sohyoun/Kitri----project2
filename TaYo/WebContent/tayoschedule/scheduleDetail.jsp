<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>

<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#planSave").click(function() {
		$("#planSaveModal").modal();
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
	<div class="row">
		<div id="daylist" class="col-sm-2">
			<div>
				<ul>
					<li><div style="color: blue; margin-bottom: 0.5rem">1일차</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem;">명동</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">인사동</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">N 남산 타워</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">이태원</div></li>
				</ul>
			</div>
			<div>
				<ul>
					<li><div style="color: blue; margin-bottom: 0.5rem">2일차</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">호수공원</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">종로</div></li>
				</ul>
			</div>
			<div>
				<ul>
					<li><div style="color: blue; margin-bottom: 0.5rem">3일차</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">광장시장</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">청계천</div></li>
					<li><div style="color: black; margin-bottom: 0.5rem">관악산</div></li>
				</ul>
			</div>
			<div>
				<button class="btn mr-4 warning">+</button>
				<button class="btn warning">-</button>
			</div>
		</div>
		
		<div class="col-sm-3">
			<div>
				<div>
					<table class="table table-bordered table-sm" style="align: center;">
						<tbody align="center">
							<tr>
								<td width="100">
									<span>
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
									</span>
								</td>
								<td><input type="text" class="form-control" id="place" name="place" value="" placeholder=""></input></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<table id="placelist" class="table table-bordered table-sm" style="align: center;">
						<tbody id="tablebody" align="center">
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>명동</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>인사동</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>N 남산 타워</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>이태원</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>호수공원</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>종로</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>광장시장</td>
							</tr>
							<tr>
								<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
								<td>청계천</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="col-sm-7">
			<div id="map" style="width: 100%; height: 100%; min-height: 850px"></div>
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

<%@ include file="/tayoschedule/planSave.jsp" %>

<!-- //banner -->
<%@ include file="/temp/footer.jsp" %>