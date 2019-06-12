<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>


<style type="text/css">

/* --------------------관광명소/ 음식점/ 여행일정------------------------------ */
.common_menu {
	width: 100%;
	height: 40px;
	line-height: 40px;
	border-radius: 5px;
	background: #223b68;
	color: white;
	margin-top: 10px;
	overflow: hidden;
}

.common_menu a {
	display: block;
	/* width:370px; */
	width: 33.33%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	float: left;
	font-size: 15px;
	color: white;
	border-right: 1px solid #4e6286;
	height: 40px;
}

.common_menu a:hover {
	background: #164c88;
}

.common_menu a.on {
	background: #1a7ad9;
}

.card-img-top {
	width: 400px;
	height: 200px;
}

.card {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: row;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
}
/* --------------------관광명소/ 음식점/ 여행일정------------------------------ */
.btn-primary {
	float: right;
}

.common_menu {
	color: YELLOW;
}


.tourView .summary {clear:both;padding:25px 10px 0 10px;border-top:1px solid #000;}
</style>





<!-- 크기 맞춰주는 DIV -->
<div class="container py-xl-5 py-lg-3">
	<!-- 이 div를 해줘야 크기가 맞춰짐 -->
	<!-- 크기 맞춰주는 DIV -->

	
		<section id="content">
			<div class="tourView">
			<form id="backform" method="post"  action="/guide/inforArea.do">
				<input type="hidden" name="langtype" value="KOR"/>
				<input type="hidden" name="contenttypeid" value=""/>		
		        <input type="hidden" name="cat1" value=""/>
				<input type="hidden" name="cat2" value=""/>
				<input type="hidden" name="cat3" value=""/>				
				<input type="hidden" name="areacode" value=""/>
				<input type="hidden" name="sigungucode" value=""/>		
				<input type="hidden" name="arrange" value="A"/>
				<input type="hidden" name="pageNo" value="1"/>
				<input type="hidden" name="mode" value="listOk"/>
				<input type="hidden" name="tSearchValue" value=""/>
				<input type="hidden" name="tLangType" value=""/>
				<input type="hidden" name="tSearchType" value=""/>
				<input type="hidden" name="mapX" value=""/>
				<input type="hidden" name="mapY" value=""/>
				<input type="hidden" name="radius" value=""/>
				<input type="hidden" name="searchtxt" value=""/>
				<input type="hidden" name="eventStartDate" value=""/>
				<input type="hidden" name="eventEndDate" value=""/>
				<input type="hidden" name="stay" value=""/>
		    </form>		
			 <h3 class="heading text-capitalize ">서울 Seoul</h3>
			 
			 <!--  <div class="tabWrap  col3"> 
			     <ul class="tabul">
			     <li class="on"><a href="#common"><span>공통정보</span></a></li>        
			          <li><a href="#intro"><span>소개정보</span></a></li>  
			           <li><a href="#coinfo"><span>코스정보</span></a></li>
			  </ul>
			  </div> -->
			  <!-- 여행지 상세 선택 분류  -->
			  <div class="common_menu"> 
			     <ul class="tabul">
			     <li class="on"><a href="#common"><span>공통정보</span></a></li>        
			          <li><a href="#intro"><span>소개정보</span></a></li>  
			           <li><a href="#coinfo"><span>코스정보</span></a></li>
			  </ul>
			  </div>
			  <!-- 여행지 상세 선택 분류  -->
			  
			  <br><br>
			  
			  <div id="common" class="tabGon">
			  
			  	
		          	<p class="mainImg">
        
				         <img src="http://tong.visitkorea.or.kr/cms/resource/74/1998774_image2_1.jpg" alt="‘바다여행의 종합 세트’ 사천으로 가자 대표이미지">
     
				     </p>
		         	<!-- //mainImg -->
		         	    <div class="txtData">
					       <ul class="txtCon" tabindex="0">
	
							   
						       <form  name="dform" method="post" >
						       <input type="hidden" name="mapX" value="128.0741699711">
						       <input type="hidden" name="mapY" value="34.9247115162">  
						       <input type="hidden" name="title" value="‘바다여행의 종합 세트’ 사천으로 가자">
						       <input type="hidden" name="oper" value="area">
						     </form>
						    
						</ul>
					  </div>
			
					<br>
				  <div class="summary">
					<strong class="tit">개요</strong>
						<p>
				  	 사천의 삼천포항에 가면 바다에서 누릴 수 있는 모든 걸 경험할 수 있다. 우리나라 3대 어항의 하나인 삼천포항에서 비린내 나는 부둣가의 정취를, 주변 어시장에서 싱싱한 수산물을 구경할 수 있다. 바다를 향해 돌출한 언덕에 위치한 노산공원은 시원스레 펼쳐진 한려수도의 전망이 한눈에 들어온다. 일몰이 아름다운 실안해안도로를 따라 달리면 임진왜란 때 왜군이 쌓은 선진리왜성과 우리나라 항공우주산업의 면모를 알 수 있는 항공우주박물관이 있다.
					</p>
			  	 </div>
	</div>
	</section>




<!-- 이 div를 해줘야 크기가 맞춰짐 -->
</div>
<!-- 이 div를 해줘야 크기가 맞춰짐 -->








<%@ include file="/temp/footer.jsp"%>
