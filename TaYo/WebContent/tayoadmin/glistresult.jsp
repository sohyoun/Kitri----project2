<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<c:set var = "gong" value ="${requestScope.glist}"/>
	<c:set var = "page" value ="${requestScope.javaBean}"/>
	
<script>
$(function(){		
	
	/*Handler For SelectAll Checkbox*/
	$("#selectallchkbox").change(function() {
		alert('체크 여러개 했을 때')
		$('.bdchkbox').prop("checked", $(this).prop("checked"));
	}); 
	/*Handler For rest of the checkbox*/
	$('.bdchkbox').change(function() {
		//alert('체크 하나 했을 때')
		$("input[class=bdchkbox]:checked").each(function(){
				var gboard_seq = $(this).val();
				//alert(gboard_seq); // 체크한 글번호를 불러온다.
				$.ajax({
					url : '${pageContext.request.contextPath}/deletegonggi',
					method : 'get',
					data : 'gboard_seq=' + gboard_seq,
					success : function(result){
						alert("지우기 성공")
					},
					error : function(){
						alert("지우기 실패")
					}
				});
				
		});
		if ($('.bdchkbox').length == $('.bdchkboxchecked').length) {
			$("#selectallchkbox").prop("checked", true);
		} else {
			$("#selectallchkbox").prop("checked", false);
		}
	});
	
	$("ul#paging2 > li > a").click(function(){
		var currentPage=$(this).attr("href");
		//alert(currentPage+"페이지를 보여줍니다.");
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
								<input class="bdchkbox" type="checkbox" name="chkInfo" id="check" value="${g.gboard_seq}" />
							</td>
								<td>${g.gboard_seq}</td>
								<td>${g.gboard_group}</td>
								<td>${g.gboard_subject}</td>
								<td>${g.gboard_writer}</td>
								<td>${g.gboard_contents}</td>
								<td>${g.gboard_date}</td>
							<td>
								<button type="submit" id="updateBtn" class="btn btn-info">수정</button>
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