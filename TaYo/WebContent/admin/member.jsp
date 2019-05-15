<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="/admin/templet/header.jsp"%>

<style>
	button{
		width : 20em;
	}
</style>

	<div class="container">
		<!-- 테이블  -->
  <h2>테이블</h2>
  <p>The .thead-dark class adds a black background to table headers, and the .thead-light class adds a grey background to table headers:</p>
  <table class = "table">
    <thead class = "thead-dark">
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
 </div>

<hr />

	<form class = "text-center">
		<button class="btn btn-success btn-sm">수정</button>
		<button class="btn btn-success btn-sm">삭제</button>
	</form>
	
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


<%@include file="/admin/templet/footer.jsp"%>
