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
<script>
	/* 
	 var isfilter; */
$(function() {
	//도시버튼 추가 (글자, 이벤트)
	$.ajax({
		url : "${pageContext.request.contextPath}/tourresioncode",
		type : 'get',
		success : function(xml) {
			/* 콘솔확이용 xml 파싱*/
			xmlParser = new DOMParser(); // DOMParser console 확인용 객체 생성.
			xmlDoc = xmlParser.parseFromString(xml, "text/xml");
			console.log('-xml 파시용 데이터-');
			console.log(xml);
			/* jquery*/
			var xmlData = $(xml).find("item");//아이템 배열

			for (var i = 0; i < xmlData.length; i++) {
				var option = $('<option data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">'+ $(xmlData[i]).find("name").text() + '</option>');
				$('#sido').append(option);

				/* $('#searchForm > fieldset > div > table > tbody > tr > td >  #sido').append(
						'<option data-type="city" data="'+ $(xmlData[i]).find("code").text() + '">' + $(xmlData[i]).find("name").text() + '</option>'); */
			}
		},//end success
		error : function(err) {
			console.log(err);
		}//end error
	});//end ajax 도시버튼 추가
	
	//도시버튼 클릭 이벤트 추가(동적)// > div.allways_show >
	$(document).on("select", "#searchForm > fieldset > div > table > tbody > tr > td > #sido > option:nth-child(2) ",function() {
		console.log(this);
		var div= $(this).children();
		var data_type = $(div).attr("data-type");
		var data = $(div).attr("data");
		$.ajax({
		url : "${pageContext.request.contextPath}/tourresion",
		type : 'get',
		data:{
			city:data
		},
		success : function(xml) {
		
			parser = new DOMParser();
			xmlDoc = parser.parseFromString(xml.trim(), "text/xml");
			
			var html;
			var prevTitle = "";
			
			$("#tablebody").empty();
			
		
			$(xml).find("item").each(function() {
				var title = $(this).find("title").text();
				var addr1 = $(this).find("addr1").text();
				var addr2 = $(this).find("addr2").text();
				var readcount = $(this).find("readcount").text();
			
				if (prevTitle != title) {
					prevTitle = title;
					var image = $(this).find("firstimage2").text();
					
					
					/* html += "<tr><td width='100'><img src='" + image + "' onError=\"this.src='${pageContext.request.contextPath}/images/noImage.png'\" width='80' height='40'/></td><td><ul class='placeclass'><li class='list-group-item' style='padding: 0.3rem;' value='" + title + "'>" + title + addr2 + readcount+ "<button class='btn btn-primary' name='placebtn'>+</button></li></ul></td></tr>"; */
				 	
				 html += "<tr><td><div class='card' style='width: 70rem; display: flex;'> "
					if(image!=''){
					html += "<img src='" + image + "' onError=\"this.src='${pageContext.request.contextPath}/images/noImage.png' style='width: 400px;height: 200px;'>"
					}
					html += "<div class='card-body' style='display: inline;'>"
					html += "	<h5 class='card-title'>" + title + "</h5>"
					html += "	<p class='card-text'>"+ addr2 +"</p>"
						html += "	<p class='card-text'>" + readcount +"</p>"
							html += "	<a href=''#' class='btn btn-primary'>상세보기</a>"
							html += "</div>"
								html += "</div></td></tr>";	
								
								
			/* 				
				$("div.card>div.card-body>h5.card-title").html(title);
				$("div.card>div.card-body>p.card-text").html(addr1); */
					
					
			
				}
			});
			$("#tablebody").html(html);
			console.log(xmlDoc);
			/* jquery*/
//				console.log(xml);
		},//end success
		error : function(err) {
			console.log(err);
		}//end error
	});//end ajax 도시버튼 추가
	});	
});//end onload
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
							<td><select name="arrange" id="arran" title="관광타입"
								onchange="document.getElementById('KeyWord').value= this.options[this.selectedIndex].value">
									<option value="A">타입선택</option>
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
							<td><select name="arrange" id="arran" title="대분류">
									<option value="A" selected>대분류</option>
							</select> <select name="arrange" id="arran" title="중분류">
									<option value="A" selected>중분류</option>
							</select> <select name="arrange" id="arran" title="정렬방법">
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
							<td><select name="arrange" id="sido">
									<option value="">시도</option>
							</select> <select name="arrange" id="sigungu">
									<option value="A">시군구</option>
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
							<td class="last"><input type="hidden" name="mode" value="1">
								<input type="image" id="search"
								src="/TaYo/images/btnSearch_Blue.gif" alt="검색" /></td>
						</tr>
					</tbody>
				</table>

			</div>
		</fieldset>
	</form>






</body>
</html>