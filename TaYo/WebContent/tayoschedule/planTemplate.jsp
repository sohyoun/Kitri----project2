<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>
<script>
$(function() {
	// Search complete tour plan by default 
	$.ajax({
		url: '${pageContext.request.contextPath}/schedule',
		data: 'act=searchPlan' + '&type=Y' + '&email=' + 'test@kitri.re.kr',
		method: 'post',
		success: function(result) {
			$("div.row").html(result);
		},
		error: function(error) {
			alert(error);
		}
	});
	
	// Show temp/complete tour plan
	$("div.row").on('click', "div[name='scheduleinfo']", function() {
		alert("sdfsfs");
		//location.href="/TaYo/tayoschedule/plandetail.jsp";
	});
	
	// Search temp/complete tour plan
	$("input[class='btn']").click(function() {
		var type = "";
		if ($(this).attr("value") == '완성된 일정') {
			type = 'Y';
		} else if ($(this).attr("value") == '계획중인 일정') {
			type = 'N';
		}
		
		$.ajax({
			url: '${pageContext.request.contextPath}/schedule',
			data: 'act=searchPlan' + '&type=' + type + '&email=' + 'test@kitri.re.kr',
			method: 'post',
			success: function(result) {
				$("div.row").html(result);
			},
			error: function(error) {
				
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
			</div>
		</div>
	</div>
</section>


<!-- my page nav -->
<div class="container py-lg-4 py-sm-3"><input type="button" class="btn" value="완성된 일정"> | <input type="button" class="btn" value="계획중인 일정"></div>

<!-- tour packages -->
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<div class="row">
<!-- 			<div class="col-lg-3 col-sm-6" name="scheduleinfo" style="cursor:pointer"> -->
<!-- 				<div class="image-tour position-relative"> -->
<!-- 					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" /> -->
<!-- 					<p><span>100 </span><span class="fa fa-thumbs-up"> | 12230 </span><span class="fa fa-eye"></p> -->
<!-- 				</div> -->
<!-- 				<div class="package-info"> -->
<!-- 					<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span>부산</h6> -->
<!-- 					<h5 class="my-2">모녀 부산여행</h5> -->
<!-- 					<p class="">가족여행</p> -->
<!-- 					<ul class="listing mt-3"> -->
<!-- 						<li><span class="fa fa-clock-o mr-2"></span><span>2019.05.01~2019.05.03 (3)</span></li> -->
<!-- 					</ul> -->
<!-- 					<h6 class="mt-1"><span class="fa fa-user-circle"> kkiruk</h6> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
</section>
<!-- tour packages -->

<%@ include file="/temp/footer.jsp" %>