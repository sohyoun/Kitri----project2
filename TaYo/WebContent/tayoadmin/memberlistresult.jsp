<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="searchList" value="${requestScope.searchlist}" />
<c:set var="joincount" value="${requestScope.joindateTotalCnt}" />
<c:set var="blackcount" value="${requestScope.backTotalCnt}"/>
<c:set var="pagination" value="${requestScope.pagination}" />
<script>
	$(function() {
		$("form#memberInfo > button#btSearch").click(function() {
			//alert("버튼을 클릭했습니다.")
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
							data += '<td id="board_seq">' + obj.board_seq +'</td>';
							data += '<td>'+ obj.email +'</td>';
							data += '<td>'+ obj.name +'</td>';
							data += '<td>$'+ obj.age +'</td>';
							data += '<td>'+ obj.address +'</td>';
							data += '<td>'+ obj.addressDetail +'</td>';
							data += '<td>'+ obj.joindate +'</td>';
							data += '<td>'+ obj.outdate +'</td>';
							data += '<td>'+ obj.gender + '</td>';
							data += '<td><img style=\"width: 25px; height: 25px;\"src=\"/TaYo/tayoadmin/images/'+ obj.grade +'.png\"></td>';
						data += '</tr>';
					}
					$("#memberlist > div").html(data);
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
		var calcount =1;
	 	$("ul.pagination > li > a").click(function(){
			var currentPage=$(this).attr("href");
			console.log(calcount++);
// 			alert(currentPage+"페이지를 보여줍니다.");
			$.ajax({
				url:'${pagination.url}',
				method:'post',
				data:'currentPage='+currentPage,
				dataType : 'json',
				success:function(result){
					if(currentPage == 1){
						var val = $("table#memberlist > tbody").val();
						alert(val);
						
					} else{
					var data = $("#memberlist > tbody").html("");
					console.log('result');
					console.log(result);
					console.log('result.length');
					console.log(result.length);
					
						for(var i = 0; i < result.length; i ++){
							var obj = result[i];
							data += '<tr>';
								data += '<td id="board_seq">' + obj.board_seq +'</td>';
								data += '<td>'+ obj.email +'</td>';
								data += '<td>'+ obj.name +'</td>';
								data += '<td>$'+ obj.age +'</td>';
								data += '<td>'+ obj.address +'</td>';
								data += '<td>'+ obj.addressDetail +'</td>';
								data += '<td>'+ obj.joindate +'</td>';
								data += '<td>'+ obj.outdate +'</td>';
								data += '<td>'+ obj.gender + '</td>';
								data += '<td><img style=\"width: 25px; height: 25px;\"src=\"/TaYo/tayoadmin/images/'+ obj.grade +'.png\"></td>';
							data += '</tr>';
						}
					//var ap = $("#memberlist > tbody").append(data);
					}	
					$("#memberlist > tbody").html(data);
				},
				error : function(){
					console.log("에러")
				}
			}); 
			return false;
		}); 
	 	
	 	
	 	
	 	
	 	
});
	
</script>

<div class="row">
	<!-- 유저 테이블 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<form id = "memberInfo" action="" method="get" class="form-inline my-2 my-lg-0">
			<select name="searchType" id= "searchType" class="form-control mx-1 mt-2">
				<option value="all">전체</option>
				<option value="email">이메일</option>
				<option value="name">이름</option>
				<option value="gender">성별</option>
			</select> <input type="text" name="keyword" id="keyword" placeholder="Search"
				class="form-control mr-sm-2" />
			<button id="btSearch" class="btn btn-info">검색</button>
			<ul class="list-group">
				<li class="list-group-item"><span class="badge">${blackcount}</span>
					블랙 회원 수</li>
				<li class="list-group-item"><span class="badge"></span> 탈퇴 회원 수</li>
				<li class="list-group-item"><span class="badge">${joincount}</span>
					가입 회원 수</li>
			</ul>
		</form>
	<c:set var="list" value="${requestScope.boardlist}" />
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
			<%-- 	<c:forEach var="m" items="${list}">
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
				</c:forEach> --%>
			</table>
			<div class="col-lg-1"></div>
		</div>
<!--페이징 처리-->
			<ul class="pagination">
				<c:if test="${pagination.startPage > 1}">
					<li class="disabled"><a href="${pagination.startPage - 1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="i">
					<c:choose>
						<c:when test="${pagination.currentPage == i}">
							<li><a href="${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagination.totalPage > pagination.endPage }">
					<li><a href="${pagination.endPage + 1 }">&raquo;</a></li>
				</c:if>
			</ul> 
	</div>
</div>
<!-- 유저 테이블 끗 -->










