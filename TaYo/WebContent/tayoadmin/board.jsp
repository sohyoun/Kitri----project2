<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<!-- 회원 테이블이 목록에 뜹니다.  -->
<style>
#title {
	border-radius: 4px;
	height: 38px;
	margin-top: 2em;
	text-align: center;
}

label {
	background-color: pink;
	border: 1px solid;
	padding: 10;
}

#selectallchkbox {
	margin: 10px;
}

.pagination {
	display: block;
	text-align: center;
}

.pagination>li>a {
	float: none;
}

th, td {
	text-align: center;
}

#danger {
	padding: 0;
}
</style>
<script>
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/memberlist?forward=true',
			method : 'post',
			success : function(result) {
				$("div#memberlist").html(result.trim());
			}
		});
	});
</script>
<script>
	$(document).ready(function() { /*Handler For SelectAll Checkbox*/
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

		//게시판 목록에서 등록버튼을 클릭했을 때 나오는 화면
		var arr = $("tbody > tr > td > button");
		$(arr[0]).click(function() {
			//console.log("click")
			//alert("click")
			location.href = '/TaYo/tayoadmin/Gonggiwrite.jsp';
		});

		$(arr[1]).click(function() {
			//	console.log("삭제")
			alert("삭제")
		});
	});
</script>



<!--   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        Modal Header
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        Modal body
        <div class="modal-body">
          Modal body..
        </div>
        
        Modal footer
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div> -->
<c:set var="g" value="${requestScope.goboard}" />
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<h1>
			<small>Board</small>
		</h1>
		<div class="alert alert-dismissable alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<p>그룹선택, 게시판선택, 게시물엔 원글, 제목, 내용등으로 검색을 할 수가 있습니다.</p>
			<strong>그룹 검색 목록을 선택하거나 검색어를 입력</strong>하여 <strong>여러 게시판을
				동시에 검색</strong> 할 수 있습니다. <strong>그룹검색 시 데이터가 많은 경우</strong> 느려질 수 있습니다.
		</div>
		<div class="btn-group">
			<form action="" method="get" class="form-inline my-2 my-lg-0">
				<select name="" class="form-control mx-1 mt-2">
					<option value="공지">공지</option>
					<option value="신고">신고</option>
				</select> <input type="text" name="search" placeholder="search"
					class="form-control mr-sm-2" />
				<button id="search" class="btn btn-info">검색</button>
			</form>
		</div>
	</div>
</div>

<div class="col-lg-1"></div>
<br />

<!-- 공지 테이블 영역  -->
<div id="boardlist" class="row">
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
						<th>등록일</th>
						<th>조회수</th>
						<th>관리</th>
					</tr>
				</thead>
			<%-- 	<c:forEach var="g" items="${gonggi}"> --%>
					<tbody>
						<tr>
							<td><input class="bdchkbox" type="checkbox" name="chkInfo"
								id="check1" value="" /></td>
							<td>${g.gboard_seq}</td>
							<td>${g.gboard_group}</td>
							<td>${g.gboard_subject}</td>
							<td>${g.gboard_writer}</td>
							<td>${g.gboard_date}</td>
							<td>${g.gboard_viewcount}</td>
							<td>
								<button type="submit" class="btn btn-info">등록</button>
								<button type="submit" id="updateBtn" class="btn btn-info">수정</button>
								<button type="submit" id="removeBtn" class="btn btn-info">삭제</button>
							</td>
						</tr>
					</tbody>
			<%-- 	</c:forEach> --%>
			</table>
		</div>
		<div class="col-lg-1"></div>

		<ul class="pagination">
			<!--페이징 처리-->
			<li class="disabled"><a href="#">&laquo;</a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>

</div>
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<h1>
			<small>User &amp; Member</small>
		</h1>
		<div class="alert alert-dismissable alert-warning">
			<button data-dismiss="alert" class="close" type="button">&times;</button>
			회원 관리 게시판 입니다.
		</div>

	</div>
	<div class="col-lg-1"></div>
</div>

<!-- 유저 테이블  여기서 보여주는거임 -->
<div id="memberlist" class="row"></div>

<%-- <c:forEach var = "memberboard"  items = "${page.list}"> --%>

<%-- </c:forEach> --%>

<%@ include file="/tayoadmin/templet/footer.jsp"%>