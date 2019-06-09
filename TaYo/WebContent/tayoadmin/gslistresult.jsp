<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="sg" value="${requestScope.gslist}" />

<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkInfo" id="selectallchkbox" value="" /></th>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>내용</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>관리</th>
					</tr>
				</thead>
					<c:forEach var="so" items="${sg}">
						<tbody>
							<tr>
								<td><input class="bdchkbox" type="checkbox" name="chkInfo" id="check1" value="" /></td>
								<td>${so.gboard_seq}</td>
								<td>${so.gboard_group}</td>
								<td>${so.gboard_subject}</td>
								<td>${so.gboard_writer}</td>
								<td>${so.gboard_contents}</td>
								<td>${so.gboard_date}</td>
								<td>${so.gboard_viewcount}</td>
								<td>
									<button type="submit" id="updateBtn" class="btn btn-info">수정</button>
									<button type="submit" id="removeBtn" class="btn btn-info">삭제</button>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		<div class="col-lg-1"></div>
	</div>
</div>
