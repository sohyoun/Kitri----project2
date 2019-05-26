<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>

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

<script type="text/javascript" src="<%=root%>/js/httpRequest.js"></script>
<script type="text/javascript">
$(function() {
	$("#planSave").click(function() {
		$("#planSaveModal").modal();
	});
	
	// Sorting dayplan
	function sortlist() {
		var lists = $(".list-group");
		var length = lists.length;
		
		for (var i = 0; i < length; i++) {
			$(lists[i]).find(".list-group-item-1").text((i+1) + '일차');
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
		var obj = $("<ul class='list-group ui-sortable-handle'><li class='list-group-item-1' style='background-color:steelblue; color: white; padding: 0.3rem;'>" + (length + 1) + "일차</li></ul>");
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
			var obj = $("<ul class='list-group ui-sortable-handle'><li class='list-group-item-1' style='background-color:steelblue; color: white; padding: 0.3rem;'>1일차</li></ul>");
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
	var place = "";
	$("#tablebody").on('click', "tr>td>ul>li>button[name='placebtn']", function(){
		$("#daylist>ul>li.list-group-item-1").append("<button class='btn btn-sm btn-success' name='addplacebtn'>+</button>");
		place = $(this).parent().attr("value");
		$("#tablebody>tr>td>ul>li>button[name='placebtn']").remove();
		return false;
	});
	
	$("#daylist").on('click', "ul>li>button[name='planbtn']", function(){
		$(this).parent().remove();
		return false;
	});
	
	$("#daylist").on('click', "ul>li.list-group-item-1>button[name='addplacebtn']", function() {
		$(this).parent().parent().append("<li class='list-group-item ui-sortable-handle' style='padding: 0.3rem;' value='" + place + "'>" + place + "<button class='btn btn-sm btn-secondary' name='planbtn'>-</button></li>");
		$("[name='addplacebtn']").remove();
		$(".placeclass>li.list-group-item").append("<button class='btn btn-sm btn-primary' name='placebtn'>+</button>");
		return false;
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
				<div id="controlday">
					<button type="button" class="btn mr-4 btn-outline-primary">+</button>
					<button type="button" class="btn btn-outline-primary">-</button>
					<pre><br></pre>
				</div>
				
				<ul class="list-group">
					<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">1일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">명동<button class="btn btn-sm btn-secondary" name="planbtn">-</button></li>
					<li class="list-group-item" style="padding: 0.3rem;">인사동<button class="btn btn-sm btn-secondary" name="planbtn">-</button></li>
				</ul>
				<ul class="list-group">
					<li class="list-group-item-1" style="background-color:steelblue; color: white; padding: 0.3rem;">2일차</li>
					<li class="list-group-item" style="padding: 0.3rem;">호수공원<button class="btn btn-sm btn-secondary" name="planbtn">-</button></li>
					<li class="list-group-item" style="padding: 0.3rem;">종로<button class="btn btn-sm btn-secondary" name="planbtn">-</button></li>
				</ul>
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
											<li class="list-group-item" style="padding: 0.3rem;" value="명동">명동<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="인사동">인사동<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="N 남산 타워">N 남산 타워<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="이태원">이태원<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="호수공원">호수공원<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="종로">종로<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="광장시장">광장시장<button class="btn btn-primary" name="placebtn">+</button></li>
										</ul>
									</td>
								</tr>
								<tr>
									<td width="100"><img alt="Sample image" src="<%=root%>/images/bus.png" width="80" height="40"></td>
									<td>
										<ul class="placeclass">
											<li class="list-group-item" style="padding: 0.3rem;" value="청계천">청계천<button class="btn btn-primary" name="placebtn">+</button></li>
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