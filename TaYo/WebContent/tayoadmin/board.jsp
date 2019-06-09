<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:out value="${info.key}" />

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
		
		//공지 & 신고 검색 클릭 시 테이블 비동기
		$("form#boardInfo > button#search").click(function() {
			alert("검색 눌렀습니다.")
			var gonggisearch = $("#gonggisearch").val();
			var search = $("input#search").val();
			alert(search);
				$.ajax({
					url : '${pageContext.request.contextPath}/searchgongi',
					data : 'gongisearch=' + gonggisearch + '&search=' + search,
					method : 'get',
					suceess :function(result){
						$("div#glist").html(result);
					}
				});
			});
		
		//회원 검색 클릭 시 테이블 비동기
		$("form#memberInfo > button#btSearch").click(function() {
				alert("검색버튼을 클릭했습니다.")
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
				/* $("#keyword")on.("keyup", function(){
					//정규 표현식으로 영문소문자를 찾고 toUpperCase()함수를 이용 대문자 변환
					var nKeyword = keyword.replace(/[a-z]/g,function(m){return m.toUpperCase();});
					$(this).val(nKeyword);
			});
			 */
						$.ajax({
							url : '${pageContext.request.contextPath}/searchInfo',
							method : 'get',
							data : 'searchType=' + searchType + '&keyword=' + keyword,
							success : function(result) {
								//alert(result)
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
		
		//게시판 목록에서 등록버튼을 클릭했을 때 나오는 화면
		$("button#insert").click(function() {
			alert("게시글 등록버튼")
			location.href = '/TaYo/tayoadmin/gwrite.jsp';
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
				<select name="gonggisearch" class="form-control mx-1 mt-2">
					<option value="gboard_seq">공지</option>
					<option value="singo">신고</option>
				</select> <input type="text" id="search" name="search" placeholder="번호"
					class="form-control mr-sm-2" />
				<button id="search" class="btn btn-info">검색</button>
				<button id="insert" class="btn btn-info">등록</button>
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
				</select> <input type="text" name="keyword" id="keyword" placeholder="Search"
					class="form-control mr-sm-2" />
				<button id="btSearch" class="btn btn-info">검색</button>
				<ul class="list-group">
					<li class="list-group-item"><span class="badge">${blackcount}</span>블랙 회원 수</li>
					<li class="list-group-item"><span class="badge"></span> 탈퇴 회원 수</li>
					<li class="list-group-item"><span class="badge">${joincount}</span>가입 회원 수</li>
				</ul>
			</form>
	</div>
	<div class="col-lg-1"></div>
</div>
<div id="mlist" class="row"></div>
<!-- 회원 테이블  끝 -->

<%@ include file="/tayoadmin/templet/footer.jsp"%>