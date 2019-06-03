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
     			<a class="nav-link active" data-toggle="tab" href="#Overall">개요</a>
    		</li>
    		<li class="nav-item">
     			<a class="nav-link" data-toggle="tab" href="#schedule">일정표</a>
    		</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#map">지도</a>
   			</li>
   			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#question">문의게시판</a>
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
    		<div id="Overall" class="container tab-pane active"><br>
    				<%@ include file="/tayotogether/ttOverall.jsp"%>
    		</div>
    		<div id="schedule" class="container tab-pane fade"><br>
      			<%@ include file="/tayotogether/ttSchedule.jsp"%>
   	 		</div>
    		<div id="map" class="container tab-pane fade"><br>
      			<%@ include file="/tayotogether/ttMap.jsp"%>
    		</div>
    		<div id="question" class="container tab-pane fade"><br>
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