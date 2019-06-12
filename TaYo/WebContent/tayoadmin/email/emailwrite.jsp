<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>   
<title>email</title>

<script>
$(document).ready(function() {
    $('#summernote').summernote({
            height: 600,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
    
});
    
    
    
    
</script>
</head>
<body>  <!--  -->
<div class ="container">
	<h2>신고이메일보내기</h2>
		<form class="was-validated" method = "post" action ="${pageContext.request.contextPath}/email">
			<div class="form-group">
				<label for="title">발신자 이름</label><input class="form-control" name = "senderName"><br/>
			</div>
			<div class="form-group">
				<label for="title">발신자 이메일 주소</label><input class="form-control" name ="senderMail"><br/>
			</div>
			<div class="form-group">
				<label for="title">수신자 이메일 주소</label><input class="form-control" name ="receiveMail" value="tayotayotest@gmail.com"><br/>
			</div>
			<div class="form-group">
				<label for="title">제목</label><input class="form-control" name = "subject"><br/>
			</div>
			<div class="form-group">
				<label for="title">내용</label><textarea id = "summernote" rows="5" cols="80" name = "message"></textarea><br/>
			</div>
			<div style = "margin-bottom: 2em;"class = "row text-center">
				<input class="btn btn-success" type = "submit" value="전송">
			</div>
			<c:if test="${param.message == 'ok'}">
				<span style="color : red;"> 이메일 발송이 완료 되었습니다.</span>
			</c:if>
		</form>
</div>
</body>
</html>