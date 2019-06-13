<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		//공지 테이블
		$.ajax({
			url : '${pageContext.request.contextPath}/gonggilist',
			method : 'post',
			success : function(result) {
				$("div#glist").html(result.trim());
			},
			error : function(){
				alert("실패");
			}
		});
		
		//게시판 목록에서 등록버튼을 클릭했을 때 나오는 화면
		$("button#btInsert").click(function() {
			alert("공지게시글 등록버튼")
			location.href = '${pageContext.request.contextPath}/tayoadmin/gwrite.jsp';
			return false;
		});
		
		//회원 테이블 
		$.ajax({
			url : '${pageContext.request.contextPath}/adminmember',
			method : 'post',
			success : function(result) {
				$("div#mlist").html(result.trim());
			},
			error : function (){
				alert("실패");
			}
		});
		
		//공지 & 신고 검색 클릭 시 테이블 비동기
		$("form#boardInfo > button#Search").click(function() {
			alert("공지 검색버튼을 클릭했습니다.")
			var gonggiSearch = $("#gonggiSearch").val();
			var value = $("input#value").val();
				
			$.ajax({
					url : '${pageContext.request.contextPath}/searchgongi',
					method : 'get',
					data : 'gonggiSearch=' + gonggiSearch + '&value=' + value,
					suceess : function(result){
						alert(result)
						$("div#glist").html(result);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("jqXHR : " + jqXHR)
						console.log("textStatus : " + textStatus)
						console.log("errorThrown : " + errorThrown)
		
					}
				});
			return false;		
			});
		//회원 검색 클릭 시 테이블 비동기
		$("form#memberInfo > button#btSearch").click(function() {
				alert("회원 검색버튼을 클릭했습니다.")
				var searchType = $("#searchType").val();
				var keyword = $("#keyword").val();
					if(keyword == ("") && searchType == ("all")){
						$.ajax({
							url : '${pageContext.request.contextPath}/adminmember',
							method : 'post',
							success :function(result) {
								$("div#mlist").html(result.trim());
							}
						});
					}else{
						$.ajax({
							url : '${pageContext.request.contextPath}/searchInfo',
							method : 'get',
							data : 'searchType=' + searchType + '&keyword=' + keyword,
							success : function(result) {
								$("div#mlist").html(result);
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console.log("jqXHR : " + jqXHR)
								console.log("textStatus : " + textStatus)
								console.log("errorThrown : " + errorThrown)
				
							}
						});
					}
			return false;
		});
	});
</script>
<!-- 공지 & 신고 게시판 시작  -->
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<h1>
			<small>게시판</small>
		</h1>
		<div class="alert alert-dismissable alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<p>그룹선택, 게시판선택, 제목 으로 검색을 할 수가 있습니다.</p>
			<strong>그룹 검색 목록을 선택하거나 검색어를 입력</strong>하여 <strong>여러 게시판을
				동시에 검색</strong> 할 수 있습니다.<br/><strong>그룹검색 시 데이터가 많은 경우</strong>느려질 수 있습니다.
		</div>
		<div class="btn-group">
			<form id ="boardInfo" class="form-inline my-2 my-lg-0">
				<select id = "gonggiSearch" name = "gonggiSearch" class="form-control mx-1 mt-2">
					<option value="gboard_seq">공지</option>
					<option value="singo">신고</option>
				</select> <input autocomplete= "off" type="text" id = "value" name = "value" placeholder = "번호"
					class="form-control mr-sm-2" />
				<button id="Search" class="btn btn-info">검색</button>
				<button id="btInsert" class="btn btn-info">등록</button>
			</form>
		</div>
	</div>
</div>
<div class="col-lg-1"></div>
<br/>

<div id="glist" class="row"></div>
<!-- 공지테이블 끝 -->


<!-- 회원테이블 시작 -->
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<h1>
			<small>회원 목록</small>
		</h1>
		<div class="alert alert-dismissable alert-warning">
			<button data-dismiss="alert" class="close" type="button">&times;</button>
			회원 관리 게시판 입니다.
		</div>
			<form id ="memberInfo" class="form-inline my-2 my-lg-0">
				<select name="searchType" id= "searchType" class="form-control mx-1 mt-2">
					<option value="all">전체</option>
					<option value="member_email">이메일</option>
					<option value="member_name">이름</option>
					<option value="member_gender">성별</option>
				</select> 
				<input  autocomplete= "off"  type="text" name="keyword" id="keyword" placeholder="Search"
					class="form-control mr-sm-2" />
				<button id="btSearch" class="btn btn-info">검색</button>
			</form>
		</div>
	<div class="col-lg-1"></div>
</div>
<div id="mlist" class="row"></div>
<!-- 회원 테이블  끝 -->

<%@ include file="/tayoadmin/templet/footer.jsp"%>