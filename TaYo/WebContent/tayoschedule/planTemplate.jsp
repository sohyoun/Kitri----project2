<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>

<script>
	$(function(){
		var aArr = $("div[id=buttons]>a");
		
		$(aArr).click(function(){
			var vUrl = $(this).attr("href");
			$.ajax({
				url: vUrl,
				method: 'post',
				success: function (result) {
							$("#content").html(result);
						 }
			});
			return false;
		});
	});
</script>

<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
		<div class="container">
			<div class="w3layouts-banner-info" style="padding-top: 8rem;">
			<h3 class="text-wh">'~~~님이 계획한 일정입니다.'</h3>
<!-- 				<div class="buttons mt-4"> -->
<!-- 					<a class="btn btn-info mr-4">개요</a> -->
<!-- 					<a class="btn btn-info mr-4">일정표</a> -->
<!-- 					<a class="btn btn-info">지도</a> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</section>

<div style="margin-left: 25rem;">
	<div id="buttons" class="buttons">
		<a class="btn btn-success mr-4" href="<%=root%>/schedule?act=overall">개요</a>
		<a class="btn btn-success mr-4">일정표</a>
		<a class="btn btn-success">지도</a>
	</div>
</div>

<div id="content"></div>

<%@ include file="/temp/footer.jsp" %>