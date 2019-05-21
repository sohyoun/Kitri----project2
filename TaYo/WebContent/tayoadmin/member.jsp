<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="/tayoadmin/templet/header.jsp"%>

<style>
	button{
		width : 20em;
	}
	
	div.container > table th{
		text-align: center;
	}
	
</style>
<div class="container">
		<!-- 테이블  -->
  <h2 style = "text-align: left; margin-left: 5%">테이블</h2>
  <p>추가 정보</p>
  <table class = "table">
    <thead class = "thead-dark">
      <tr>
      	<th>이메일</th><th>이름</th><th>나이</th><th>등급</th><th>성별</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td>12.12kimiyeon@gmail.com</td><td>김의연</td><td>31</td><td>good</td><td>M</td>
      </tr>
      <tr>
        <td>Mary</td><td>Moe</td><td>mary@example.com</td><td>""</td><td>""</td>
      </tr>
      <tr>
		<td>July</td><td>Dooley</td><td>july@example.com</td><td>""</td><td>""</td>
      </tr>
    </tbody>
  </table>
 </div>
	<form class = "text-center">
		<button class="btn btn-success btn-sm">수정</button>
		<button class="btn btn-success btn-sm">삭제</button>
	</form>
<hr />
	
<!-- 페이징 처리 -->
<div class="text-center">
	 <ul class="pagination pagination-lg">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
     </ul>
</div>
   <footer>
<section class="footer footer_w3layouts_section_1its py-5">
	<div class="container py-lg-4 py-3">
		<div class="row footer-top">
			<div class="col-lg-3 col-sm-6 footer-grid_section_1its_w3">
				<div class="footer-title">
					<h3>TaYoTaYo</h3>
				</div>
				<div class="row">
					<ul class="col-6 links">
						<li><a href="" class="scroll">관광지 추천</a></li>
						<li><a href="" class="scroll">여행지 추천</a></li>
						<li><a href="" class="scroll">여행 일정 추천</a></li>
						<li><a href="<%=root%>/schedule?act=schedule" class="scroll">일정 만들기</a></li>
						<li><a href="<%=root%>/tayotogether/tayotogether.jsp" class="scroll">함께타요</a></li>
						<li><a href="" class="scroll">My Page</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 footer-grid_section mt-sm-0 mt-4">
				<div class="footer-title">
					<h3>TaYoTaYo의 이야기</h3>
				</div>
				<div class="row">
					<ul class="col-6 links">
						<li><a href="" class="scroll">회사 소개</a></li>
						<li><a href="" class="scroll">F&amp;Q</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 mt-lg-0 mt-4 footer-grid_section_1its_w3">
				<div class="footer-title">
					<h3>My TaYo</h3>
				</div>
				<div class="row">
					<ul class="col-6 links">
						<li><a href="" class="scroll">나의 여행일정</a></li>
						<li><a href="" class="scroll">나의 함께타요</a></li>
						<li><a href="" class="scroll">My Page</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
</footer>
<!-- //footer -->

<!-- copyright -->
<div class="copyright py-3 text-center">
	<p>© 2019 TaYoTaYo - The Bus Trip Planner | Design by 이재운 / 김의연 / 형태희 / 박소현 / 고세라</p>
</div>
<!-- //copyright -->

<!-- move top -->
<div class="move-top text-right">
	<a href="#home" class="move-top"> 
		<span class="fa fa-angle-up  mb-3" aria-hidden="true"></span>
	</a>
</div>


<%@include file="/tayoadmin/templet/footer.jsp"%>
