<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="list" value="${requestScope.filteredList}" />
<c:forEach var="filter" items="${list}">
	
</c:forEach>

<!-- 여행일정 -->
<div class="container py-lg-4 py-sm-3">
	<h3 class="heading text-capitalize text-center">
	베스트 여행일정
	</h3>
	<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
		<div class="image-tour position-relative">
			<img src="/TaYo/images/p4.jpg" alt="" class="img-fluid">
			<p>
				<span>56 <span class="fa fa-thumbs-up"> | 3726 <span class="fa fa-eye"></span>
			</span></span></p>
		</div>
		<div class="package-info">
			<h6 class="mt-1">
				<span class="fa fa-map-marker mr-2"></span>제천
			</h6>
			<h5 class="my-2">생애 첫 패러글라이딩</h5>
			<p class="">나홀로여행</p>
			<ul class="listing mt-3">
				<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.19
						(1)</span></li>
			</ul>
			<h6 class="mt-1">
				<span class="fa fa-user-circle"> lovetayo 
			</span></h6>
		</div>
	</div>
</div>


    