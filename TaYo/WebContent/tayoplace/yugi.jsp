<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Bubbly - Boootstrap 4 Admin template by Bootstrapious.com</title>
<%-- <%@ include file="/template/default_link.jsp" %> --%>
<%request.setCharacterEncoding("UTF-8");%>
<script src="/plzdaengs/board/js/httpRequest.js"></script>
<script src="/plzdaengs/board/js/bootstrap-datepicker.js"></script>
<script src="/plzdaengs/board/js/bootstrap-datepicker.kr.js"></script>
<link rel="stylesheet" href="/plzdaengs/board/css/datepicker3.css">
</head>
<script type="text/javascript">
var eleTmep;
$(document).ready(function() {//
	
	var params = "cmd=sido";
	sendRequest("/plzdaengs/yugi",params,sidoResult,"GET");
	
	$("#bgnde").datepicker({
		format : "yyyy-mm-dd",
		calendarWeeks : false,
		autoclose : true,
		todayHighlight : false,
		language : "kr",
		useCurrent : false,
		endDate : new Date()
		});
	
	$("#endde").datepicker({
		format : "yyyy-mm-dd",
		calendarWeeks : false,
		autoclose : true,
		todayHighlight : false,
		language : "kr",
		useCurrent : false,
		endDate : new Date()
		})
	
	$(".calendar-icon").click(function(){
		var target = $(this).attr("target");
		$("#"+target).datepicker().focus();
	});
	
	
	$("#bgnde").datepicker('setDate','-1m');
	
	$("#endde").datepicker('setDate','today');
	
	
});
function getRecentDate(){
    var dt = new Date();
 
    var recentYear = dt.getFullYear();
    var recentMonth = dt.getMonth() + 1;
    var recentDay = dt.getDate();
 
    if(recentMonth < 10) recentMonth = "0" + recentMonth;
    if(recentDay < 10) recentDay = "0" + recentDay;
 
    return recentYear + "-" + recentMonth + "-" + recentDay;
}
function sidoResult(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			
			var result = httpRequest.responseXML;
			var item = result.getElementsByTagName("item");
			
			for(var i = 0; i < item.length; i++) {
				var option = $("<option value='"+item[i].getElementsByTagName("orgCd")[0].firstChild.data+"'>"+item[i].getElementsByTagName("orgdownNm")[0].firstChild.data+"</option>");
                $('#sido').append(option);
			}	
			
			searchList('');
		}
	}
}
function sidochage(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			
			var result = httpRequest.responseXML;
			var item = result.getElementsByTagName("item");
			
			$("select[id='sigungu'] option").remove();
			$('#sigungu').append("<option value=''>시군구</option>");
			
			for(var i = 0; i < item.length; i++) {
				var option = $("<option value='"+item[i].getElementsByTagName("orgCd")[0].firstChild.data+"'>"+item[i].getElementsByTagName("orgdownNm")[0].firstChild.data+"</option>");
                $('#sigungu').append(option);
			}	
			
		}
	}
}
function sigunguchage(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			
			var result = httpRequest.responseXML;
			var item = result.getElementsByTagName("item");
			$("select[id='shelter'] option").remove();
			$('#shelter').append("<option value=''>보호센터</option>");
			
			for(var i = 0; i < item.length; i++) {
				var option = $("<option value='"+item[i].getElementsByTagName("careRegNo")[0].firstChild.data+"'>"+item[i].getElementsByTagName("careNm")[0].firstChild.data+"</option>");
                $('#shelter').append(option);
			}	
			
		}
	}
}
function kinduchage(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			var result = httpRequest.responseXML;
			var item = result.getElementsByTagName("item");
			$("select[id='kindDetail'] option").remove();
			$('#kindDetail').append("<option value=''>품종(중)</option>");
			
			for(var i = 0; i < item.length; i++) {
				var option = $("<option value='"+item[i].getElementsByTagName("kindCd")[0].firstChild.data+"'>"+item[i].getElementsByTagName("KNm")[0].firstChild.data+"</option>");
                $('#kindDetail').append(option);
			}	
			
		}
	}
}
function serchResult(){
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			var result = httpRequest.responseXML;
			var item = result.getElementsByTagName("item");
			
			var pageNo = result.getElementsByTagName("pageNo");
			var totalCount = result.getElementsByTagName("totalCount");
			eleTmep = item;
			
			//yugiList
			$("#yugiList").html('');
			
			for(var i = 0; i < item.length; i++) {
			
				var option = "<tr>";
					option += "		<th style='width:50%;'>";
					option += "			<img src='"+item[i].getElementsByTagName("filename")[0].firstChild.data+"' style='widows: 100%; max-height:10rem; max-width:7rem; height: 10rem; width:7rem; float: left; padding: 10px;'>";
					option += "			<li><a  href='#' onClick='goDetail("+i+")'>공고번호 : "+item[i].getElementsByTagName("noticeNo")[0].firstChild.data+"</a></li>";
					option += "			<li>접 수 일  : "+item[i].getElementsByTagName("happenDt")[0].firstChild.data+"</li>";
					option += "			<li>품     종  : "+item[i].getElementsByTagName("kindCd")[0].firstChild.data+"</li>";
					option += "			<li>상     태  : "+item[i].getElementsByTagName("processState")[0].firstChild.data+"</li>";
					option += "		</th>";
					
					i = i + 1;
					
					option += "		<th style='width:50%;'>";
					option += "			<img src='"+item[i].getElementsByTagName("filename")[0].firstChild.data+"' style='widows: 100%; max-height:10rem; max-width:7rem; height: 10rem; width:7rem; float: left; padding: 10px;'>";
					option += "			<li><a  href='#' onClick='goDetail("+i+")'>공고번호 "+item[i].getElementsByTagName("noticeNo")[0].firstChild.data+"</a></li>";
					option += "			<li>접 수 일  : "+item[i].getElementsByTagName("happenDt")[0].firstChild.data+"</li>";
					option += "			<li>품     종  : "+item[i].getElementsByTagName("kindCd")[0].firstChild.data+"</li>";
					option += "			<li>상     태  : "+item[i].getElementsByTagName("processState")[0].firstChild.data+"</li>";
					option += "		</th>";
					option += "</tr>"
					
					
				
				$("#yugiList").append(option);
				
			}	
			
			searchPage(pageNo[0].firstChild.data, totalCount[0].firstChild.data);
			
		}
	}
}
function goDetail(idx){
	$('#desertionNo').val(eleTmep[idx].getElementsByTagName("desertionNo")[0].firstChild.data);
	$('#popfile').val(eleTmep[idx].getElementsByTagName("popfile")[0].firstChild.data);
	$('#happenDt').val(eleTmep[idx].getElementsByTagName("happenDt")[0].firstChild.data);
	$('#happenPlace').val(eleTmep[idx].getElementsByTagName("happenPlace")[0].firstChild.data);
	$('#kindCd').val(eleTmep[idx].getElementsByTagName("kindCd")[0].firstChild.data);
	$('#colorCd').val(eleTmep[idx].getElementsByTagName("colorCd")[0].firstChild.data);
	$('#age').val(eleTmep[idx].getElementsByTagName("age")[0].firstChild.data);
	$('#weight').val(eleTmep[idx].getElementsByTagName("weight")[0].firstChild.data);
	$('#noticeNo').val(eleTmep[idx].getElementsByTagName("noticeNo")[0].firstChild.data);
	$('#processState').val(eleTmep[idx].getElementsByTagName("processState")[0].firstChild.data);
	$('#sexCd').val(eleTmep[idx].getElementsByTagName("sexCd")[0].firstChild.data);
	$('#neuterYn').val(eleTmep[idx].getElementsByTagName("neuterYn")[0].firstChild.data);
	$('#specialMark').val(eleTmep[idx].getElementsByTagName("specialMark")[0].firstChild.data);
	$('#careNm').val(eleTmep[idx].getElementsByTagName("careNm")[0].firstChild.data);
	$('#careTel').val(eleTmep[idx].getElementsByTagName("careTel")[0].firstChild.data);
	$('#careAddr').val(eleTmep[idx].getElementsByTagName("careAddr")[0].firstChild.data);
	$('#orgNm').val(eleTmep[idx].getElementsByTagName("orgNm")[0].firstChild.data);
	//$('#chargeNm').val(eleTmep[idx].getElementsByTagName("chargeNm")[0].firstChild.data);
	$('#officetel').val(eleTmep[idx].getElementsByTagName("officetel")[0].firstChild.data);
	
	
	document.getElementById("tmp").action = "/plzdaengs/yugidetail";
	document.getElementById("tmp").submit();
}
function searchPage(pageNo, totalCount){
	var page_scale = 10;
	var block_scale = 10;
	var curBlock = 1;
	var curPage = pageNo;
	var totalPage = parseInt(totalCount * 1.0 /page_scale);
	
	
	var pageBegin = (curPage-1)*page_scale+1;
	var pageEnd = pageBegin+page_scale-1;
	
	var totalBlock = parseInt(totalPage / page_scale);
	curBlock = parseInt((curPage - 1)/block_scale+1);
	var blockBegin = (curBlock-1) * block_scale+1;
	var blockEnd = blockBegin + block_scale-1;
	
	if(blockEnd > totalPage) blockEnd = totalPage;
	
	var prevPage = 1;
	
	if(curPage != 1){
		prevPage = (curBlock-1)*block_scale;
	}
	
	var nextPage = 0;
	if(curBlock > totalBlock){
		nextPage = curBlock*block_scale;
	}else{
		nextPage = (curBlock*block_scale)+1;
	}
	
	if(nextPage >= totalPage) nextPage = totalPage;
	
	//pageArea
	$("#pageArea").html('');
	if(curBlock > 1){
		$("#pageArea").append("<li class='page-item'><a class='page-link' href='#' onClick='searchList("+(blockBegin-1)+")'>Prev</a></li>");
	}
	
	for(var i=blockBegin; i<=blockEnd; i++){
		if(i == curPage){
			$("#pageArea").append("<li class='page-item'> <a class='page-link' onClick='searchList("+i+")'>"+i+"</a> </li>");
		}else{
			$("#pageArea").append("<li class='page-item'><a class='page-link' href='#' onClick='searchList("+i+")'>"+i+"</a></li>");
		}
	}
	
	if(curBlock <= totalBlock){
		$("#pageArea").append("<li class='page-item'><a class='page-link' href='#' onClick='searchList("+(blockEnd+1)+")'>Next</a></li>");
	}
	
	
}
function searchList(pageNo){
	if(pageNo == "") pageNo = 1;
	var params = "cmd=abandonmentPublic&bgnde="+$("#bgnde").val().replace(/-/g,"");
	params += "&endde="+$("#endde").val().replace(/-/g,"");		//검색일자
	params += "&upkind="+$("#kind option:selected").val();	//축종코드 품종(대)
	params += "&kind="+$("#kindDetail option:selected").val(); //품종(중)
	params += "&upr_cd="+$("#sido option:selected").val(); //시도
	params += "&org_cd="+$("#sigungu option:selected").val(); ///시군구
	params += "&care_reg_no="+$("#shelter option:selected").val(); //보호센터
	params += "&pageNo="+pageNo;
	
	
	sendRequest("/plzdaengs/yugi",params,serchResult,"GET");
	
}
$(function(){
	$('#sido').change(function(){
		var params = "cmd=sigungu&upr_cd="+this.value;
		sendRequest("/plzdaengs/yugi",params,sidochage,"GET");
	});
	
	$('#sigungu').change(function(){
		var params = "cmd=shelter&upr_cd="+$('#sido option:selected').val()+"&org_cd="+this.value;
		sendRequest("/plzdaengs/yugi",params,sigunguchage,"GET");
	});
	
	$('#kind').change(function(){
		var params = "cmd=kind&up_kind_cd="+this.value;
		sendRequest("/plzdaengs/yugi",params,kinduchage,"GET");
	});
	
	$('#btnSearch').click(function(){
		searchList('');
	});
});
</script>
<body>
	<!-- navbar-->
	<header class="header">
		<nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
			<a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i
				class="fas fa-align-left"></i></a><a href="index.jsp"
				class="navbar-brand font-weight-bold text-uppercase text-base">Bubbly
				Dashboard</a>
			<ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
				<li class="nav-item">
					<form id="searchForm" class="ml-auto d-none d-lg-block">
						<div class="form-group position-relative mb-0">
							<button type="submit" style="top: -3px; left: 0;"
								class="position-absolute bg-white border-0 p-0">
								<i class="o-search-magnify-1 text-gray text-lg"></i>
							</button>
							<input type="search" placeholder="Search ..."
								class="form-control form-control-sm border-0 no-shadow pl-4">
						</div>
					</form>
				</li>
				<li class="nav-item dropdown mr-3"><a id="notifications"
					href="http://example.com" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"
					class="nav-link dropdown-toggle text-gray-400 px-1"><i
						class="fa fa-bell"></i><span class="notification-icon"></span></a>
					<div aria-labelledby="notifications" class="dropdown-menu">
						<a href="#" class="dropdown-item">
							<div class="d-flex align-items-center">
								<div class="icon icon-sm bg-violet text-white">
									<i class="fab fa-twitter"></i>
								</div>
								<div class="text ml-2">
									<p class="mb-0">You have 2 followers</p>
								</div>
							</div>
						</a><a href="#" class="dropdown-item">
							<div class="d-flex align-items-center">
								<div class="icon icon-sm bg-green text-white">
									<i class="fas fa-envelope"></i>
								</div>
								<div class="text ml-2">
									<p class="mb-0">You have 6 new messages</p>
								</div>
							</div>
						</a><a href="#" class="dropdown-item">
							<div class="d-flex align-items-center">
								<div class="icon icon-sm bg-blue text-white">
									<i class="fas fa-upload"></i>
								</div>
								<div class="text ml-2">
									<p class="mb-0">Server rebooted</p>
								</div>
							</div>
						</a><a href="#" class="dropdown-item">
							<div class="d-flex align-items-center">
								<div class="icon icon-sm bg-violet text-white">
									<i class="fab fa-twitter"></i>
								</div>
								<div class="text ml-2">
									<p class="mb-0">You have 2 followers</p>
								</div>
							</div>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item text-center"><small
							class="font-weight-bold headings-font-family text-uppercase">View
								all notifications</small></a>
					</div></li>
				<li class="nav-item dropdown ml-auto"><a id="userInfo"
					href="http://example.com" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"
					class="nav-link dropdown-toggle"><img
						src="/plzdaengs/template/img/avatar-6.jpg" alt="Jason Doe"
						style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
					<div aria-labelledby="userInfo" class="dropdown-menu">
						<a href="#" class="dropdown-item"><strong
							class="d-block text-uppercase headings-font-family">Mark
								Stephen</strong><small>Web Developer</small></a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">Settings</a><a href="#"
							class="dropdown-item">Activity log </a>
						<div class="dropdown-divider"></div>
						<a href="login.html" class="dropdown-item">Logout</a>
					</div></li>
			</ul>
		</nav>
	</header>
	<div class="d-flex align-items-stretch" id="document">
		<div id="sidebar" class="sidebar py-3">
			<div
				class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN</div>
			<ul class="sidebar-menu list-unstyled">
				<li class="sidebar-list-item"><a href="index.html"
					class="sidebar-link text-muted"><i
						class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
				<li class="sidebar-list-item"><a href="charts.html"
					class="sidebar-link text-muted"><i
						class="o-sales-up-1 mr-3 text-gray"></i><span>Charts</span></a></li>
				<li class="sidebar-list-item"><a href="tables.html"
					class="sidebar-link text-muted active"><i
						class="o-table-content-1 mr-3 text-gray"></i><span>Tables</span></a></li>
				<li class="sidebar-list-item"><a href="forms.html"
					class="sidebar-link text-muted"><i
						class="o-survey-1 mr-3 text-gray"></i><span>Forms</span></a></li>
				<li class="sidebar-list-item"><a href="#"
					data-toggle="collapse" data-target="#pages" aria-expanded="false"
					aria-controls="pages" class="sidebar-link text-muted"><i
						class="o-wireframe-1 mr-3 text-gray"></i><span>Pages</span></a>
					<div id="pages" class="collapse">
						<ul
							class="sidebar-menu list-unstyled border-left border-primary border-thick">
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5">Page one</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5">Page two</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5">Page three</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5">Page four</a></li>
						</ul>
					</div></li>
				<li class="sidebar-list-item"><a href="login.html"
					class="sidebar-link text-muted"><i
						class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
			</ul>
			<div
				class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">EXTRAS</div>
			<ul class="sidebar-menu list-unstyled">
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted"><i
						class="o-database-1 mr-3 text-gray"></i><span>Demo</span></a></li>
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted"><i
						class="o-imac-screen-1 mr-3 text-gray"></i><span>Demo</span></a></li>
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted"><i
						class="o-paperwork-1 mr-3 text-gray"></i><span>Demo</span></a></li>
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted"><i
						class="o-wireframe-1 mr-3 text-gray"></i><span>Demo</span></a></li>
			</ul>
		</div>
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-5" id="contents">
				<!-- 게시판뷰시작 -->
				<section class="py-5" style="max-height: none;">
					<div class="row">
						<div class="col-xl-12 col-lg-auto">
							<div class="card">
								<div class="card-header">
									<h6 class="text-uppercase mb-0">유기견 정보 게시판</h6>
								</div>
								<div class="card-body">
									<form class="form-horizontal">
										<!-- 날짜 -->
										<div class="form-group row">
											<label class="col-md-1 form-control-label">날짜</label>
											<div class="col-md-3">
												<input type='text' class="form-control datePicker"
													id="bgnde" name="bgnde" required="required" /> <label
													class="calendar-icon" target="bgnde"></label>

											</div>

											<div class="col-md-2">
												<label class="col-md-1 form-control-label"> ~ </label>
											</div>

											<div class="col-md-3">
												<input type='text' class="form-control datePicker"
													id="endde" name="endde" required="required" /> <label
													class="calendar-icon" target="endde"></label>
											</div>
										</div>
										<!-- 시도 -->
										<div class="form-group row">
											<label class="col-md-1 form-control-label">시도</label>
											<div class="col-md-2">
												<select id="sido" class="form-control">
													<option value="">시도</option>
												</select>
											</div>
											<label class="col-md-1 form-control-label">시군구</label>
											<div class="col-md-2">
												<select id="sigungu" class="form-control">
													<option value="">시군구</option>
												</select>
											</div>

											<label class="col-md-2 form-control-label">보호센터</label>
											<div class="col-md-3">
												<select id="shelter" class="form-control">
													<option value="">보호센터</option>
												</select>
											</div>
										</div>

										<!-- 날짜 -->
										<div class="form-group row">
											<label class="col-md-1 form-control-label">품종</label>
											<div class="col-md-2">
												<select id="kind" class="form-control">
													<option value="">품종(대)</option>
													<option value="417000">개</option>
													<option value="422400">고양이</option>
													<option value="42990">기타</option>
												</select>
											</div>

											<div class="col-md-2">
												<select id="kindDetail" class="form-control">
													<option value="">품중(중)</option>
												</select>
											</div>
											<div class="col-md-3"></div>
											<button id="btnSearch" type="button" class="btn btn-primary">검색</button>

										</div>

										<div class="line"></div>
									</form>
								</div>
								<div class="card-body">
									<table class="table card-text col-xl-auto">
										<tbody id="yugiList">
										</tbody>
										<!-- 게시글목록끝 -->
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<!-- 페이징 -->
						<nav>
							<ul class="pagination" style="margin-left: 30%;" id="pageArea">
							</ul>
						</nav>
					</div>
					<form id="tmp" method="post" action="">
						<input type="hidden" id="cmd" name="cmd" value="yugiDetail">
						<input type="hidden" id="desertionNo" name="desertionNo">
						<input type="hidden" id="popfile" name="popfile">
						<input type="hidden" id="happenDt" name="happenDt">
						<input type="hidden" id="happenPlace" name="happenPlace">
						<input type="hidden" id="kindCd" name="kindCd">
						<input type="hidden" id="colorCd" name="colorCd">
						<input type="hidden" id="age" name="age">
						<input type="hidden" id="weight" name="weight">
						<input type="hidden" id="noticeNo" name="noticeNo">
						<input type="hidden" id="noticeSdt" name="noticeSdt">
						<input type="hidden" id="noticeEdt" name="noticeEdt">
						<input type="hidden" id="popfile" name="popfile">
						<input type="hidden" id="sexCd" name="sexCd">
						<input type="hidden" id="neuterYn" name="neuterYn">
						<input type="hidden" id="specialMark" name="specialMark">
						<input type="hidden" id="careNm" name="careNm">
						<input type="hidden" id="careTel" name="careTel">
						<input type="hidden" id="careAddr" name="careAddr">
						<input type="hidden" id="orgNm" name="orgNm">
						<input type="hidden" id="chargeNm" name="chargeNm">
						<input type="hidden" id="officetel" name="officetel">
						<input type="hidden" id="noticeComment" name="noticeComment">
						<input type="hidden" id="processState" name="processState">
						
					</form>
				</section>
				<!-- 게시판 뷰 끝 -->
			</div>
			
		</div>
	</div>
	
</body>
</html>