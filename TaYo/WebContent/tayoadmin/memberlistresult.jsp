<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
</script>

<c:set var = "joincount" value = "${requestScope.joindateTotalCnt}"/>
<c:set var = "blacklist" value = "${requestScope.backTotalCnt}"></c:set>

<div class="row"><!-- 유저 테이블 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<form action="" method = "get" class = "form-inline my-2 my-lg-0">
		<select name ="" class = "form-control mx-1 mt-2">
			<option value = "전체">전체</option> 
			<option value = "이메일">이메일</option> 
			<option value = "이름">이름</option> 
			<option value = "성별">성별</option> 
		</select>
			<input type="text" name="search" placeholder="Email Search" class="form-control mr-sm-2" />
			<button id = "search" class="btn btn-info">검색</button>
			<ul class="list-group">
				<li class="list-group-item"><span class="badge">${joincount}</span> 가입 회원
					수</li>
				<li class="list-group-item"><span class="badge"></span> 탈퇴 회원
					수</li>
				<li class="list-group-item"><span class="badge">${blacklist}</span> 블랙 회원
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
					<td>${m.grade }<img style = "width:25px; height:25px;" src = "/TaYo/tayoadmin/images/0.png"><img style = "width:25px; height:25px;" src = "/TaYo/tayoadmin/images/1.png"><img style = "width:25px; height:25px;" src = "/TaYo/tayoadmin/images/2.png"><img style = "width:25px; height:25px;" src = "/TaYo/tayoadmin/images/3.png"></td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
			<div class="col-lg-1"></div>
		</div>
	</div>
</div><!-- 유저 테이블 끗 -->
