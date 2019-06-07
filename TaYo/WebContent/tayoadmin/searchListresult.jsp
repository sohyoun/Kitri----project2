<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {
		$("form#memberInfo > button#btSearch").click(function() {
			alert("버튼을 클릭했습니다.")
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();

		$.ajax({
			url : '${pageContext.request.contextPath}/searchInfo',
			method : 'get',
			data : 'searchType=' + searchType + '&keyword=' + keyword,
			success : function(result) {
				/* 	if(searchType == null || keyword == null){
						alert("다시 입력 바랍니다용!")
					}else{
						$("#memberlist").html(result.trim());
					} */
				alert(result)
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("jqXHR : " + jqXHR)
				console.log("textStatus : " + textStatus)
				console.log("errorThrown : " + errorThrown)

			}
		});
	});
});
</script>

<c:set var="searchList" value="${requestScope.searchlist}" />
<div class="row">
	<!-- 유저 테이블 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<form id="memberInfo" action="" method="get"
			class="form-inline my-2 my-lg-0">
			<select name="searchType" id="searchType"
				class="form-control mx-1 mt-2">
				<option value="all">전체</option>
				<option value="email">이메일</option>
				<option value="name">이름</option>
				<option value="gender">성별</option>
			</select> <input type="text" name="keyword" id="keyword" placeholder="Search"
				class="form-control mr-sm-2" />
			<button id="btSearch" class="btn btn-info">검색</button>
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
				<c:forEach var="s" items="${searchList}">
					<tbody>
						<tr>
							<td id="board_seq">${s.board_seq}</td>
							<td>${s.email}</td>
							<td>${s.name}</td>
							<td>${s.age}</td>
							<td>${s.address }</td>
							<td>${s.addressDetail}</td>
							<td>${s.joindate}</td>
							<td>${s.outdate}</td>
							<td>${s.gender }</td>
							<td><img style="width: 25px; height: 25px;"
								src="/TaYo/tayoadmin/images/${s.grade}.png"></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="col-lg-1"></div>
		</div>
	</div>
</div>
