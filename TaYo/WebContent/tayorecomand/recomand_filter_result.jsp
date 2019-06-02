<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 여행일정 -->


<div class="container mt-3">
	<h3 class="heading text-capitalize text-center">베스트 여행일정</h3>
	<div class="row">

		<c:set var="index" value="1" />
		<c:forEach var="tripBasicDto" items="${requestScope.filteredList}">
			<c:forEach var="tripDetailDto" items="${tripBasicDto.detailList}" varStatus="status">
				
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
				<div class="image-tour position-relative" >
					<img src="/TaYo/images/p4.jpg" alt="" class="img-fluid">
					<p>
						<span>${tripBasicDto.likeCount} <span class="fa fa-thumbs-up"> | ${tripBasicDto.viewCount} <span class="fa fa-eye"></span>
					</span></span></p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>${tripDetailDto.place_name}
					</h6>
					<h5 class="my-2">${tripBasicDto.tripTitle}</h5>
					<p class="">${tripBasicDto.tripTheme}</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>${tripBasicDto.startDate} ~ ${tripBasicDto.endDate}</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> ${tripBasicDto.email}
					</span></h6>
				</div>
			</div>
				
				
			</c:forEach>
		</c:forEach><!-- end foreach--> 

	</div>
</div>

<%--개수는 1부터 시작  개수: ${(status.count-1)%4}--%>
				<%-- 				<c:choose> --%>
				<%-- 					<c:when test="${(status.count-1)%4<=2 }"><!--0,1/  4,5--> --%>

				<%-- 					</c:when> --%>
				<%-- 					<c:otherwise><!--2,3/ 6,7  --> --%>
				<!-- 						<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5"> -->
				<%-- 					</c:otherwise> --%>
				<%-- 				</c:choose> --%>

<%-- 	여행아이디: ${tripBasicDto.tripSeq}<br>
	이메일: ${tripBasicDto.email}<br>
	여행이름: ${tripBasicDto.tripTitle}<br>
	여행테마: ${tripBasicDto.tripTheme}<br>
	여행시즌: ${tripBasicDto.tripSeason}<br>
	시작일: ${tripBasicDto.startDate}<br>
	종료일: ${tripBasicDto.endDate}<br>
	조회수: ${tripBasicDto.viewCount}<br>
	추천수: ${tripBasicDto.likeCount}<br>
	최종수정일: ${tripBasicDto.lastUpDate}<br>
	완료여부: ${tripBasicDto.isComplete}<br> --%>

<%-- 순서: ${tripDetailDto.trip_order}<br>
			일자: ${tripDetailDto.trip_day}<br>
			여행id: ${tripDetailDto.trip_seq}<br>
			장소이름: ${tripDetailDto.place_name}<br>
			장소코드: ${tripDetailDto.loc_id}<br>
			이미지: ${tripDetailDto.image}<br>
			상세제목: ${tripDetailDto.detail_title}<br>
			완료여부: ${tripDetailDto.detail_content}<br>
			완료여부: ${tripDetailDto.posX}<br>
			완료여부: ${tripDetailDto.posY}<br> --%>