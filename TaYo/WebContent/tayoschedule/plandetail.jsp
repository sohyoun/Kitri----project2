<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/temp/header.jsp" %>
<script>
	$(function(){
		var aArr = $(".pdmenu>ul>li>a");
		
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
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
	<div class="twplandetail">
		<div class="pdheader">
		<div class="pdheaderdetail">
		<div class="pdheaderdetailcontent">
			<div class="pname">다 함께 부산 먹방여행!!</div>
			<div class="pcontent">" 신나게 떠나봅시다 "</div>
			<div class="ptime">2019.05.17~2019.05.20 (3)</div>
			<div class="twppeople">정원 : 25/30</div>
			<div class="pleader"><span class="fa fa-user-circle"> Kkiruk</div>
		</div>
		</div>
		</div>
		<div class="pdmenu">
		<ul class="nav nav-tabs" role="tablist">
   			<li class="nav-item">
     			<a class="nav-link active" data-toggle="tab" href="<%=root%>/schedule?act=overall">개요</a>
    		</li>
    		<li class="nav-item">
     			<a class="nav-link" data-toggle="tab" href="<%=root%>/schedule?act=planTable">일정표</a>
    		</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="<%=root%>/schedule?act=planMap">지도</a>
   			</li>
   		</ul>
		</div>
	</div>
	</div>
</section>

<div id="content"></div>


<%@ include file="/temp/footer.jsp" %>