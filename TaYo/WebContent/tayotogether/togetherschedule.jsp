<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="list" value="${requestScope.list}"/>
<c:set var="tripSeq" value="${requestScope.tripSeq}"/>
<c:set var="dd" value="${requestScope.dd}"/>
<c:set var="daylist" value="${requestScope.daylist}"/>

<div class="container mb-4" data-spy="scroll" data-target="#dayinfo"
	data-offset="10">
		<div class="row">
			<div id="dayinfo" class="col-sm-1">
			<div class="btn-group-vertical">
				<span class="fa fa-chevron-up"/>
				<c:forEach begin="1" end="${dd}" var="i">
					<a class="nav-link" href="#day${i}">${i}일차</a>
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
						<c:forEach begin="1" end="${dd}" var="i">
						<tr>
							<td class="plancal">${daylist.get(i-1)}<br><span>DAY${i}</span></td>
							<td class="planplace">
								<c:forEach var="td" items="${list}">
      							<c:if test="${td.trip_day == i}">
      								${td.loc_id},서울
      							</c:if>
      							</c:forEach>
							</td>
							<td>
								<c:forEach var="td" items="${list}">
      							<c:if test="${td.trip_day == i}">
      								${td.place_name}<br>
      							</c:if>
      							</c:forEach>
							</td>
							<td></td>
							<td></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
</div>