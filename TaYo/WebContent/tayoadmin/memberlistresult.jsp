<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {

/* 		var $select = $("select[name=select]").val();
		//alert($select)
		$.ajax({
			url : ''
		}); */

	});
</script>

<c:set var="boardlist" value="${requestScope.boardlist}" />
<c:set var="pagination" value="${requestScope.pagination}" />

<script>
	//alert("${requestScope.memberlist}")
	//alert("${requestScope.boardlist}")
</script>

<c:set var="joincount" value="${requestScope.joindateTotalCnt}" />
<c:set var="blacklist" value="${requestScope.backTotalCnt}"></c:set>

<div class="row">
	<!-- 유저 테이블 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<form action="" method="get" class="form-inline my-2 my-lg-0">
			<select name="select" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="이메일">이메일</option>
				<option value="이름">이름</option>
				<option value="성별">성별</option>
			</select> <input type="text" name="search" placeholder="Search"
				class="form-control mr-sm-2" />
			<button id="search" class="btn btn-info">검색</button>
			<ul class="list-group">
				<li class="list-group-item"><span class="badge">${blacklist}</span>
					블랙 회원 수</li>
				<li class="list-group-item"><span class="badge"></span> 탈퇴 회원 수</li>
				<li class="list-group-item"><span class="badge">${joincount}</span>
					가입 회원 수</li>
			</ul>
		</form>

		<div class="table-responsive">
			<table id="memberlist" class="table">
				<thead>
					<tr>
						<th>글번호</th>
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
				<c:set var="list" value="${requestScope.boardlist}" />
				<c:forEach var="m" items="${list}">
					<tbody>
						<tr>
							<td id="board_seq">${m.board_seq}</td>
							<td>${m.email}</td>
							<td>${m.name}</td>
							<td>${m.age}</td>
							<td>${m.address }</td>
							<td>${m.addressDetail}</td>
							<td>${m.joindate}</td>
							<td>${m.outdate}</td>
							<td>${m.gender }</td>
							<td><img style="width: 25px; height: 25px;"
								src="/TaYo/tayoadmin/images/${m.grade}.png"></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="col-lg-1"></div>
		</div>
		<script>
			alert("${pagination.startPage}")
			alert("${pagination.endPage}")
		</script>
<ul class="pagination">
			<!--페이징 처리-->
			<c:if test="${pagination.startPage > 1}">
				<li class="disabled"><a href="${pagination.startPage - 1}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="i">
				<c:choose>
					<c:when test="${pagination.currentPage == i}">
						<li class="active">${i}</li>
					</c:when>
					<c:otherwise>
						<li><a href="${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagination.totalPage > pagination.endPage }">
				<li><a href="${pagination.endPage + 1 }"></a>다음</li>
			</c:if>
</ul> 
	</div>
</div>
<!-- 유저 테이블 끗 -->
