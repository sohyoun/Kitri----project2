<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="list" value="${requestScope.list}"/>
		<div class="row">
		<c:forEach var="e" items="${list}">
			<div class="col-lg-3 col-sm-6" id="tayowithschedule001">
				<div class="image-tour position-relative">
					<img src="/TaYo/images/p1.jpg" alt="" class="img-fluid" />
					<p>
						<span>${list.likeCount} <span class="fa fa-thumbs-up"></span> | ${list.viewCount} <span
							class="fa fa-eye"></span></span>
					</p>
				</div>
				<div class="package-info">
					<h6 class="mt-1">
						<span class="fa fa-map-marker mr-2"></span>부산
					</h6>
					<h5 class="my-2">다같이 부산여행</h5>
					<p class="">정원 : ${list.now_num}/${list.trip_num}</p>
					<ul class="listing mt-3">
						<li><span class="fa fa-clock-o mr-2"></span><span>2019.05.01~2019.05.03
								(3)</span></li>
					</ul>
					<h6 class="mt-1">
						<span class="fa fa-user-circle"> kkiruk 
					</h6>
				</div>
			</div>
		</c:forEach>
		</div>