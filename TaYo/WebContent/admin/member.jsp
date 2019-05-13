<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/admin/templet/header.jsp" %>

	<style>

		h2 {
			padding-left : 20px;
		}
		@media only screen and (max-width: 768px) {
		#table {
		    margin: 0 -10px;
		}
	
		#header{
			padding-left : 20px;
		}
		
		tr > th {
			text-align: center;
		}
		
		tr > td {
			text-align: center;
		}
	</style>
<section>
	<div id = "header"> 
		<h2>회원관리 페이지</h2> 
	</div>
		<hr/>
	<div class = "container">
	<!-- 테이블  -->	
	<button class = "btn btn-outline-secondary"> 수정 </button>
	<button class = "btn btn-outline-secondary"> 삭제 </button>
	<table id = "table" class = "table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>나이</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>이메일</th>
				<th>핸드폰</th>
				<th>성별</th>
				<th>등급</th>
			</tr>
		</thead>
		
			<tbody>
				<tr>
					<td>1</td>
					<td>30</td>
					<td>서울특별시</td>
					<td>금천구 가산동</td>
					<td>12.12kimiyeon@gmail.com</td>
					<td>010-2111-6422</td>
					<td>남</td>
					<td>good</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
	<hr/>
	
	<!-- 페이징 처리 -->
	<div class="text-center">
		<ul class = "pagination pagination-lg">
			<li><a href = "#">1</a></li>
			<li><a href = "#">2</a></li>
			<li><a href = "#">3</a></li>
			<li><a href = "#">4</a></li>
			<li><a href = "#">5</a></li>
		</ul>
	</div>


<%@include file = "/admin/templet/footer.jsp" %>
