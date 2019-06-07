<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="list" value="${requestScope.list}"/>
<script>
$(function(){
	$("div.col-lg-3.col-sm-6.twplan").click(function(){
		var tripSeq = $(this).find("button.tripseq").val();
		var triptitle = $(this).find("#tripTitle").text();
		var startDate = $(this).find("#startDate").text();
		var endDate = $(this).find("#endDate").text();
		var nowNum = $(this).find("#nowNum").text();
		var tripNum = $(this).find("#tripNum").text();
		var email = $(this).find("#email").text();
		var viewCount = $(this).find("#tripViewCount").text();
		console.log("${pageContext.request.contextPath}/togetherdetail");
		$.ajax({
			url : "${pageContext.request.contextPath}/togetherdetail",
			method:'get',
			data:{
					tripSeq : tripSeq,
					tripTitle : triptitle,
					startDate : startDate,
					endDate : endDate,
					nowNum : nowNum,
					tripNum : tripNum,
					email : email,
					viewCount : viewCount
			},
			success : function(result){
				$("div.tayowithbody").html(result.trim());
			}
		});
		return false;
	});
});
</script>

<div class="row bestcontentsdetail">
		<c:forEach var="tt" items="${list}">
		<c:set var="tb" value="${tt.tripBasicDTO}"/>
			<div class="col-lg-3 col-sm-6 twplan">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p>
						<span><span id="tripLikeCount">${tb.likeCount}</span> <span class="fa fa-thumbs-up"></span> | <span id="tripViewCount">${tb.viewCount}</span> <span
							class="fa fa-eye"></span></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>부산
					</h6>
					<h5 class="my-2" id="tripTitle">${tb.tripTitle}</h5>
					<p class="">정원 : <span id="nowNum">${tt.nowNum}</span>/<span id="tripNum">${tb.tripNum}</span></p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span id="startDate">${tb.startDate}</span> ~ <span id="endDate">${tb.endDate}</span>
								</li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle" id="email"> ${tb.email} </span>
						<button class="tripseq" value="${tt.tripSeq}" style="display:none;">${tt.tripSeq}</button>			
					</h6>
				</div>
			</div>
		</c:forEach>
</div>