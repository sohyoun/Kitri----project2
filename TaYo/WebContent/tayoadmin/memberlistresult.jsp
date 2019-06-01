<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
</script>

<div id = "boardlist" class="row"><!-- 유저 테이블 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<form action="">
			<input type="search" name="emailsearch" placeholder="Email Search" class="form-control" />
			<input type="text" placeholder="Name Search" class="form-control" />
			<button id = "search" class="btn btn-info">검색</button>
			<ul class="list-group">
				<li class="list-group-item"><span class="badge">14</span> 가입 회원
					수</li>
				<li class="list-group-item"><span class="badge">2</span> 탈퇴 회원
					수</li>
				<li class="list-group-item"><span class="badge">1</span> 블랙 회원
					수</li>
			</ul>
		</form>

<div class="table-responsive">
	<table id="memberlist" class="table">
		<thead>
			<tr>
				<th>글번호</th>
				<th>원글</th>
				<th>이메일</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>가입일</th>
				<th>탈퇴일</th>
				<th>성별</th>
				<th>등급</th>
			</tr>
		</thead>
<c:set var="list" value="${requestScope.memberlist}" />
	<c:forEach var="m" items="${list}">
		<tbody>
			<tr>
				<td id="board_seq">${m.board_seq}</td>
				<td>${m.parent_seq}</td>
				<td>${m.email}</td>
				<td>${m.name}</td>
				<td>${m.age}</td>
				<td>${m.address }</td>
				<td>${m.addressDetail}</td>
				<td>${m.joindate}</td>
				<td>${m.outdate}</td>
				<td>${m.gender }</td>
				<td>${m.grade }</td>
			</tr>
		</tbody>
	</c:forEach>
	</table>
			<div class="col-lg-1"></div>
		</div>
	</div>
</div><!-- 유저 테이블 끗 -->
