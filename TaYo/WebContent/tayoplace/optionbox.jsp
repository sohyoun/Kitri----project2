<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/* bbsSearch */
.tableWrap.searchWrap {
	border-bottom: 1px solid #cecece;
}

.searchWrap {
	border-left: 1px solid #cecece;
	border-right: 1px solid #cecece;
}

.bbsSearch {
	overflow: hidden;
	width: 100%;
}
/* .bbsSearch tbody tr:first-child th,
.bbsSearch tbody tr:first-child td { border-top:0px; } 2014.7.23 */
.bbsSearch tbody th {
	padding: 8px 0 8px 20px;
	font-size: 13px;
	color: #222;
	text-align: left;
	border-top: 1px solid #e9e9e9;
	background-color: #f9f9f9;
}

.bbsSearch tbody td {
	padding: 8px 0 8px 20px;
	font-size: 12px;
	border-top: 1px solid #e9e9e9;
}

.bbsSearch tbody td * {
	vertical-align: middle;
}

.bbsSearch tbody td input[type=radio] {
	margin-top: 0px;
}

.bbsSearch tbody th.last, .bbsSearch tbody td label {
	margin-right: 5px;
}

.bbsSearch tbody td.last {
	border-bottom: 0px;
}

.bbsSearch tbody td select {
	padding: 5px;
	height: 30px;
	width: 163px;
	border: 1px solid #e8e8e8;
	font: 11px/1.5 "돋움", Dotum, Arial;
	color: #666;
}

.bbsSearch tbody td input.input_txt {
	padding: 5px;
	height: 18px;
	border: 1px solid #e8e8e8;
	font: normal 12px/1.5 "나눔고딕", NanumGothic, NGNormal;
	color: #666;
}
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id="searchForm" method="post" action="/guide/inforArea.do">
		<fieldset>
			<!-- <legend>지역별 관광정보 검색</legend> -->

			<div class="tableWrap searchWrap mgNone">
				<div id="selectArea"></div>


				<table class="bbsSearch">
					<!-- <caption>검색 순서 1 – 관광데이터 검색을 위한 언어선택</caption> -->
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="wHacki8" scope="row">관광타입</th>
							<td><select name="arrange" id="arran" title="관광타입" onchange="document.getElementById('KeyWord').value= this.options[this.selectedIndex].value">
									<option value="A" selected>타입선택</option>
									<option value="B">관광지</option>
									<option value="C">문화시설</option>
									<option value="D">축제공연행사</option>
									<option value="O">여행코스</option>
									<option value="P">레포츠</option>
									<option value="Q">숙박</option>
									<option value="R">쇼핑</option>
									<option value="S">음식점</option>
							</select></td>
						</tr>
					</tbody>
				</table>

<!-- 
				<td>
					<div class="form-group">
						<label for="sel1"></label> <select class="choice"
							id="lesSearchKind" name="lesSearchKind"
							onchange="document.getElementById('KeyWord').value= this.options[this.selectedIndex].value">
							<option>선택하세요</option>
							<option value="외국어">외국어</option>
							<option value="컴퓨터">컴퓨터</option>
							<option value="마케팅">마케팅</option>
							<option value="커뮤니케이션">커뮤케이션</option>
							<option value="영상, 사진">영상,사진</option>
							<option value="스포츠">스포츠</option>
							<option value="음악,악기">음악,악기</option>
							<option value="취미">취미,문화</option>
						</select> <input type="hidden" id="KeyWord" name="KeyWord" value="">


					</div>
				</td>
 -->



				<table class="bbsSearch">
					<!-- <caption>검색 순서 1 – 관광데이터 검색을 위한 언어선택</caption> -->
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="wHacki8" scope="row">서비스분류</th>
							<td><select name="arrange" id="arran" title="대분류">
									<option value="A" selected>대분류</option>
									<option value="B">자연</option>
									<option value="C">인문(문화/예술/역사)</option>
									<option value="D">레포츠</option>
									<option value="O">쇼핑</option>
									<option value="P">음식</option>
									<option value="Q">숙박</option>
									<option value="R">추천코스</option>
							</select> <select name="arrange" id="arran" title="중분류">
									<option value="A" selected>중분류</option>
									<option value="B">역사관광지</option>
									<option value="C">휴양관광지</option>
									<option value="D">체험관광지</option>
									<option value="O">산업관광지</option>
									<option value="P">건축/조형물</option>
									<option value="Q">문화시설</option>
									<option value="R">축제</option>
									<option value="S">공연/행사</option>
							</select> <select name="arrange" id="arran" title="정렬방법">
									<option value="A" selected>제목순</option>
									<option value="B">인기순</option>
									<option value="C">최근수정순</option>
									<option value="D">등록순</option>
									<option value="O">제목순(이미지)</option>
									<option value="P">인기순(이미지)</option>
									<option value="Q">최근수정순(이미지)</option>
									<option value="R">등록순(이미지)</option>
							</select></td>
						</tr>
					</tbody>
				</table>



				<table class="bbsSearch">
					<!-- <caption>검색 순서 1 – 관광데이터 검색을 위한 언어선택</caption> -->
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="wHacki8" scope="row">지역</th>
							<td><select name="arrange" id="arran" title="정렬방법">
									<option value="A" selected>지역선택</option>
									<option value="B">서울</option>
									<option value="C">인천</option>
									<option value="D">대전</option>
									<option value="O">대구</option>
									<option value="P">광주</option>
									<option value="Q">부산</option>
									<option value="R">울산</option>
									<option value="R">세종특별자치시</option>
									<option value="R">경기도</option>
									<option value="R">강원도</option>
									<option value="R">충청북도</option>
									<option value="R">충청남도</option>
									<option value="R">경상북도</option>
									<option value="R">경상남도</option>
									<option value="R">전라북도</option>
									<option value="R">전라남도</option>
									<option value="R">제주도</option>
							</select> <select name="arrange" id="arran" title="정렬방법">
									<option value="A" selected>제목순</option>
									<option value="B">인기순</option>
									<option value="C">최근수정순</option>
									<option value="D">등록순</option>
									<option value="O">제목순(이미지)</option>
									<option value="P">인기순(이미지)</option>
									<option value="Q">최근수정순(이미지)</option>
									<option value="R">등록순(이미지)</option>
							</select></td>
						</tr>
					</tbody>
				</table>



				<table class="bbsSearch">
					<!-- 					<caption>검색 순서 3 - 검색버튼을 클릭(엔터)하면 관광데이터 검색 결과를 확인할 수 있음</caption> -->
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="last wHacki8" scope="row">검색</th>
							<td class="last"><input type="hidden" name="mode"
								value="listOk"> <input type="image" id="search"
								src="/TaYo/images/btnSearch_Blue.gif" alt="검색" /></td>
						</tr>
					</tbody>
				</table>

			</div>
		</fieldset>





		<!-- 	<div class="searchUtill">
			<p>
				<strong>총 데이터 수</strong>13개
			</p>
			<div>

				<select name="arrange" id="arran" title="정렬방법">
					<option value="A" selected>제목순</option>
					<option value="B">인기순</option>
					<option value="C">최근수정순</option>
					<option value="D">등록순</option>
					<option value="O">제목순(이미지)</option>
					<option value="P">인기순(이미지)</option>
					<option value="Q">최근수정순(이미지)</option>
					<option value="R">등록순(이미지)</option>

				</select> <input type="image" id="arrview"
					src="/TaYo/images/btnSearch_gray.gif" alt="검색" />

			</div>
		</div> -->
	</form>






</body>
</html>