<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- 유저 테이블  -->
		<div class="table-responsive">
			<table id = "memberlist" class="table">
				<thead>
					<tr>
						<th>Index</th>
						<th>Email</th>
						<th>name</th>
						<th>Address</th>
						<th>Address_detail</th>
						<th>Gender</th>
						<th>Grade</th>
					</tr>
				</thead>
				<tbody>
	<c:set var = "list" value = "${requestScope.memberlist}"/>
		<c:forEach var = "m" items ="${list}">
					<tr>
						<td></td>
						<td>${m.email}</td>
						<td>${m.name}</td>
						<td>${m.address }</td>
						<td>${m.addressDetail}</td>
						<td>${m.gender }</td>
						<td>${m.grade }</td>
					</tr>
		</c:forEach> 
				</tbody>
			</table>
		</div>
	<div class="col-lg-1"></div>
