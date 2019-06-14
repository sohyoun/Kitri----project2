<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function() {
	// Search complete tour plan by default 
	$.ajax({
		url: '${pageContext.request.contextPath}/schedule',
		data: 'act=searchPlan' + '&type=Y' + '&email=' + '${sessionScope.loginInfo}',
		method: 'post',
		success: function(result) {
			$("div[id='reviewplans']").html(result);
		},
		error: function(error) {
			alert(error);
		}
	});
	
	// Show temp/complete tour plan
	$("div.row").on('click', "div[name='scheduleinfo']", function() {
		location.href= "${pageContext.request.contextPath}/schedule?act=showDetail" + '&email=' + $(this).find("span[class='fa fa-user-circle']").text().trim() + '&title=' + $(this).find("h5[class='my-2']").text().trim();
		return false;
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
			data: 'act=searchPlan' + '&type=' + type + '&email=' + '${sessionScope.loginInfo}',
			method: 'post',
			success: function(result) {
				$("div[id='reviewplans']").html(result);
			},
			error: function(error) {
				alert(error);
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
			<h3 class="text-wh">'현재 계획중이거나 계획한 일정입니다.'</h3>
			</div>
		</div>
	</div>
</section>


<!-- my page nav -->
<div class="container py-lg-4 py-sm-3"><input type="button" class="btn" value="완성된 일정"> | <input type="button" class="btn" value="계획중인 일정"></div>

<!-- tour packages -->
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
		<div class="row" id="reviewplans"></div>
	</div>
</section>
<!-- tour packages -->

<%@ include file="/temp/footer.jsp" %>