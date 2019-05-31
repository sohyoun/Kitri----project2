<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<!-- 회원 테이블이 목록에 뜹니다.  -->
<script>
	$(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/memberlist',
			method : 'post',
			success : function(result) {
				$("table#memberlist").html(result.trim());
			}
		});
	});
</script>

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

		//게시판 목록에서 수정버튼을 클릭했을 때 나오는 화면
		var arr = $("tbody > tr > td > button");
		$(arr[0]).click(function() {
			//console.log("click")
			//alert("click")
			location.href = '/TaYo/tayoadmin/boardresult.jsp';
		});

		$(arr[1]).click(function() {
			//	console.log("삭제")
				alert("삭제")
			
			
		});
	});
</script>
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

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
		<button class="btn btn-primary">전체 목록</button>
		<button class="btn btn-info">게시물 수</button>
		<button class="btn btn-success disabled">건</button>
		<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				그룹 (대분류) <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="#">나의 여행일정</a></li>
				<li><a href="#">나의 함께타요</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
		</div>

		<!-- /btn-group -->
		<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				게시판 (중분류) <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="#">관광지추천</a></li>
				<li><a href="#">여행지추천</a></li>
				<li><a href="#">여행 일정추천</a></li>
				<li><a href="<%=root%>/tayoschedule/schedule.jsp">일정만들기 </a></li>
			</ul>
		</div>

		<div class="btn-group">
			<button type="button" class="btn btn-info dropdown-toggle"
				data-toggle="dropdown">
				기능 (소분류) <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="#">공지</a></li>
				<li><a href="#">신고</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="col-lg-1"></div>
<div class="row">
	<input id="title" type="text" placeholder="title & contents" />
	<button type ="submit" class = "btn btn-info">검색</button> 
</div>
<!-- 드롭다운 메뉴  -->
<!-- /btn-group -->
<br />

<!-- 테이블 영역  -->
<div class="row">
<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkInfo" id="selectallchkbox" value="" /></th>
						<th>번호</th><th>그룹</th><th>게시판</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th><th>추천</th><th>관리</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td><input class="bdchkbox" type="checkbox" name="chkInfo" id="check1" value="" /></td>
						<td>1</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>
							<button type="submit" class="btn btn-info">수정</button>
							<button type="submit" id="removeBtn" class="btn btn-info">삭제</button>
						</td>
					</tr>
					<tr>
						<td><input class="bdchkbox" type="checkbox" name="chkInfo"
							id="check2" value="" /></td>
						<td>2</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>
							<button type="submit" class="btn btn-info">수정</button>
							<button type="submit" class="btn btn-info">삭제</button>
						</td>
					</tr>
					<tr>
						<td><input class="bdchkbox" type="checkbox" name="chkInfo"
							id="check3" value="" /></td>
						<td>3</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>
							<button type="submit" class="btn btn-info">수정</button>
							<button type="submit" class="btn btn-info">삭제</button>
						</td>
					</tr>
					<tr>
						<td><input class="bdchkbox" type="checkbox" name="chkInfo"
							id="check3" value="" /></td>
						<td>4</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>
							<button type="submit" class="btn btn-info">수정</button>
							<button type="submit" class="btn btn-info">삭제</button>
						</td>
					</tr>
					<tr>
						<td><input class="bdchkbox" type="checkbox" name="chkInfo"
							id="check3" value="" /></td>
						<td>5</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>Table cell</td>
						<td>
							<button type="submit" class="btn btn-info">수정</button>
							<button type="submit" class="btn btn-info">삭제</button>
						</td>
					</tr>
				</tbody>
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
			Welcome to the admin dashboard!
		</div>

	</div>
	<div class="col-lg-1"></div>
</div>

<!-- 유저 테이블  -->
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<form action="">
			<input type="text" placeholder="Email Search" class="form-control" />
			<input type="text" placeholder="Name Search" class="form-control" />
			<ul class="list-group">
				<li class="list-group-item"><span class="badge">14</span> 가입 회원
					수</li>
				<li class="list-group-item"><span class="badge">2</span> 탈퇴 회원
					수</li>
				<li class="list-group-item"><span class="badge">1</span> 블랙 회원
					수</li>
			</ul>
		</form>
		<!-- 회원테이블 시작 부분 -->
			<div class="table-responsive">
				<table id = "memberlist" class="table">
					<thead>
						<tr>
							<th>Index</th><th>Email</th><th>name</th><th>Address</th><th>Address_detail</th><th>Gender</th><th>Grade</th>
						</tr>
					</thead>
						<tbody>
						</tbody>
				</table>
			</div> <!-- 회원 목록 테이블 끝나는 부분 -->
		</div>
	<div class="col-lg-1"></div>
</div>

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

<%@ include file="/tayoadmin/templet/footer.jsp"%>