<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="list" value="${requestScope.list}"/>

<c:forEach var="td" items="list">
<div class="daydetail">
	<div class="daydetailnum"><span class="circle">${td.trip_order}</span></div>
	<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
	<div class="daydetailcontent">${td.detail_title}<span class="badge">${td.place_name}</span></div>
	<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
	<div class="daydetailsub">${td.detail_content}</div>
</div>
<div><li class="btn-path"><button class="btn btn btn-light">경로 탐색</button></li></div>

</c:forEach>