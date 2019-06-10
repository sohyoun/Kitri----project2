<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	<h3 class="heading text-capitalize text-center">베스트 여행일정</h3>
	<div class="row">
	
		
		<c:forEach var="tripBasicDto" items="${requestScope.pagebean.list}" varStatus="status">
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
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
			</c:forEach><!-- end foreach-->
<%-- 		</c:forEach>  --%>
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


currentPage : ${requestScope.pagebean.currentPage}	
startRow :${requestScope.pagebean.startRow}
endRow :${requestScope.pagebean.endRow}
totalPage :${requestScope.pagebean.totalPage}
jsonStr :${requestScope.jsonStr}

	<%-- private int cntPerPage = 10; // 페이지별 보여줄 목록수
	private int startRow = 1; // 시작행
	private int endRow = 1; // 끝행
	private List<T> list; // 목록
	private int totalPage = 1; // 총페이지수
	private int totalCnt; // 총게시글 수
	private int cntPerPageGroup = 3; // 페이지그룹에 보여줄 페이지수
	private int startPage;// 페이지 그룹의 시작페이지
	private int endPage;// 페이지 그룹의 끝페이지
	private int currentPage;// 현재 페이지
	private String url = "";// 페이지링크 클릭시 요청할 url --%>

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