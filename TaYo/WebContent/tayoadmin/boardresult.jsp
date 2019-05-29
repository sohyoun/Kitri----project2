<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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