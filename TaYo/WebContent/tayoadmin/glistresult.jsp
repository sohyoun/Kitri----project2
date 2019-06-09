<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c"	 uri = "http://java.sun.com/jsp/jstl/core" %>
	<c:set var = "gong" value ="${requestScope.glist}"/>
<script>
$(function(){
	/*Handler For SelectAll Checkbox*/
	$("#selectallchkbox").change(function() {
		$('.bdchkbox').prop("checked", $(this).prop("checked"));
	}); /*Handler For rest of the checkbox*/
	$('.bdchkbox').change(function() {
		if ($('.bdchkbox').length == $('.bdchkboxchecked').length) {
			$("#selectallchkbox").prop("checked", true);
		} else {
			$("#selectallchkbox").prop("checked", false);
		}
	});
});

</script>
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkInfo"
							id="selectallchkbox" value="" /></th>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>내용</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>관리</th>
					</tr>
				</thead>
					<tbody>
						<c:forEach var = "g" items ="${gong}">
						<tr>
							<td><input class="bdchkbox" type="checkbox" name="chkInfo" id="check1" value="" /></td>
								<td>${g.gboard_seq}</td>
								<td>${g.gboard_group}</td>
								<td>${g.gboard_subject}</td>
								<td>${g.gboard_writer}</td>
								<td>${g.gboard_contents}</td>
								<td>${g.gboard_date}</td>
								<td>${g.gboard_viewcount}</td>
							<td>
								<button type="submit" id="updateBtn" class="btn btn-info">수정</button>
								<button type="submit" id="removeBtn" class="btn btn-info">삭제</button>
							</td>
						</tr>
						</c:forEach> 
					</tbody>
			</table>
		</div>
		<div class="col-lg-1"></div>
<!-- 페이징처리  -->
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
<!-- 공지 테이블 끗 -->