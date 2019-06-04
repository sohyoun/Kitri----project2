<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Date"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix ="x" uri ="http://java.sun.com/jsp/jstl/xml"%>

<style>
	.nav-link {
		padding: 0.5rem;
	}
</style>

<c:set var="areaCodes" value="${sessionScope.areaCodes}"/>
<x:parse var="area" xml="${areaCodes}"/>

<c:set var="basicDTO" value="${sessionScope.TripBasicDTO}"/>
<c:set var="detailDTO" value="${basicDTO.detailList}"/>

<div class="container mb-4" data-spy="scroll" data-target="#dayinfo" data-offset="10">
	<div class="row">
		<div id="dayinfo" class="col-sm-1">
			<div class="btn-group-vertical">
				<span class="fa fa-chevron-up"/>
				<c:set var="olddays" value="-1"/>
				<c:forEach var="tabledays" items="${detailDTO}">
					<c:if test="${olddays != tabledays.trip_day}">
						<a class="nav-link" href="#day${tabledays.trip_day}">DAY${tabledays.trip_day}</a>
						<c:set var="olddays" value="${tabledays.trip_day}"/>
					</c:if>
				</c:forEach>
				<span class="fa fa-chevron-down"/>
			</div>
		</div>
			
		<div class="col-sm-11">
			<table class="table">
				<thead class="thead-navy">
					<tr>
						<th><span class="fa fa-calendar"/> 날짜</th>
						<th><span class="fa fa-building-o"/> 도시</th>
						<th><span class="fa fa-clock-o"/> 일정</th>
						<th><span class="fa fa-home"/> 숙소</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="olddays" value="-1"/>
					<c:forEach var="tabledays" items="${detailDTO}">
						<c:if test="${olddays != tabledays.trip_day}">
							<c:set var="olddays" value="${tabledays.trip_day}"/>
							<tr id="day${tabledays.trip_day}">
								<jsp:useBean id="myDate" class="java.util.Date"/>
								<fmt:parseDate var="startPlanDate" value="${basicDTO.startDate}" pattern="yyyy-MM-dd"/>
								<fmt:parseNumber value="${startPlanDate.time + (tabledays.trip_day - 1)*(1000*60*60*24)}" integerOnly="true" var="startDate"></fmt:parseNumber>
								<c:set target="${myDate}" property="time" value="${startDate}"/>
								<fmt:formatDate var="convertday" value="${myDate}" pattern="yyyy-MM-dd (E)"/>

								<td class="plancal">${convertday}<br><span>DAY${tabledays.trip_day}</span></td>
								<x:forEach var="areaCode" select="$area/response/body/items/item">
									<x:set var="codeValue" select="$areaCode/code"/>
									<x:set var="locName" select="$areaCode/name"/>
									<c:set var="loc" value="${tabledays.loc_id}"/>
									<x:if select="$codeValue = $loc">
										<td class="planplace"><x:out select="$locName"/></td>
									</x:if>
								</x:forEach>
								<td>
									<c:set var="index" value="1"/>
									<c:forEach var="places" items="${detailDTO}">
										<c:if test="${olddays == places.trip_day}">
											${index}. ${places.place_name}<br>
											<c:set var="index" value="${index + 1}"/>
										</c:if>
									</c:forEach>
								</td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>