<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Bubbly - Boootstrap 4 Admin template by Bootstrapious.com</title>

<%
	request.setCharacterEncoding("UTF-8");
%>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/TaYo/tayoplace/js/httpRequest.js"></script>


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

.listWrap {
	border-top: 2px solid #9b9b9b;
}

.galleryList {
	margin: 40px 0 0 -39px !important;
}

.galleryList li {
	overflow: hidden;
	float: left;
	width: 210px;
	margin-left: 39px;
}

.galleryList li .selectCheck {
	display: block;
}

.galleryList li .selectCheck input {
	display: none;
}

.galleryList li img {
	width: 250px;
	height: 150px;
}

.galleryList li a {
	display: block;
}

.galleryList li p {
	height: 40px;
	margin: 20px 0 30px 0 !important;
	font-size: 14px;
	color: #333;
	text-align: center;
	letter-spacing: -1px;
}

/* 글자 검정으로 클릭시 파랑으로 */
a {
	color: black;
	text-decoration: none;
	background-color: transparent;
	-webkit-text-decoration-skip: objects;
}

a:hover {
	color: #0056b3;
	text-decoration: underline;
}
/* 글자 검정으로 클릭시 파랑으로 */
</style>


</head>
<script type="text/javascript">
	var eleTmep;
	$(document).ready(function() {//

		var params = "cmd=areaCode";
		sendRequest("/TaYo/tayoapi", params, areaCodeResult, "GET");
	});

	//시도 코드 뽑아내기
	function areaCodeResult() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				var result = httpRequest.responseXML;
				console.log("result: " + result);
				var item = result.getElementsByTagName("item");
				console.log("item: " + item);

				for (var i = 0; i < item.length; i++) {
					var option = $("<option value='"
							+ item[i].getElementsByTagName("code")[0].firstChild.data
							+ "'>"
							+ item[i].getElementsByTagName("name")[0].firstChild.data
							+ "</option>");
					$('#areaCode').append(option);
				}

				searchList('');
			}
		}
	}

	//시도코드 변경시 시군구 코드 뽑아내기
	function areaCodechage() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				var result = httpRequest.responseXML;
				console.log("result: " + result);
				var item = result.getElementsByTagName("item");
				console.log("item: " + item);

				$("select[id='sigunguCode'] option").remove();
				$('#sigunguCode').append("<option value=''>시군구</option>");

				for (var i = 0; i < item.length; i++) {
					var option = $("<option value='"
							+ item[i].getElementsByTagName("code")[0].firstChild.data
							+ "'>"
							+ item[i].getElementsByTagName("name")[0].firstChild.data
							+ "</option>");
					$('#sigunguCode').append(option);
				}

			}
		}
	}

	//카테고리 관광코드 선택 시 대분류 뽑아내기
	function categoryCodechage() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				var result = httpRequest.responseXML;
				console.log("result: " + result);
				var item = result.getElementsByTagName("item");
				console.log("item: " + item);

				$("select[id='cat1'] option").remove();
				$('#cat1').append("<option value=''>대분류</option>");

				for (var i = 0; i < item.length; i++) {
					var option = $("<option value='"
							+ item[i].getElementsByTagName("code")[0].firstChild.data
							+ "'>"
							+ item[i].getElementsByTagName("name")[0].firstChild.data
							+ "</option>");
					$('#cat1').append(option);
				}

			}
		}
	}

	//대분류 선택 시 중분류 뽑아내기
	function cat1chage() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				var result = httpRequest.responseXML;
				console.log("result: " + result);
				var item = result.getElementsByTagName("item");
				console.log("item: " + item);

				$("select[id='cat2'] option").remove();
				$('#cat2').append("<option value=''>중분류</option>");

				for (var i = 0; i < item.length; i++) {
					var option = $("<option value='"
							+ item[i].getElementsByTagName("code")[0].firstChild.data
							+ "'>"
							+ item[i].getElementsByTagName("name")[0].firstChild.data
							+ "</option>");
					$('#cat2').append(option);
				}

			}
		}
	}

	//중분류 선택 시 소분류 뽑아내기
	function cat2chage() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				var result = httpRequest.responseXML;
				console.log("result: " + result);
				var item = result.getElementsByTagName("item");
				console.log("item: " + item);

				$("select[id='cat3'] option").remove();
				$('#cat3').append("<option value=''>소분류</option>");

				for (var i = 0; i < item.length; i++) {
					var option = $("<option value='"
							+ item[i].getElementsByTagName("code")[0].firstChild.data
							+ "'>"
							+ item[i].getElementsByTagName("name")[0].firstChild.data
							+ "</option>");
					$('#cat3').append(option);
				}

			}
		}
	}

	//검색 버튼 클릭 시 searchList 결과 출력
	function serchResult() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {

				var result = httpRequest.responseXML;
				console.log("result: " + result);
				var item = result.getElementsByTagName("item");
				console.log("item: " + item);

				var pageNo = result.getElementsByTagName("pageNo");
				var totalCount = result.getElementsByTagName("totalCount");
				eleTmep = item;

				$("#placeList").html('');

				for (var i = 0; i < item.length; i++) {

					var option = "<li>";
					option += "<img src='"+ item[i].getElementsByTagName("firstimage")[0].firstChild.data + "' style='width:250px; height:150px;'>";
					option += "<p><a id = 'linkDetail' href='#' onClick='goDetail("	+ i	+ ")'> " + item[i].getElementsByTagName("title")[0].firstChild.data	+ "</a></p>";
					option += "</a>";
					option += "</li> ";

					/* 	<li>
							<a href="/guide/tourDetail.do?contentId=2381406&amp;langtype=KOR&amp;typeid=25&amp;oper=area&amp;burl=&amp;contentTypeId=&amp;areaCode=&amp;sigunguCode=&amp;cat1=&amp;cat2=&amp;cat3=&amp;listYN=Y&amp;MobileOS=ETC&amp;MobileApp=TourAPI3.0_Guide&amp;arrange=A&amp;numOfRows=12&amp;pageNo=1">
							<img src="http://tong.visitkorea.or.kr/cms/resource/74/1998774_image2_1.jpg" alt="">
							<p>‘바다여행의 종합 세트’ 사천으로 가자</p>
							</a>
						</li>
					 */

					$("#placeList").append(option);

				}

			}
		}
	}

	function goDetail(idx) {
		$('#contentId').val(eleTmep[idx].getElementsByTagName("contentId"));

		document.getElementById("tmp").action = "/TaYo/tayoDetailapi";
		document.getElementById("tmp").submit();
	}

	
	//검색 버튼 클릭 시 searchList
	function searchList(pageNo) {
		if (pageNo == "")
			pageNo = 1;
		var params = "cmd=areaBasedList";
		params += "&areaCode=" + $("#areaCode option:selected").val(); //시도 코드
		params += "&sigunguCode=" + $("#sigunguCode option:selected").val(); //시군구 코드
		params += "&contentTypeId=" + $("#contentTypeId option:selected").val(); //관광타입 
		params += "&cat1=" + $("#cat1 option:selected").val(); ///대분류
		params += "&cat2=" + $("#cat2 option:selected").val(); ///중분류
		params += "&cat3=" + $("#cat3 option:selected").val(); ///소분류
		params += "&pageNo=" + pageNo;

		sendRequest("/TaYo/tayoapi", params, serchResult, "GET");

	}
	///////////////////////////////////////////////////////////////////////////

	//////////////////////cmd코드 보내기///////////////////////////////////////////

	$(function() {
		//시도를 바꿨을 때 시군구 목록들 추가 
		$('#areaCode').change(function() {
			var params = "cmd=sigunguCode&areaCode=" + this.value;
			sendRequest("/TaYo/tayoapi", params, areaCodechage, "GET");
		});

		$('#contentTypeId').change(function() {
			var params = "cmd=categoryCode&contentTypeId=" + this.value;
			sendRequest("/TaYo/tayoapi", params, categoryCodechage, "GET");
		});

		$('#cat1').change(
				function() {
					var params = "cmd=categoryCode2&contentTypeId="
							+ $('#contentTypeId option:selected').val()
							+ "&cat1=" + this.value;
					sendRequest("/TaYo/tayoapi", params, cat1chage, "GET");
				});

		$('#cat2').change(
				function() {
					var params = "cmd=categoryCode3&contentTypeId="
							+ $('#contentTypeId option:selected').val()
							+ "&cat1=" + $('#cat1 option:selected').val()
							+ "&cat2=" + this.value;
					sendRequest("/TaYo/tayoapi", params, cat2chage, "GET");
				});

		$('#btnSearch').click(function() {
			searchList('');
		});
		
		$('#linkDetail').click(function() {
			var params = "cmd=detailCommon&contentid=" + $('contentid').text();
		sendRequest("/TaYo/tayoDetailapi", params, cat2chage,"GET");
		});
		
		
	});

	//////////////////////cmd코드 보내기///////////////////////////////////////////
</script>
<body>
	<form id="searchForm" method="post" action="/guide/inforArea.do">
		<fieldset>
			<div class="tableWrap searchWrap mgNone">
				<div id="selectArea"></div>

				<table class="bbsSearch">
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="wHacki8" scope="row">관광타입</th>
							<td><select id="contentTypeId" name="arrange" title="관광타입">
									<option value="">타입선택</option>
									<option value="12">관광지</option>
									<option value="14">문화시설</option>
									<option value="15">축제공연행사</option>
									<option value="25">여행코스</option>
									<option value="28">레포츠</option>
									<option value="32">숙박</option>
									<option value="38">쇼핑</option>
									<option value="39">음식점</option>
							</select></td>
						</tr>
					</tbody>
				</table>

				<table class="bbsSearch">
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="wHacki8" scope="row">서비스분류</th>
							<td><select id="cat1" name="arrange" id="arran" title="대분류">
									<option value="" selected>대분류</option>
							</select> <select id="cat2" name="arrange" id="arran" title="중분류">
									<option value="" selected>중분류</option>
							</select> <select id="cat3" name="arrange" id="arran" title="정렬방법">
									<option value="" selected>소분류</option>
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
							<td><select id="areaCode" name="arrange" id="areaCode">
									<option value="">시도</option>
							</select> <select id="sigunguCode" name="arrange">
									<option value="">시군구</option>
							</select></td>
						</tr>
					</tbody>
				</table>


				<table class="bbsSearch">
					<colgroup>
						<col style="width: 95px;" />
						<col style="width: 861px;" />
					</colgroup>
					<tbody>
						<tr>
							<th class="last wHacki8" scope="row">검색</th>
							<td class="last">
								<div>
									<button id="btnSearch" type="button" class="btn btn-primary">검색</button>
								</div> <!-- <input type="hidden" name="mode" value="1">
									<input type="image" id="btnSearch"src="/TaYo/images/btnSearch_Blue.gif" alt="검색" /></td> -->
						</tr>
					</tbody>
				</table>
			</div>
		</fieldset>
	</form>

	<br>
	<br>

	<div class="listWrap">
		<ul id="placeList" class="galleryList">
			<!-- api 호출 내용 출력  -->
		</ul>
	</div>

	<form id="tmp" method="post" action="">
		<input type="hidden" id="cmd" name="cmd" value="tayoDetail"> 
		<input type="hidden" id="contentId" name="contentId">

	</form>


</body>
</html>