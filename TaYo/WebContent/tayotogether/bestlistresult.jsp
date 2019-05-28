<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="list" value="${requestScope.list}"/>
		<div class="row">
		<c:forEach var="tt" items="${list}">
		<c:set var="tb" value="${tt.tripBasicDTO}"/>
		<!-- ttLeaderDTO.tripBasicDTO.tripDetailDTO.placeDTO.locationDTO.setLocName(rs.getString("loc_name")); -->
		<c:set var="td" value="${tb.tripDetailDTO}"/>
		<c:set var="p" value="${td.placeDTO}"/>
		<c:set var="l" value="${p.locationDTO}"/>
			<div class="col-lg-3 col-sm-6" id="tayowithschedule001">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p>
						<span>${tb.likeCount} <span class="fa fa-thumbs-up"></span> | ${tb.viewCount} <span
							class="fa fa-eye"></span></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>${l.locName}
					</h6>
					<h5 class="my-2">${tb.tripTitle}</h5>
					<p class="">Á¤¿ø : ${tt.nowNum}/${tt.tripNum}</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>${tb.startDate}~${tb.endDate}
								(3)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> ${tb.email} </span>
					</h6>
				</div>
			</div>
		</c:forEach>
		</div>