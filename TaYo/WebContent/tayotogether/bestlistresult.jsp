<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="list" value="${requestScope.list}"/>
<script>
$(function(){
	$("div.col-lg-3.col-sm-6.twplan").click(function(){
		var tripseq = $(this).find("button.tripseq").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/togetherdetail",
			method:'post',
			data:$(this).serialize(),
			success : function(result){
				$("section.banner_inner").html(result.trim());
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
						<span>${tb.likeCount} <span class="fa fa-thumbs-up"></span> | ${tb.viewCount} <span
							class="fa fa-eye"></span></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>부산
					</h6>
					<h5 class="my-2">${tb.tripTitle}</h5>
					<p class="">정원 : ${tt.nowNum}/${tb.tripNum}</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>${tb.startDate}~${tb.endDate}
								(3)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> ${tb.email} </span>
						<button class="tripseq" value="${tt.tripSeq}" style="display:none;">${tt.tripSeq}</button>			
					</h6>
				</div>
			</div>
		</c:forEach>
</div>