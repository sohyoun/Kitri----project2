<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.kitri.dto.TripBasicDTO"%>
<%@ page import="com.kitri.dto.TripDetailDTO"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="list" value="${requestScope.TripBasicDTO}"/>
<c:forEach var="basicDTO" items="${list}">
	<div class="col-lg-3 col-sm-6" name="scheduleinfo" style="cursor:pointer">
		<div class="image-tour position-relative">
			<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
			<p><span>${basicDTO.likeCount} </span><span class="fa fa-thumbs-up"> | ${basicDTO.viewCount} </span><span class="fa fa-eye"></p>
		</div>
		<div class="package-info">
			<h6 class="mt-1"><span class="fa fa-map-marker mr-2"></span> <c:forEach var="detailDTO" items="${basicDTO.detailList}"> ${detailDTO.loc_id} </c:forEach> </h6>
			<h5 class="my-2">${basicDTO.tripTitle}</h5>
			<p class="">${basicDTO.tripTheme} (${basicDTO.tripNum})</p>
			<ul class="listing mt-3">
				<li><span class="fa fa-clock-o mr-2"></span><span>${basicDTO.startDate}~${basicDTO.endDate} (기간)</span></li>
			</ul>
			<h6 class="mt-1"><span class="fa fa-user-circle">${basicDTO.email}</h6>
		</div>
	</div>
</c:forEach>