<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var = "mem" value ="${requestScope.mlist}"/>
	<c:set var = "page" value ="${requestScope.javaBean}"/>
	
<script>
$(function(){
	$("ul.pagination > li > a").click(function(){
		var currentPage=$(this).attr("href");
		alert(currentPage+"페이지를 보여줍니다.");
		$.ajax({
			url:'${javaBean.url}',
			method:'get',
			data:'currentPage='+currentPage,
			success:function(result){
				alert(result)
			},
			error : function(){
				alert("페이징처리 아직 실패")
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
	<div class="pageInfo"> 
		<button type="button" class="btn btn-success">현재 페이지 <span class="badge">${javaBean.currentPage}</span></button>
		<button type="button" class="btn btn-default">총 페이지 <span class="badge">${javaBean.totalPage}</span></button>
			<c:forEach var ="i" begin="0" end="3">
				<label>등급 : ${i} <img style="width: 25px; height: 25px;"src="/TaYo/tayoadmin/images/${i}.png"/></label>
			</c:forEach>
	</div>
		<div class="table-responsive">
			<table class="table">
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
			<c:forEach var = "m" items ="${mem}">
				<tbody>
					<tr>
						<td>${m.mboard_seq}</td>
						<td>${m.member_email}</td>
						<td>${m.member_name}</td>
						<td>${m.member_age}</td>
						<td>${m.member_address}</td>
						<td>${m.member_addressDetail}</td>
						<td>${m.member_joindate}</td>
						<td>${m.member_outdate}</td>
						<td>${m.member_gender}</td>
						<td><img style="width: 25px; height: 25px;"src="/TaYo/tayoadmin/images/${m.member_grade}.png"/></td>
					</tr>
				</tbody> 
			</c:forEach>
			</table>
			<div class="col-lg-1"></div>
		</div>
		<section></section>
<!--페이징 처리-->
			 <ul class="pagination">
				<c:if test="${page.startPage > 1}">
					<li class="disabled"><a href="${page.startPage - 1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${page.startPage}"
					end="${page.endPage}" var="i">
					<c:choose>
						<c:when test="${page.currentPage == i}">
							<li><a href="${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.totalPage > page.endPage }">
					<li><a href="${page.endPage + 1 }">&raquo;</a></li>
				</c:if>
			</ul> 
	</div> 
</div>
<!-- 유저 테이블 끗 -->