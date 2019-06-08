<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="searchList" value="${requestScope.searchlist}" />
<c:set var="mlist" value="${requestScope.mlist}" />

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
		},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("jqXHR : " + jqXHR)
				console.log("textStatus : " + textStatus)
				console.log("errorThrown : " + errorThrown)

			}
		});
		return false;
	});
		
	 	$("ul.pagination > li > a").click(function(){
			var currentPage=$(this).attr("href");
			alert(currentPage+"페이지를 보여줍니다.");
			$.ajax({
				url:'${mlist.url}',
				method:'post',
				data:'currentPage='+currentPage,
				dataType : 'json',
				success:function(result){
					var data = $("#memberlist > tbody").remove();
					//alert(result)
					for(var i = 0; i < result.length; i ++){
						var obj = result[i];
						data += '<tr>';
							data += '<th>' + "글번호" + '</ht>';
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
					$("#memberlist > tbody").append(data);
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










