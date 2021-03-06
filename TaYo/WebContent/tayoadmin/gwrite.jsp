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
    
    $("div.container > form").submit(function(){
    	//console.log("gonggiwrite success!")
    	$.ajax({
    		url : '${pageContext.request.contextPath}/writegongi',
    		method : 'post',
    		data : $(this).serialize(),
    		success : function(result){
    			var res = confirm("등록을 완료하시겠습니까?");
    			if(res){
        			alert(result.trim());
        			location.href = "${pageContext.request.contextPath}/tayoadmin/board.jsp";
    			}else{
    				alert("등록을 취소합니다.");
    			}
    		}
    	});
    	return false;
    });
    
    $("#btBack").click(function(){
    	location.href = "${pageContext.request.contextPath}/tayoadmin/board.jsp";
    });
    
});
</script>

 
<div class="container">
	<h2>게시글 등록</h2>
	<hr />
	<form autocomplete="off" class="was-validated">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="gboard_subject" placeholder="subject " name="gboard_subject" required>
		</div>
		
		<div class="form-group">
			<label for="option">분류</label> 
			<select id = "select" name = "gboard_group" class="form-control mx-1 mt-2">
					<option value="공지">공지</option>
					<option value="신고">신고</option>
			</select>
		</div>
		
		<div class="form-group">
			<label for="option">작성자</label>
			<input type="text"
				class="form-control" id="gboard_writer" placeholder="writer"
				name="gboard_writer" required>
		</div>
		
		
		<div class="form-group">
			<label for="option">내용</label>
			<div class="form-group">
				<textarea name="gboard_contents" id="summernote" ></textarea>
			</div>
		</div>
		
		 <div style = "margin-bottom: 5em;"class = "row text-center">
				<button class="btn btn-success">등록</button>
				<button id = "btBack" class="btn btn-primary">뒤로 가기</button>
		</div>
	</form>
</div>