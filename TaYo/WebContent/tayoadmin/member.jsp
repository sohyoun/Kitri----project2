<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>

<!-- jquery  --> 
<!-- <script type="text/javascript">
/*스크롤바 막기  */
$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	event.preventDefault();
	event.stopPropagation();
	return false;
});
</script> -->
<!--선택영역-->
<style>
	.pagination{
		margin: 0 auto;
	}
</style>


<!--테이블 -->

<div class="row">
	<div class="col-lg-12">
		<h1><small>User &amp; Member</small></h1>
		<div class="alert alert-dismissable alert-warning">
			<button data-dismiss="alert" class="close" type="button">&times;</button>
				Welcome to the admin dashboard! 
			<br />  
		</div>
		<div class="table-responsive">
			 	<form action="">
					<input type ="text" placeholder = "Email Search" class = "form-control"/>
				</form>
		  <table class="table">
		    <thead>
		      <tr>
				<th>#</th><th>Email</th>
				<th>Table heading</th>
				<th>Table heading</th>
				<th>Table heading</th>
				<th>Table heading</th>
				<th>Table heading</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
				<td>1</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
		      </tr>
		      <tr>
				<td>2</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
		      </tr>
		      <tr>
				<td>3</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
				<td>Table cell</td>
		      </tr>
		    </tbody>
		  </table>
		</div>
		
	<div class="row"> <!--페이징 처리-->
         <div class="col-lg-4">
           <div class="bs-example">
             <ul class="pagination">
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
		</div>
	</div>
</div>

	
<%@include file="/tayoadmin/templet/footer.jsp"%>
