<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<style>




/* ==========================================================================
   tab-style
   ========================================================================== */
#content .tabWrap,
#content .tabWrap01 { overflow:hidden; margin:0 0 25px 0 !important; }
	#content .tabWrap.col2 li { width:50% }
	#content .tabWrap.col3 li:first-child { width:34%; }
	#content .tabWrap.col3 li { width:33% }
	#content .tabWrap.col4 li { width:25% }
	#content .tabWrap.col5 li { width:20% }
	#content .tabWrap.col6 li { width:16% }
	#content .tabWrap.col6 li.first,
	#content .tabWrap.col6 li.last { width:18% }
	.ie7 #content .tabWrap.col6 li.first,
	.ie7 #content .tabWrap.col6 li.last { width:17% }
#content .tabWrap li { float:left; width:100%; margin-top:0px !important;}
#content .tabWrap li:first-child a span { background:url('../images/common/bg/bgTabOff_first.gif') left top no-repeat; }
#content .tabWrap li a { display:block; width:100%; height:45px; font-size:13px; text-align:center; color:#4f4f4f; background:url('../images/common/bg/bgTabOff.gif') right top no-repeat; text-decoration:none; }
#content .tabWrap li a span { display:block; height:35px; padding-top:8px; }

span {}
#content .tabWrap li a:hover,
#content .tabWrap li a:active,
#content .tabWrap li a:focus,
#content .tabWrap li.on a { color:#fff; background:url('../images/common/bg/bgTabOn.gif') center top no-repeat; }
#content .tabWrap li a:hover span,
#content .tabWrap li a:active span,
#content .tabWrap li a:focus span,
#content .tabWrap li.on a span { background:url('../images/common/bg/tabOn.gif') center bottom no-repeat; }

.tabCon,
.tabCon01 { display:none; }


</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<section id="content">
		<div class="tourView">
			<form id="backform" method="post" action="/guide/inforArea.do">
				<input type="hidden" name="langtype" value="KOR" /> <input
					type="hidden" name="contenttypeid" value="" /> <input
					type="hidden" name="cat1" value="" /> <input type="hidden"
					name="cat2" value="" /> <input type="hidden" name="cat3" value="" />
				<input type="hidden" name="areacode" value="" /> <input
					type="hidden" name="sigungucode" value="" /> <input type="hidden"
					name="arrange" value="A" /> <input type="hidden" name="pageNo"
					value="1" /> <input type="hidden" name="mode" value="listOk" /> <input
					type="hidden" name="tSearchValue" value="" /> <input type="hidden"
					name="tLangType" value="" /> <input type="hidden"
					name="tSearchType" value="" /> <input type="hidden" name="mapX"
					value="" /> <input type="hidden" name="mapY" value="" /> <input
					type="hidden" name="radius" value="" /> <input type="hidden"
					name="searchtxt" value="" /> <input type="hidden"
					name="eventStartDate" value="" /> <input type="hidden"
					name="eventEndDate" value="" /> <input type="hidden" name="stay"
					value="" />
			</form>
			<h2>‘바다여행의 종합 세트’ 사천으로 가자</h2>
			<div class="tabWrap  col3">
				<ul class="tabul">
					<li class="on"><a href="#common"><span>공통정보</span></a></li>
					<li><a href="#intro"><span>소개정보</span></a></li>


					<li><a href="#coinfo"><span>코스정보</span></a></li>






				</ul>
			</div>
			<div id="common" class="tabGon">


				<p class="mainImg">


					<img
						src="http://tong.visitkorea.or.kr/cms/resource/74/1998774_image2_1.jpg"
						alt="‘바다여행의 종합 세트’ 사천으로 가자 대표이미지">




				</p>
				<!-- //mainImg -->
				<div class="txtData">
					<ul class="txtCon" tabindex="0">






						<form name="dform" method="post">
							<input type="hidden" name="mapX" value="128.0741699711">
							<input type="hidden" name="mapY" value="34.9247115162"> <input
								type="hidden" name="title" value="‘바다여행의 종합 세트’ 사천으로 가자">
							<input type="hidden" name="oper" value="area"> <span
								class="btnMap"><input type="image"
								src="/static/images/common/btn/btnMap.gif" title="새창 열림"
								alt="지도보기" onclick="javascript:viewMap();" /></span>
						</form>

					</ul>
				</div>

				<div class="summary">
					<strong class="tit">개요</strong>
					<p>사천의 삼천포항에 가면 바다에서 누릴 수 있는 모든 걸 경험할 수 있다. 우리나라 3대 어항의 하나인
						삼천포항에서 비린내 나는 부둣가의 정취를, 주변 어시장에서 싱싱한 수산물을 구경할 수 있다. 바다를 향해 돌출한 언덕에
						위치한 노산공원은 시원스레 펼쳐진 한려수도의 전망이 한눈에 들어온다. 일몰이 아름다운 실안해안도로를 따라 달리면
						임진왜란 때 왜군이 쌓은 선진리왜성과 우리나라 항공우주산업의 면모를 알 수 있는 항공우주박물관이 있다.</p>
				</div>
</body>
</html>