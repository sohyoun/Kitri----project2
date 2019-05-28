<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h3>게시글 관리</h3>
<hr/>
<body>
	<div class = "row">
		<button>전체 글 관리</button><button>게시글 목록</button>
	</div><br/>
<label>(*) 표시 항목은 필수 입력 항목 입니다.</label><br/>
<label>제목 *</label> <input type = "text"/> <button>임시저장</button> <br/> 
<label>옵션</label><input type = "checkbox"/>공지 <input type = "checkbox"/> 비밀글<input type = "checkbox"/>답변메일<br/> 

<label>분류 *</label><br/>
<label>내용 *</label> <textarea></textarea><br/>
<label>첨부 파일</label> <button>파일 선택</button>


</body>
</html> -->

<!-- <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body> -->

<div class="container">
	<h2>게시글 관리</h2>
	<hr />
	<button>전체 글 관리</button>
	<button>게시글 목록</button>
	<br />
	<form action="/action_page.php" class="was-validated">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="title" placeholder="제목" name="title" required>
		</div>
		<div class="form-group">
			<label for="option">옵션</label> <input type="password"
				class="form-control" id="pwd" placeholder="Enter password"
				name="pswd" required>
		</div>
		<div class="form-group">
			<label for="option">분류</label> <input type="password"
				class="form-control" id="pwd" placeholder="Enter password"
				name="pswd" required>
		</div>
		<div class="form-group">
			<label for="option">내용</label>
			<div class="form-group">
				<label>Text area</label>
				<textarea class="form-control" rows="3"></textarea>
			</div>
		</div>
		<label for="option">첨부파일</label>
		<div class="form-group">
			<label>File input 1 </label><input type="file"> <label>File
				input 2 </label> <input type="file">
		</div>

		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember" required>
				I agree on blabla.
			</label>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

<!-- </body>
</html> -->
<%@ include file="/tayoadmin/templet/footer.jsp"%>