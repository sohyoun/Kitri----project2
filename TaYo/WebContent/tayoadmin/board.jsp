<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<style>
button {
	
}

table {
	margin-left: 0 auto;
	margin-right: 0 auto;
}

label {
	background-color: pink;
	border: 1px solid;
	padding: 10;
}

th {
	text-align: center;
}

td {
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
		
		var arr = $("tbody > tr > td > button");
		$(arr[1]).click(function(){
			//console.log("click")
			//alert("click")
			location.href = '/TaYo/tayoadmin/boardresult.jsp';
		});
	});
	
</script>

<div class="row">
	<div class="col-lg-12">
		<h1><small>board</small></h1>
			<div class="alert alert-dismissable alert-danger">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<p>그룹선택, 게시판선택, 게시물엔 원글, 제목, 내용등으로 검색을 할 수가 있습니다.</p>
				<strong>그룹 검색 목록을 선택하거나 검색어를 입력</strong>하여 <strong>여러 게시판을
				동시에 검색</strong> 할 수 있습니다. <strong>그룹검색 시 데이터가 많은 경우</strong> 느려질 수 있습니다.
			</div>
	</div>
	
		<button class="btn btn-default">전체 목록</button>
		<button class="btn btn-info">게시물 수</button>
		<button class="btn btn-success disabled">건</button>
	
</div>

<br />

<div class="btn-group">
	<button type="button" class="btn btn-default">그룹 (대분류)</button>
	<button type="button" class="btn btn-default dropdown-toggle"
		data-toggle="dropdown">
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu">
		<li><a href="#">나의 여행일정</a></li>
		<li><a href="#">나의 함께타요</a></li>
		<li class="divider"></li>
		<li><a href="#">마이페이지</a></li>
	</ul>
</div>
<!-- /btn-group -->

<div class="btn-group">
	<button type="button" class="btn btn-primary">게시판 (중분류)</button>
	<button type="button" class="btn btn-primary dropdown-toggle"
		data-toggle="dropdown">
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu">
		<li><a href="#">관광지추천</a></li>
		<li><a href="#">여행지추천</a></li>
		<li><a href="#">여행 일정추천</a></li>
		<li class="divider"></li>
		<li><a href="<%=root%>/tayoschedule/schedule.jsp">일정만들기 </a></li>
	</ul>
</div>
<!-- /btn-group -->
<br />

<!-- 테이블 영역  -->

<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th><input type="checkbox" name="chkInfo" id ="selectallchkbox" value="" /></th>
				<th>번호</th>
				<th>그룹</th>
				<th>게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>추천</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input class = "bdchkbox" type="checkbox" name="chkInfo" id = "check1" value="" /></td>
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
					<button type="submit" class="btn btn-info">보기</button>
					<button type="submit" class="btn btn-info">목록</button>
				</td>
			</tr>
			<tr>
				<td><input class = "bdchkbox" type="checkbox" name="chkInfo" id = "check2"  value="" /></td>
				<td>2</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td><button type="submit" class="btn btn-info">수정</button>
					<button type="submit" class="btn btn-info">보기</button>
					<button type="submit" class="btn btn-info">목록</button></td>


			</tr>
			<tr>
				<td><input class = "bdchkbox" type="checkbox" name="chkInfo" id = "check3"  value="" /></td>
				<td>3</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td><button type="submit" class="btn btn-info">수정</button>
					<button type="submit" class="btn btn-info">보기</button>
					<button type="submit" class="btn btn-info">목록</button></td>

			</tr>
		</tbody>
	</table>
</div>

<%@ include file="/tayoadmin/templet/footer.jsp"%>