<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>   

<style>

	label {
	 font-size: 15px;
	 font-style: bold;
	}

</style>


<script>
$(document).ready(function() {
    $('#summernote').summernote({
            height: 600,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
    $("#btBack").click(function(){
    	location.href = "${pageContext.request.contextPath}/tayoadmin/board.jsp";
    });
    
    
});
</script>

 
<div class="container">
	<h2>게시글 관리</h2>
	<hr />
	<form action="/action_page.php" class="was-validated">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="title" placeholder="제목이 자동으로 설정될꺼임" name="title" required>
		</div>
		
		<div class="form-group">
			<label for="option">분류</label> <input type="text"
				class="form-control" id="pwd" placeholder="자동 설정"
				name="pswd" required>
		</div>
		
<!-- 		<div class="form-group">
			<label for="option">옵션</label> <input type="text"
				class="form-control" id="pwd" placeholder=""
				name="pswd" required>
		</div> -->
		
		<div class="form-group">
			<label for="option">내용</label>
			<div class="form-group">
				<textarea name="content" id="summernote" value=""></textarea>
			</div>
		</div>
		<!-- <label for="option">첨부파일</label>
		<div class="form-group">
			<label>File input 1 </label><input type="file"> <label>File input 2 </label> <input type="file">
		</div>

		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember" required>
				I agree on blabla.
			</label>
		</div> -->
	</form>
		 <div style = "margin-bottom: 5em;"class = "row text-center">
				<button type="submit" class="btn btn-success">수정</button>
				<button type="submit" id="btBack" class="btn btn-primary">뒤로 가기</button>
		</div>
</div>