<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>
<style>
.my-custom-scrollbar {
	position: relative;
	height: 100px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: block;
}
</style>
<div class="container h-100 pt-3"></div>
<!-- 스크롤 예제 -->
<div class="table-wrapper-scroll-y my-custom-scrollbar">
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">First</th>
				<th scope="col">Last</th>
				<th scope="col">Handle</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
		</tbody>
	</table>

</div>
<!-- 스크롤 end예제 -->


<!-- 필터 -->
<div class="row pb-3">
	<div class="col-sm-2 text-nowrap heading">
		<h3>여행자들의 일정보기</h3>
	</div>
</div>
<table class="table table-bordered ">
	<tr style="display: none">
		<td class="filter_title">필터</td>
		<td class="filter_body" colspan="2"></td>
	</tr>
	<tr>
		<td class="filter_title">여행도시</td>
		<td class="filter_body si">
			<button type="button" class="btn btn-light">서울</button>
			<button type="button" class="btn btn-light">부산</button>
			<button type="button" class="btn btn-light">인천</button>
			<button type="button" class="btn btn-light">대전</button>
			<button type="button" class="btn btn-light">대구</button>
			<div class="collapse city_toggle" id="city_toggle">
				<table style="width:100%">
					<tr>
						<td>
							<button type="button" class="btn btn-light">서울</button>
							<button type="button" class="btn btn-light">부산</button>
							<button type="button" class="btn btn-light">인천</button>
							<button type="button" class="btn btn-light">대전</button>
							<button type="button" class="btn btn-light">대구</button>	
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" class="btn btn-light">서울</button>
							<button type="button" class="btn btn-light">부산</button>
							<button type="button" class="btn btn-light">인천</button>
							<button type="button" class="btn btn-light">대전</button>
							<button type="button" class="btn btn-light">대구</button>	
						</td>
					</tr>
				</table>
			</div>
		</td>
		<td width="4%">
			<span class="fa fa-chevron-down" data-toggle="collapse" data-target="#city_toggle"> </span>
		</td>
	</tr>
	<tr>
		<td class="filter_title">여행기간</td>
		<td class="filter_body" colspan="2">
			<button type="button" class="btn btn_light">1-3일</button>
			<button type="button" class="btn btn_light">4-6일</button>
			<button type="button" class="btn btn_light">7-10일</button>
			<button type="button" class="btn btn_light">11-15일</button>
			<button type="button" class="btn btn_light">15일 이상</button>
		</td>
	</tr>
	<tr>
		<td id="filter_title">여행시기</td>
		<td id="filter-body" colspan="2">
			<button type="button" class="btn btn-light">봄</button>
			<button type="button" class="btn btn-light">여름</button>
			<button type="button" class="btn btn-light">가을</button>
			<button type="button" class="btn btn-light">겨울</button>
		</td>
	</tr>
</table>
<!-- 필터 -->
</div>
<%@ include file="/temp/footer.jsp"%>