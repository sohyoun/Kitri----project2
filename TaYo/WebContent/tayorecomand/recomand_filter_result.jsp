<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- http://localhost/TaYo/schedule?act=showDetail&email=hth0893@naver.com&title=%E3%85%81%E3%84%B4%E3%85%87%E3%84%B923

http://localhost/TaYo/schedule?act=showDetail&email=title&title=email1@day_length -->
<script>
$(document).on('click', ".row .content", function() {
	var title= $(this).find('div.package-info > h5[datatype=title]').text().trim();
	var email= $(this).find('div.package-info > h6 > span[datatype=email]').text().trim();
	
 	location.href= "${pageContext.request.contextPath}/schedule?act=showDetail" + 
			'&email=' + email+'&title=' + title;
	return false;
});
</script>

<c:set var="bean" value="${requestScope.pagebean }"/>

<c:forEach var="cityMap" items="${requestScope.cityMap}" varStatus="num">
	<c:if test="${cityMap.key} eq ${loc_id}">
		${cityMap.value} 
	</c:if>
</c:forEach>

<%-- 맵 값 가져오기 방법 모르겠음 <c:out value="${requestScope.cityMap['1']}"></c:out> --%>


<c:forEach var="loc_id" items="${tripBasicDto.loc_set}">
	<c:forEach var="cityMap" items="${requestScope.cityMap}" varStatus="num">
		<c:if test="${cityMap.key == loc_id}">
			${cityMap.value} 
		</c:if>
	</c:forEach>
</c:forEach>





<!-- 여행일정 -->
<div class="container mt-3">
	<h3 class="heading text-capitalize text-center"> 여행일정</h3>
	<br/>
	<div class="row">

		<c:forEach var="tripBasicDto" items="${requestScope.pagebean.list}" varStatus="status" begin="${requestScope.pagebean.startRow-1 }" end="${requestScope.pagebean.endRow-1}">
		
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5" >
				<div class = "content" style="cursor:pointer">
					<div class="image-tour position-relative" >
						<img src="/TaYo/images/p4.jpg" alt="" class="img-fluid">
						<p>
							<span>${tripBasicDto.likeCount} <span class="fa fa-thumbs-up"> | ${tripBasicDto.viewCount} <span class="fa fa-eye"></span>
						</span></span></p>
					</div>
					<div class="package-info">
						<h6 class="mt-1">						
				 			<c:forEach var="loc_id" items="${tripBasicDto.loc_set}" >
				 				<c:forEach var="cityMap" items="${requestScope.cityMap}" varStatus="num">
									<c:if test="${cityMap.key==loc_id}">
										${cityMap.value} 
									</c:if>
							 	</c:forEach> 	 
				 			 </c:forEach>
						</h6>
						<h5 class="my-2" datatype= "title">${tripBasicDto.tripTitle}</h5>
						<p class="">${tripBasicDto.tripTheme}</p>
						<ul class="listing mt-3">
							<li><span class="fa fa-clock-o mr-2"></span><span>${tripBasicDto.startDate} ~ ${tripBasicDto.endDate}</span></li>
						</ul>
						<h6 class="mt-1">
							<span class="fa fa-user-circle" datatype= "email"> ${tripBasicDto.email}</span></h6>
					</div>
				</div>
			
			</div>
			</c:forEach>
	</div>
</div>


	<c:set var="index" value="1" />
<div class="mokcha" style="text-align: center">
<!-- 	기호는 유니코드로 변경하자  -->
	<c:if test="${(bean.startPage) != 1}">
		<a href="${bean.startPage-1}">◀</a>
	</c:if>
<!-- 	todo jsonData 필터 값 유지 시켜야한다. -->
	<c:forEach var="index" begin="${bean.startPage}" end="${bean.endPage}" step="1" >
		<a href="${index}">${index}</a>
	</c:forEach>
	<c:if test="${(bean.endPage) !=bean.totalPage}">
		<a href="${bean.endPage+1}">▶</a>
	</c:if>
</div>
<%-- currentPage : ${requestScope.pagebean.currentPage}	
startRow :${requestScope.pagebean.startRow}
endRow :${requestScope.pagebean.endRow}
totalPage :${requestScope.pagebean.totalPage}
jsonStr :${requestScope.jsonStr} --%>