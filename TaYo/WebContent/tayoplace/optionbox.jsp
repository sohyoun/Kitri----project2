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

				//placeList
				$("#placeList").html('');

				for (var i = 0; i < item.length; i++) {

					/* html += "<tr><td><div class='card' style='width: 70rem; display: flex;'> "
					if (image != '') {
						html += "<img src='" + image + "' onError=\"this.src='${pageContext.request.contextPath}/images/noImage.png' style='width: 400px;height: 200px;'>"
					}
					html += "<div class='card-body' style='display: inline;'>"
					html += "	<h5 class='card-title'>" + title + "</h5>"
					html += "	<p class='card-text'>" + addr2 + "</p>"
					html += "	<p class='card-text'>" + readcount + "</p>"
					html += "	<a href=''#' class='btn btn-primary'>상세보기</a>"
					html += "</div>"
					html += "</div></td></tr>";

					$("#yugiList").append(html); */

					
					var option = "<tr>";
					option += "		<th style='width:50%;'>";
					option += "			<img src='"+item[i].getElementsByTagName("firstimage")[0].firstChild.data+"' style='widows: 100%; max-height:10rem; max-width:7rem; height: 10rem; width:7rem; float: left; padding: 10px;'>";
					option += "			<li><a  href='#' onClick='goDetail("+i+")'>공고번호 : "+item[i].getElementsByTagName("title")[0].firstChild.data+"</a></li>";
					option += "			<li>접 수 일  : "+item[i].getElementsByTagName("title")[0].firstChild.data+"</li>";
					option += "			<li>품     종  : "+item[i].getElementsByTagName("addr1")[0].firstChild.data+"</li>";
					option += "			<li>상     태  : "+item[i].getElementsByTagName("addr2")[0].firstChild.data+"</li>";
					option += "		</th>";
					
					i = i + 1;
					
					option += "		<th style='width:50%;'>";
					option += "			<img src='"+item[i].getElementsByTagName("firstimage")[0].firstChild.data+"' style='widows: 100%; max-height:10rem; max-width:7rem; height: 10rem; width:7rem; float: left; padding: 10px;'>";
					option += "			<li><a  href='#' onClick='goDetail("+i+")'>공고번호 : "+item[i].getElementsByTagName("title")[0].firstChild.data+"</a></li>";
					option += "			<li>접 수 일  : "+item[i].getElementsByTagName("title")[0].firstChild.data+"</li>";
					option += "			<li>품     종  : "+item[i].getElementsByTagName("addr1")[0].firstChild.data+"</li>";
					option += "			<li>상     태  : "+item[i].getElementsByTagName("addr2")[0].firstChild.data+"</li>";
					option += "		</th>";
					option += "</tr>"
					
					

					$("#placeList").append(option);

				}

			}
		}
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
									<option value="A" selected>대분류</option>
							</select> <select id="cat2" name="arrange" id="arran" title="중분류">
									<option value="A" selected>중분류</option>
							</select> <select id="cat3" name="arrange" id="arran" title="정렬방법">
									<option value="A" selected>소분류</option>
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
	<div class="card-body">
		<table class="table card-text col-xl-auto">
			<tbody id="placeList">
			</tbody>
			<!-- 게시글목록끝 -->
		</table>
	</div>
	<!-- 게시판 뷰 끝 -->
</body>
</html>