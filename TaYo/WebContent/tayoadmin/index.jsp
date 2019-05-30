<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>

<style>


</style>
<!-- jquery chart area!!!  -->
<script type="text/javascript">
	jQuery(function($) {
		var performance = [ 100, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67 ], visits = [
				123, 323, 443, 32 ], traffic = [ {
			Source : "Direct",
			Amount : 600,
			Change : 53,
			Percent : 23,
			Target : 600
		}, {
			Source : "Refer",
			Amount : 345,
			Change : 34,
			Percent : 45,
			Target : 567
		}, {
			Source : "Social",
			Amount : 567,
			Change : 67,
			Percent : 23,
			Target : 456
		}, {
			Source : "Search",
			Amount : 234,
			Change : 23,
			Percent : 56,
			Target : 890
		}, {
			Source : "Internal",
			Amount : 111,
			Change : 78,
			Percent : 12,
			Target : 345
		} ];

		$("#shieldui-chart1").shieldChart({
			theme : "dark",

			primaryHeader : {
				text : "방문자"
			},
			exportOptions : {
				image : false,
				print : false
			},
			dataSeries : [ {
				seriesType : "area",
				collectionAlias : "Q Data",
				data : performance
			} ]
		});

		$("#shieldui-chart2").shieldChart({
			theme : "dark",
			primaryHeader : {
				text : "접속 비율"
			},
			exportOptions : {
				image : true,
				print : false
			},
			dataSeries : [ {
				seriesType : "pie",
				collectionAlias : "traffic",
				data : visits
			} ]
		});

		$("#shieldui-grid1").shieldGrid({
			dataSource : {
				data : traffic
			},
			sorting : {
				multiple : true
			},
			rowHover : true,
			paging : false,
			columns : [ {
				field : "Source",
				width : "170px",
				title : "Source"
			}, {
				field : "Amount",
				width : "170px",
				title : "Amount"
			}, {
				field : "Percent",
				title : "Percent",
				format : "{0} %"
			}, {
				field : "Target",
				title : "Target"
			}, ]
		});
	});
</script>


<div class="row">
	<div class="col-lg-12">
		<h1><small>WellCome</small></h1>
		<div class="alert alert-dismissable alert-warning">
			<button data-dismiss="alert" class="close" type="button">&times;</button>
				관리자 홈페이지 입니다. 
			<br />  
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-bar-chart-o"></i> Visits Based on a 10 days data
				</h3>
			</div>
			<div class="panel-body">
				<div id="shieldui-chart1"></div>
			</div>
		</div>
	</div>
	
<header>
	<div id = "header" class="col-lg-4">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#stats">Users</a>
				</li>
				<li class=""><a data-toggle="tab" href="#report">Favorites</a>
				</li>
				<li class=""><a data-toggle="tab" href="#dropdown1">Commenters</a>
				</li>
			</ul>
	</div>
</header>


	<div class="body tab-content">
		<div class="tab-pane clearfix active" id="stats">
			<h5 class="tab-header">
				<i class="fa fa-calendar-o fa-2x"></i> Last logged-in users
			</h5>
			<ul class="news-list">
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Ivan Gorge</a>
						</div>
						<div class="position">Software Engineer</div>
						<div class="time">Last logged-in: Mar 12, 11:11</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Roman Novak</a>
						</div>
						<div class="position">Product Designer</div>
						<div class="time">Last logged-in: Mar 12, 19:02</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Teras Uotul</a>
						</div>
						<div class="position">Chief Officer</div>
						<div class="time">Last logged-in: Jun 16, 2:34</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Deral Ferad</a>
						</div>
						<div class="position">Financial Assistant</div>
						<div class="time">Last logged-in: Jun 18, 4:20</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Konrad Polerd</a>
						</div>
						<div class="position">Sales Manager</div>
						<div class="time">Last logged-in: Jun 18, 5:13</div>
					</div></li>
			</ul>
		</div>
		<div class="tab-pane" id="report">
			<h5 class="tab-header">
				<i class="fa fa-star fa-2x"></i> Popular contacts
			</h5>
			<ul class="news-list news-list-no-hover">
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Pol Johnsson</a>
						</div>
						<div class="options">
							<button class="btn btn-xs btn-success">
								<i class="fa fa-phone"></i> Call
							</button>
							<button class="btn btn-xs btn-warning">
								<i class="fa fa-envelope-o"></i> Message
							</button>
						</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Terry Garel</a>
						</div>
						<div class="options">
							<button class="btn btn-xs btn-success">
								<i class="fa fa-phone"></i> Call
							</button>
							<button class="btn btn-xs btn-warning">
								<i class="fa fa-envelope-o"></i> Message
							</button>
						</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Eruos Forkal</a>
						</div>
						<div class="options">
							<button class="btn btn-xs btn-success">
								<i class="fa fa-phone"></i> Call
							</button>
							<button class="btn btn-xs btn-warning">
								<i class="fa fa-envelope-o"></i> Message
							</button>
						</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Remus Reier</a>
						</div>
						<div class="options">
							<button class="btn btn-xs btn-success">
								<i class="fa fa-phone"></i> Call
							</button>
							<button class="btn btn-xs btn-warning">
								<i class="fa fa-envelope-o"></i> Message
							</button>
						</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Lover Lund</a>
						</div>
						<div class="options">
							<button class="btn btn-xs btn-success">
								<i class="fa fa-phone"></i> Call
							</button>
							<button class="btn btn-xs btn-warning">
								<i class="fa fa-envelope-o"></i> Message
							</button>
						</div>
					</div></li>
			</ul>
		</div>
		<div class="tab-pane" id="dropdown1">
			<h5 class="tab-header">
				<i class="fa fa-comments fa-2x"></i> Top Commenters
			</h5>
			<ul class="news-list">
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Edin Garey</a>
						</div>
						<div class="comment">Nemo enim ipsam voluptatem quia
							voluptas sit aspernatur aut odit aut fugit,sed quia</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Firel Lund</a>
						</div>
						<div class="comment">Duis aute irure dolor in reprehenderit
							in voluptate velit esse cillum dolore eu fugiat.</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Jessica Desingter</a>
						</div>
						<div class="comment">Excepteur sint occaecat cupidatat non
							proident, sunt in culpa qui officia deserunt.</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Novel Forel</a>
						</div>
						<div class="comment">Sed ut perspiciatis, unde omnis iste
							natus error sit voluptatem accusantium doloremque.</div>
					</div></li>
				<li><i class="fa fa-user fa-4x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">Wedol Reier</a>
						</div>
						<div class="comment">Laudantium, totam rem aperiam eaque
							ipsa, quae ab illo inventore veritatis et quasi.</div>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 방문자 기록
					</h3>
				</div>
				<div class="panel-body">
					<div id="shieldui-grid1"></div>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> Logins per week
					</h3>
				</div>
				<div class="panel-body">
					<div id="shieldui-chart2"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/tayoadmin/templet/footer.jsp"%>