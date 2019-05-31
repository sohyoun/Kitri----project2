<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script>

	$(function(){
		//console.log("success")
		var arr = $("form");
		$("button").click(function(){
			console.log("들어옴")
			$.ajax({
				url : '/TaYo/login',
				method : 'get',
				data : $(arr).serialize(),
				success : function(result){
					console.log(result);
					$("section").html(result.trim());
				},
				error : function(){
					console.log("실패");
				} 
				
			});
			return false;
		});
	});



</script>
<section></section>
<div id="page-wrapper">
	<div class="row">

		<div class="col-lg-12 text-center v-center">

			<h1>Sign Up</h1>
			<p class="lead">Enter your email to sign-up for our newsletter</p>

			<br> <br> <br>

			<form class="col-lg-12">
				<div class="input-group"
					style="width: 340px; text-align: center; margin: 0 auto;">
					<input name = "email" class="form-control input-lg" title="Confidential signup."
						placeholder="Enter your email address" required type="text"> 
					<input name = "pass" class="form-control input-lg" title="Confidential signup."
						placeholder="Enter your password" required="required" type="text"> 
						<span class="input-group-btn">
							<button class="btn btn-lg btn-primary" >OK</button>
						</span>
				</div>
			</form>
		</div>
	</div>
	<br> <br> <br> <br> <br> <br> <br> <br>
	<br>
	<div class="text-center">
		<h1>Follow us</h1>
	</div>
	<div class="row">
		<div class="col-lg-12 text-center v-center" style="font-size: 39pt;">
			<a href="#"><span class="avatar"><i
					class="fa fa-google-plus"></i></span></a> <a href="#"><span class="avatar"><i
					class="fa fa-linkedin"></i></span></a> <a href="#"><span class="avatar"><i
					class="fa fa-facebook"></i></span></a> <a href="#"><span class="avatar"><i
					class="fa fa-github"></i></span></a>
		</div>

	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->

