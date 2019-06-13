<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<c:set var = "gong" value ="${requestScope.glist}"/>
	<c:set var = "page" value ="${requestScope.javaBean}"/>
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
	
	$("ul#paging2 > li > a").click(function(){
		var currentPage=$(this).attr("href");
		alert(currentPage+"페이지를 보여줍니다.");
			$("div#glist").empty();
		$.ajax({
			url:'${pageContext.request.contextPath}/gonggilist?currentPage='+ currentPage,
			method:'get',
			success:function(result){
				//alert(result.trim());
				$("div#glist").html(result);
			},
			error : function(){
				alert("페이징처리 아직 실패")
			}
		}); 
		return false;
	});
	
	$("#removeBtn").click(function(){
		//alert("삭제 클릭")		
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result){
			alert("삭제되었습니다.")
		}else{
			alert("삭제가 취소되었습니다.")
		}
		
	});
});
</script>
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
	<div class= "pageInfo">
	<button type="button" class="btn btn-success">현재 페이지 <span class="badge">${javaBean.currentPage}</span></button>
		<button type="button" class="btn btn-default">총 페이지 <span class="badge">${javaBean.totalPage}</span></button>
	</div>
		<div id = "gonggilist" class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkInfo" id="selectallchkbox" value="" /></th>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>내용</th>
						<th>등록일</th>
						<th>관리</th>
					</tr>
				</thead>
					<tbody class = "gong">
						<c:forEach var = "g" items ="${gong}">
						<tr>
							<td>
								<input class="bdchkbox" type="checkbox" name="chkInfo" id="check" value="" /></td>
								<td>${g.gboard_seq}</td>
								<td>${g.gboard_group}</td>
								<td>${g.gboard_subject}</td>
								<td>${g.gboard_writer}</td>
								<td>${g.gboard_contents}</td>
								<td>${g.gboard_date}</td>
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
<!--페이징 처리-->
			 <ul id ="paging2" class="pagination">
				<c:if test="${page.startPage != 1}">
					<li class="disabled"><a href="${page.startPage - 1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
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
					<li><a href="${page.endPage + 1}">&raquo;</a></li>
				</c:if>
			</ul> 
	</div> 
</div>
<!-- 공지 테이블 끗 -->