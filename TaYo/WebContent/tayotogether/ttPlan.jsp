<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp"%>
<section class="packages py-5">
	<div class="container py-lg-4 py-sm-3">
	<div class="twplandetail">
		<div class="pdheader">
		<div class="pdheaderdetail">
		<div class="pdheaderdetailcontent">
			<div class="pname">다 함께 부산 먹방여행!!</div>
			<div class="pcontent">" 신나게 떠나봅시다 "</div>
			<div class="ptime">2019.05.17~2019.05.20 (3)</div>
			<div class="twppeople">정원 : 25/30</div>
			<div class="pleader"><span class="fa fa-user-circle"> Kkiruk</div>
		</div>
		</div>
		</div>
		<div class="pdmenu">
		<ul class="nav nav-tabs" role="tablist">
   			<li class="nav-item">
     			<a class="nav-link active" data-toggle="tab" href="#home">개요</a>
    		</li>
    		<li class="nav-item">
     			<a class="nav-link" data-toggle="tab" href="#menu1">일정표</a>
    		</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#menu2">지도</a>
   			</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#menu3">댓글</a>
   			</li>
   			<div class="joinbtnlist">
		<%!int twBtn = 1; %>
		<%if(twBtn == 1) { %>
   			<li>
				<button type="button" class="btn btn-primary">가입신청</button>
   			</li>
		<%} else if(twBtn ==2){ %>
   			<li>
				<button type="button" class="btn btn-success">가입신청중</button>
   			</li>
		<%} else { %>
   			<li>
				<button type="button" class="btn btn-danger">가입탈퇴</button>
   			</li>
		<%} %>
   			<li>
				<button type="button" class="btn btn-secondary">문의하기</button>
   			</li>
			</div>
 		</ul>
		</div>
		<div class="tab-content">
    		<div id="home" class="container tab-pane active"><br>
    		<div class="daymap"><div class="daymapcontent">Map</div></div>
    		<div class="daycontent">
      			<div class="daytitle">
      				<div class="daynum">DAY1</div>
      				<div class="daytitlecontent"><div class="daydate">2015.08.09 (일)</div><div class="daycplace">부산</div></div>
      			</div>
      			<div class="daydetail">
      				<div class="daydetailnum"><span class="daydetailnumcont">1</span></div>
      				<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
      				<div class="daydetailcontent">서울역 모임<span class="badge">버스역</span></div>
      				<div class="daydetailfa"><span class="fa fa-map-marker">  <span class="fa fa-info-circle"></div>
      				<div>[소요시간] 장안동에서 인천국제공항 공항철도까지 2시간 소요 -12:05 공항리무진</div>
      				<div>[도착 예정시간] 14:00</div>
      				<div>[예상비용] 점심 15,000원</div>
					<div>[체크리스트]</div>
      			</div>
      			<div>추천경로</div>
      			<div class="daydetail">
      				<div class="daydetailnum"><span class="daydetailnumcont">2</span></div>
      				<div class="daydetailimg"><img src="/TaYo/images/p2.jpg"></div>
      				<div class="daydetailcontent">부산역 도착  </div>
      			</div>
      		</div>	
    		</div>
    		<div id="menu1" class="container tab-pane fade"><br>
      			<h3>Menu 1</h3>
      			<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
   	 		</div>
    		<div id="menu2" class="container tab-pane fade"><br>
      			<h3>Menu 2</h3>
      			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    		</div>
    		<div id="menu3" class="container tab-pane fade"><br>
      			<h3>Menu 3</h3>
      			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    		</div>
  		</div>
	</div>
	</div>
</section>
<div class="rrrrrrr">
</div>
<%@ include file="/temp/footer.jsp"%>