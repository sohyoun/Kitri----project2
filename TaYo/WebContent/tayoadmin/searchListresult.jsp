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
			url : '${pageContext.request.contextPath}/searchInfo?search=true',
			method : 'get',
			data : 'searchType=' + searchType + '&keyword=' + keyword,
			dataType : 'json',
			success : function(result) {
				if(("all") == searchType){
					
				} else{
				var data = $("#memberlist > tbody").html("");
				for(var i = 0; i < result.length; i ++){
					var obj = result[i];
					data += '<tr>';
						data += '<td id="board_seq">' + obj.mboard_seq +'</td>';
						data += '<td>'+ obj.member_email +'</td>';
						data += '<td>'+ obj.member_name +'</td>';
						data += '<td>'+ obj.member_age +'</td>';
						data += '<td>'+ obj.member_address +'</td>';
						data += '<td>'+ obj.member_addressDetail +'</td>';
						data += '<td>'+ obj.member_joindate +'</td>';
						data += '<td>'+ obj.member_outdate +'</td>';
						data += '<td>'+ obj.member_gender + '</td>';
						data += '<td><img style=\"width: 25px; height: 25px;\"src=\"/TaYo/tayoadmin/images/'+ obj.member_grade +'.png\"></td>';
					data += '</tr>';
				}
				$("#memberlist > tbody").html(data);
			}
		},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("jqXHR : " + jqXHR)
				console.log("textStatus : " + textStatus)
				console.log("errorThrown : " + errorThrown)

			}
		});
		return false;
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
				<option value="member_email">이메일</option>
				<option value="member_name">이름</option>
				<option value="member_gender">성별</option>
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
					<tbody>
					</tbody>
			</table>
			<div class="col-lg-1"></div>
		</div>
	</div>
</div>
