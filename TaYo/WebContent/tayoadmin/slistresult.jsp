<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="s" value="${requestScope.slist}" />
<div class="row">
	<!-- 유저 테이블 시작 -->
	<div class="col-lg-1"></div>
	<div class="col-lg-10">
		<div class="table-responsive">
			<table id="memberlist" class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>이메일</th>
						<th>이름</th>
						<th>나이</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>가입일</th>
						<th>탈퇴일</th>
						<th>성별</th>
						<th>등급</th>
					</tr>
				</thead>
					<c:forEach var="se" items="${s}">
						<tbody>
							<tr>
								<td id="board_seq">${se.mboard_seq}</td>
								<td>${se.member_email}</td>
								<td>${se.member_name}</td>
								<td>${se.member_age}</td>
								<td>${se.member_address }</td>
								<td>${se.member_addressDetail}</td>
								<td>${se.member_joindate}</td>
								<td>${se.member_outdate}</td>
								<td>${se.member_gender }</td>
								<td><img style="width: 25px; height: 25px;"
									src="/TaYo/tayoadmin/images/${se.member_grade}.png"></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			<div class="col-lg-1"></div>
		</div>
	</div>
</div>
