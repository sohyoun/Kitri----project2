<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp" %>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
.form-inline {
	position: relative;
	left: 450px;
	top: 100px;
}
.btn-group{
	width: 100000000px;
	height: 40px;
}





.area_white{
	width:100%;
	padding:40px 0px 30px 0px;
}

.area_title{
	width:100%;
	text-align:center;
	color:#555555;
	font-size:20px;
	padding-bottom:30px;
	font-weight:bold;
}

.travel_box{
	background:white;
	border-left:1px solid #cfcfcf;
	border-right:1px solid #cfcfcf;
	border-bottom:1px solid #cfcfcf;
}

.travel_section{
	border-top:1px solid #cfcfcf;
	height:55px;
	line-height:55px;
	width:100%;
}

.travel_left{
	float:left;
	border-right:1px solid #cfcfcf;
	height:55px;
	text-align:center;
	width:12%;
	font-weight:bold;
	color:#555555;
}

.travel_a_city{
	display:block;
	width:11%;
	float:left;
	height:55px;
	font-size:14px;
	color:#555555;
	line-height:55px;
	text-align:center;
}

.travel_city{
	float:left;
	width:12.5%;
	height:55px;
	line-height:55px;
	text-align:center;
	cursor:pointer;
	display:block;
}

.travel_city div{
	display:inline-block;
	margin:0 auto;
}

.travel_city span{
	float:left;
	margin-right:4px;
	display:block;
	color:#555555;
	font-size:14px;
}

.travel_city .city_arraw{
	float:left;
}

.travel_city.on span{
	color:#1a7ad9;
	font-weight:bold;
}

.travel_hide{
	line-height:55px;
	border-top:1px dotted #c8c8ca;
	width:100%;
	background:#fafafa;
	display:none;
}

.travel_ar{
	width:20%;
	height:55px;
	line-height:55px;
	display:block;
	text-align:center;
	float:left;
	color:#808080;
	font-size:14px;
}



</style>



<!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">

<nav class="navbar navbar-expand-sm">
  <form class="form-inline" action="/action_page.php">
    <input class="form-control mr-sm-2" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Search</button>
  </form>
</nav>

	</div>
</section>
<!-- //banner -->





<div class="containerbutton">
  <div class="btn-group">
    <button type="button" class="btn btn-primary">Apple</button>
    <button type="button" class="btn btn-primary">Samsung</button>
    <div class="btn-group">
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> Sony</button>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Tablet</a>
        <a class="dropdown-item" href="#">Smartphone</a>
      </div>
    </div>
  </div>
</div>





<div class="area_silver">
	<div class="wrap">
		<div class="area_title">
			국내 여행지		</div>
		<div class="travel_box">
			<div class="travel_section">
				<div class="travel_left">
					주요도시				</div>
				<a href="/ko/city/seoul_310" class="travel_a_city">
					서울
				</a>
				<a href="/ko/city/jeju_312" class="travel_a_city">
					제주
				</a>
				<a href="/ko/city/busan_311" class="travel_a_city">
					부산
				</a>
				<a href="/ko/city/gyeongju-si_10995" class="travel_a_city">
					경주
				</a>
				<a href="/ko/city/yangpyeong-gun_10920" class="travel_a_city">
					양평
				</a>
				<a href="/ko/city/taean-gun_10991" class="travel_a_city">
					태안
				</a>
				<a href="/ko/city/jinju-si_11036" class="travel_a_city">
					진주
				</a>
				<a href="/ko/city/gangneung-si_10933" class="travel_a_city">
					강릉
				</a>
				<div class="clear"></div>
			</div>
			<div class="travel_section pa10">
				<div class="travel_city" data-on="off" data-show="001">
					<div>
						<span>강원도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="travel_city" data-on="off" data-show="002">
					<div>
						<span>경기도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="travel_city" data-on="off" data-show="003">
					<div>
						<span>경상남도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="travel_city" data-on="off" data-show="004">
					<div>
						<span>경상북도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<a href="/ko/city/gwangju_10205" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>광주</span>
						<div class="clear"></div>
					</div>
				</a>
				<a href="/ko/city/daegu_10204" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>대구</span>
						<div class="clear"></div>
					</div>
				</a>
				<a href="/ko/city/daejeon_10203" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>대전</span>
						<div class="clear"></div>
					</div>
				</a>
				<a href="/ko/city/busan_311" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>부산</span>
						<div class="clear"></div>
					</div>
				</a>
				<div class="clear"></div>
			</div>

			<div class="travel_hide" data-id="001">
				<a href="/ko/city/gangneung-si_10933" class="travel_ar">
					강릉
				</a>
				<a href="/ko/city/goseong-gun_10934" class="travel_ar">
					고성
				</a>
				<a href="/ko/city/donghae-si_10935" class="travel_ar">
					동해
				</a>
				<a href="/ko/city/samcheok-si_10936" class="travel_ar">
					삼척
				</a>
				<a href="/ko/city/sokcho-si_10937" class="travel_ar">
					속초
				</a>
				<a href="/ko/city/yanggu-gun_10938" class="travel_ar">
					양구
				</a>
				<a href="/ko/city/yangyang-gun_10939" class="travel_ar">
					양양
				</a>
				<a href="/ko/city/yeongwol-gun_10940" class="travel_ar">
					영월
				</a>
				<a href="/ko/city/wonju-si_10941" class="travel_ar">
					원주
				</a>
				<a href="/ko/city/inje-gun_10942" class="travel_ar">
					인제
				</a>
				<a href="/ko/city/jeongseon-gun_10943" class="travel_ar">
					정선
				</a>
				<a href="/ko/city/cheorwon-gun_10944" class="travel_ar">
					철원
				</a>
				<a href="/ko/city/chuncheon-si_10945" class="travel_ar">
					춘천
				</a>
				<a href="/ko/city/taebaek-si_10946" class="travel_ar">
					태백
				</a>
				<a href="/ko/city/pyeongchang-gun_10947" class="travel_ar">
					평창
				</a>
				<a href="/ko/city/hongcheon-gun_10948" class="travel_ar">
					홍천
				</a>
				<a href="/ko/city/hwacheon-gun_10949" class="travel_ar">
					화천
				</a>
				<a href="/ko/city/hoengseong-gun_10950" class="travel_ar">
					횡성
				</a>
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="002">
				<a href="/ko/city/gapyeong-gun_10902" class="travel_ar">
					가평
				</a>
				<a href="/ko/city/goyang-si_10903" class="travel_ar">
					고양
				</a>
				<a href="/ko/city/gwacheon-si_10904" class="travel_ar">
					과천
				</a>
				<a href="/ko/city/gwangmyeong-si_10905" class="travel_ar">
					광명
				</a>
				<a href="/ko/city/gwangju-si_10906" class="travel_ar">
					광주
				</a>
				<a href="/ko/city/guri-si_10907" class="travel_ar">
					구리
				</a>
				<a href="/ko/city/gunpo-si_10908" class="travel_ar">
					군포
				</a>
				<a href="/ko/city/gimpo-si_10909" class="travel_ar">
					김포
				</a>
				<a href="/ko/city/namyangju-si_10910" class="travel_ar">
					남양주
				</a>
				<a href="/ko/city/dongducheon-si_10911" class="travel_ar">
					동두천
				</a>
				<a href="/ko/city/bucheon-si_10912" class="travel_ar">
					부천
				</a>
				<a href="/ko/city/seongnam-si_10913" class="travel_ar">
					성남
				</a>
				<a href="/ko/city/suwon-si_10914" class="travel_ar">
					수원
				</a>
				<a href="/ko/city/siheung-si_10915" class="travel_ar">
					시흥
				</a>
				<a href="/ko/city/kristiansand_10631" class="travel_ar">
					안산
				</a>
				<a href="/ko/city/anseong-si_10917" class="travel_ar">
					안성
				</a>
				<a href="/ko/city/anyang-si_10918" class="travel_ar">
					안양
				</a>
				<a href="/ko/city/yangju-si_10919" class="travel_ar">
					양주
				</a>
				<a href="/ko/city/yangpyeong-gun_10920" class="travel_ar">
					양평
				</a>
				<a href="/ko/city/yeoju-si_10921" class="travel_ar">
					여주
				</a>
				<a href="/ko/city/yeoncheon-gun_10922" class="travel_ar">
					연천
				</a>
				<a href="/ko/city/osan-si_10923" class="travel_ar">
					오산
				</a>
				<a href="/ko/city/yongin-si_10924" class="travel_ar">
					용인
				</a>
				<a href="/ko/city/uiwang-si_10925" class="travel_ar">
					의왕
				</a>
				<a href="/ko/city/uijeongbu-si_10926" class="travel_ar">
					의정부
				</a>
				<a href="/ko/city/icheon-si_10927" class="travel_ar">
					이천
				</a>
				<a href="/ko/city/paju-si_10928" class="travel_ar">
					파주
				</a>
				<a href="/ko/city/pyeongtaek-si_10929" class="travel_ar">
					평택
				</a>
				<a href="/ko/city/pocheon-si_10930" class="travel_ar">
					포천
				</a>
				<a href="/ko/city/hanam-si_10931" class="travel_ar">
					하남
				</a>
				<a href="/ko/city/hwaseong-si_10932" class="travel_ar">
					화성
				</a>
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="003">
				<a href="/ko/city/geoje-si_11025" class="travel_ar">
					거제
				</a>
				<a href="/ko/city/geochang-gun_11026" class="travel_ar">
					거창
				</a>
				<a href="/ko/city/goseong-gun_11027" class="travel_ar">
					고성
				</a>
				<a href="/ko/city/gimhae-si_11028" class="travel_ar">
					김해
				</a>
				<a href="/ko/city/namhae-gun_11029" class="travel_ar">
					남해
				</a>
				<a href="/ko/city/masan-si_11030" class="travel_ar">
					마산
				</a>
				<a href="/ko/city/miryang-si_11031" class="travel_ar">
					밀양
				</a>
				<a href="/ko/city/sacheon-si_11032" class="travel_ar">
					사천
				</a>
				<a href="/ko/city/sancheong-gun_11033" class="travel_ar">
					산청
				</a>
				<a href="/ko/city/yangsan-si_11034" class="travel_ar">
					양산
				</a>
				<a href="/ko/city/uiryeong-gun_11035" class="travel_ar">
					의령
				</a>
				<a href="/ko/city/jinju-si_11036" class="travel_ar">
					진주
				</a>
				<a href="/ko/city/jinhae-si_11037" class="travel_ar">
					진해
				</a>
				<a href="/ko/city/changnyeong-gun_11038" class="travel_ar">
					창녕
				</a>
				<a href="/ko/city/changwon-si_11039" class="travel_ar">
					창원
				</a>
				<a href="/ko/city/tongyeong-si_11040" class="travel_ar">
					통영
				</a>
				<a href="/ko/city/hadong-gun_11041" class="travel_ar">
					하동
				</a>
				<a href="/ko/city/haman-gun_11042" class="travel_ar">
					함안
				</a>
				<a href="/ko/city/hamyang-gun_11043" class="travel_ar">
					함양
				</a>
				<a href="/ko/city/hapcheon-gun_11044" class="travel_ar">
					합천
				</a>
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="004">
				<a href="/ko/city/gyeongsan-si_10994" class="travel_ar">
					경산
				</a>
				<a href="/ko/city/gyeongju-si_10995" class="travel_ar">
					경주
				</a>
				<a href="/ko/city/goryeong-gun_10996" class="travel_ar">
					고령
				</a>
				<a href="/ko/city/gumi-si_10997" class="travel_ar">
					구미
				</a>
				<a href="/ko/city/gunwi-gun_10998" class="travel_ar">
					군위
				</a>
				<a href="/ko/city/gimcheon-si_10999" class="travel_ar">
					김천
				</a>
				<a href="/ko/city/mungyeong-si_11000" class="travel_ar">
					문경
				</a>
				<a href="/ko/city/bonghwa-gun_11001" class="travel_ar">
					봉화
				</a>
				<a href="/ko/city/sangju-si_11002" class="travel_ar">
					상주
				</a>
				<a href="/ko/city/seongju-gun_11003" class="travel_ar">
					성주
				</a>
				<a href="/ko/city/andong-si_11004" class="travel_ar">
					안동
				</a>
				<a href="/ko/city/yeongdeok-gun_11005" class="travel_ar">
					영덕
				</a>
				<a href="/ko/city/yeongyang-gun_11006" class="travel_ar">
					영양
				</a>
				<a href="/ko/city/yeongju-si_11007" class="travel_ar">
					영주
				</a>
				<a href="/ko/city/yeongcheon-si_11008" class="travel_ar">
					영천
				</a>
				<a href="/ko/city/yecheon-gun_11009" class="travel_ar">
					예천
				</a>
				<a href="/ko/city/ulleung-gun_11010" class="travel_ar">
					울릉
				</a>
				<a href="/ko/city/uljin-gun_11011" class="travel_ar">
					울진
				</a>
				<a href="/ko/city/uiseong-gun_11012" class="travel_ar">
					의성
				</a>
				<a href="/ko/city/cheongdo-gun_11013" class="travel_ar">
					청도
				</a>
				<a href="/ko/city/cheongsong-gun_11014" class="travel_ar">
					청송
				</a>
				<a href="/ko/city/chilgok-gun_11015" class="travel_ar">
					칠곡
				</a>
				<a href="/ko/city/pohang-si_11016" class="travel_ar">
					포항
				</a>
				<div class="clear"></div>
			</div>

			<div class="travel_section">
				<a href="/ko/city/seoul_310" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>서울</span>
						<div class="clear"></div>
					</div>
				</a>
				<a href="/ko/city/ulsan_10206" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>울산</span>
						<div class="clear"></div>
					</div>
				</a>
				<a href="/ko/city/incheon_10202" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>인천</span>
						<div class="clear"></div>
					</div>
				</a>
				<div class="travel_city" data-on="off" data-show="005">
					<div>
						<span>전라남도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="travel_city" data-on="off" data-show="006">
					<div>
						<span>전라북도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<a href="/ko/city/jeju_312" class="travel_city" data-on="off" data-show="link">
					<div>
						<span>제주도</span>
						<div class="clear"></div>
					</div>
				</a>
				<div class="travel_city" data-on="off" data-show="007">
					<div>
						<span>충청남도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="travel_city" data-on="off" data-show="008">
					<div>
						<span>충청북도</span>
						<img src="/res/img/area/area_arrow.gif" alt="" class="city_arrow" />
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="005">
				<a href="/ko/city/gangjin-gun_11071" class="travel_ar">
					강진
				</a>
				<a href="/ko/city/goheung-gun_11072" class="travel_ar">
					고흥
				</a>
				<a href="/ko/city/gokseong-gun_11073" class="travel_ar">
					곡성
				</a>
				<a href="/ko/city/gwangyang-si_11074" class="travel_ar">
					광양
				</a>
				<a href="/ko/city/gurye-gun_11075" class="travel_ar">
					구례
				</a>
				<a href="/ko/city/naju-si_11076" class="travel_ar">
					나주
				</a>
				<a href="/ko/city/damyang-gun_11077" class="travel_ar">
					담양
				</a>
				<a href="/ko/city/mokpo-si_11078" class="travel_ar">
					목포
				</a>
				<a href="/ko/city/muan-gun_11079" class="travel_ar">
					무안
				</a>
				<a href="/ko/city/boseong-gun_11080" class="travel_ar">
					보성
				</a>
				<a href="/ko/city/suncheon-si_11081" class="travel_ar">
					순천
				</a>
				<a href="/ko/city/sinan-gun_11082" class="travel_ar">
					신안
				</a>
				<a href="/ko/city/yeosu-si_11083" class="travel_ar">
					여수
				</a>
				<a href="/ko/city/yeonggwang-gun_11084" class="travel_ar">
					영광
				</a>
				<a href="/ko/city/yeongam-gun_11085" class="travel_ar">
					영암
				</a>
				<a href="/ko/city/wando-gun_11086" class="travel_ar">
					완도
				</a>
				<a href="/ko/city/jangseong-gun_11087" class="travel_ar">
					장성
				</a>
				<a href="/ko/city/jangheung-gun_11088" class="travel_ar">
					장흥
				</a>
				<a href="/ko/city/jindo-gun_11089" class="travel_ar">
					진도
				</a>
				<a href="/ko/city/hampyeong-gun_11090" class="travel_ar">
					함평
				</a>
				<a href="/ko/city/haenam-gun_11091" class="travel_ar">
					해남
				</a>
				<a href="/ko/city/hwasun-gun_11092" class="travel_ar">
					화순
				</a>
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="006">
				<a href="/ko/city/gochang-gun_11056" class="travel_ar">
					고창
				</a>
				<a href="/ko/city/gunsan-si_11057" class="travel_ar">
					군산
				</a>
				<a href="/ko/city/gimje-si_11058" class="travel_ar">
					김제
				</a>
				<a href="/ko/city/namwon-si_11059" class="travel_ar">
					남원
				</a>
				<a href="/ko/city/muju-gun_11060" class="travel_ar">
					무주
				</a>
				<a href="/ko/city/buan-gun_11061" class="travel_ar">
					부안
				</a>
				<a href="/ko/city/sunchang-gun_11062" class="travel_ar">
					순창
				</a>
				<a href="/ko/city/wanju-gun_11063" class="travel_ar">
					완주
				</a>
				<a href="/ko/city/iksan-si_11064" class="travel_ar">
					익산
				</a>
				<a href="/ko/city/imsil-gun_11065" class="travel_ar">
					임실
				</a>
				<a href="/ko/city/jangsu-gun_11066" class="travel_ar">
					장수
				</a>
				<a href="/ko/city/jeonju-si_11067" class="travel_ar">
					전주
				</a>
				<a href="/ko/city/jeongeup-si_11068" class="travel_ar">
					정읍
				</a>
				<a href="/ko/city/jinan-gun_11069" class="travel_ar">
					진안
				</a>		
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="007">
				<a href="/ko/city/gongju-si_10979" class="travel_ar">
					공주
				</a>
				<a href="/ko/city/geumsan-gun_10980" class="travel_ar">
					금산
				</a>
				<a href="/ko/city/nonsan-si_10981" class="travel_ar">
					논산
				</a>
				<a href="/ko/city/dangjin-si_10982" class="travel_ar">
					당진
				</a>
				<a href="/ko/city/boryeong-si_10983" class="travel_ar">
					보령
				</a>
				<a href="/ko/city/buyeo-gun_10984" class="travel_ar">
					부여
				</a>
				<a href="/ko/city/seosan-si_10985" class="travel_ar">
					서산
				</a>
				<a href="/ko/city/seocheon-gun_10986" class="travel_ar">
					서천
				</a>
				<a href="/ko/city/asan-si_10987" class="travel_ar">
					아산
				</a>
				<a href="/ko/city/yesan-gun_10988" class="travel_ar">
					예산
				</a>
				<a href="/ko/city/cheonan-si_10989" class="travel_ar">
					천안
				</a>
				<a href="/ko/city/cheongyang-gun_10990" class="travel_ar">
					청양
				</a>
				<a href="/ko/city/taean-gun_10991" class="travel_ar">
					태안
				</a>
				<a href="/ko/city/hongseong-gun_10992" class="travel_ar">
					홍성
				</a>
				<a href="/ko/city/gyeryong-si_10993" class="travel_ar">
					계룡
				</a>	
				<div class="clear"></div>
			</div>
			<div class="travel_hide" data-id="008">
				<a href="/ko/city/goesan-gun_10964" class="travel_ar">
					괴산
				</a>
				<a href="/ko/city/danyang-gun_10965" class="travel_ar">
					단양
				</a>
				<a href="/ko/city/boeun-gun_10966" class="travel_ar">
					보은
				</a>
				<a href="/ko/city/yeongdong-gun_10967" class="travel_ar">
					영동
				</a>
				<a href="/ko/city/okcheon-gun_10968" class="travel_ar">
					옥천
				</a>
				<a href="/ko/city/eumseong-gun_10969" class="travel_ar">
					음성
				</a>
				<a href="/ko/city/jecheon-si_10970" class="travel_ar">
					제천
				</a>
				<a href="/ko/city/jincheon-gun_10971" class="travel_ar">
					진천
				</a>
				<a href="/ko/city/cheongwon-gun_10972" class="travel_ar">
					청원
				</a>
				<a href="/ko/city/cheongju-si_10973" class="travel_ar">
					청주
				</a>
				<a href="/ko/city/chungju-si_10974" class="travel_ar">
					충주
				</a>
				<a href="/ko/city/jeungpyeong-gun_10975" class="travel_ar">
					증평
				</a>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>





<!-- destinations -->
<section class="destinations py-5" id="destinations">
	<div class="container py-xl-5 py-lg-3">
		<h3 class="heading text-capitalize text-center"> 인기 여행지 BEST</h3>
		<p class="text mt-2 mb-5 text-center">타요인들의 가장 많은 좋아요를 받은 여행지입니다. </p>
		<div class="row inner-sec-w3layouts-w3pvt-lauinfo">
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">서울</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp1.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>경복궁</h4>
						<a href="booking.html">자세히보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center">
				<h4 class="destination mb-3">담양</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp2_2.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>메타세콰이어길</h4>
						<a href="booking.html">자세히보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">부산</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp3.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>감천문화마을</h4>
						<a href="">자세히보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-6 destinations-grids text-center mt-md-0 mt-4">
				<h4 class="destination mb-3">전주</h4>
				<div class="image-position position-relative">
					<img src="/TaYo/images/tp4.jpg" class="img-fluid" alt="">
					<div class="rating">
						<ul>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
							<li><span class="fa fa-star"></span></li>
						</ul>
					</div>
				</div>
				<div class="destinations-info">
					<div class="caption mb-lg-3">
						<h4>한옥마을</h4>
						<a href="">자세히보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- destinations -->




<div class="containerbutton">
  <div class="btn-group">
    <button type="button" class="btn btn-primary btn-lg">Large</button>
  <button type="button" class="btn btn-primary btn-lg">Large</button>
    <button type="button" class="btn btn-primary btn-lg">Large</button>
      </div>
    </div>
  </div>
</div>

<button type="button" class="btn btn-primary active">Active Primary</button>
<button type="button" class="btn btn-primary active" >Disabled Primary</button>
<a href="#" class="btn btn-primary disabled">Disabled Link</a>


<br>







<%@ include file="/temp/footer.jsp" %>