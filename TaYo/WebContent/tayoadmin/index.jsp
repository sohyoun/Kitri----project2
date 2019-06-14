<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>
<script src="../tayoadmin/chart/chart.js"></script>
<script src="../tayoadmin/chart/utils.js"></script>
<!-- jquery chart area!!!  -->
<script type="text/javascript">
</script>

<div class="row">
	<div class="col-lg-12">
		<h1><small>관리자</small></h1>
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
					<i class="fa fa-bar-chart-o"></i> 방문기록
				</h3>
			</div>
			<div class="panel-body">
				<canvas id="loginChart" width="600" height="300"></canvas>
			</div>
		</div>
	</div>
	
		<div class="body tab-content">
		<div class="tab-pane clearfix active" id="stats">
			<h5 class="tab-header">
				<i class="fa fa-calendar-o fa-2x"></i> 로그인 기록
			</h5>
			<ul class="news-list">
				<li><i class="fa fa-user fa-3x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">이재운</a>
						</div>
						<div class="position">Software Engineer</div>
						<div class="time">Last logged-in: Mar 12, 11:11</div>
					</div></li>
				<li><i class="fa fa-user fa-3x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">김의연</a>
						</div>
						<div class="position">Product Designer</div>
						<div class="time">Last logged-in: Mar 12, 19:02</div>
					</div></li>
				<li><i class="fa fa-user fa-3x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">형태희</a>
						</div>
						<div class="position">Chief Officer</div>
						<div class="time">Last logged-in: Jun 16, 2:34</div>
					</div></li>
				<li><i class="fa fa-user fa-3x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">박소현</a>
						</div>
						<div class="position">Financial Assistant</div>
						<div class="time">Last logged-in: Jun 18, 4:20</div>
					</div></li>
				<li><i class="fa fa-user fa-3x pull-left"></i>
					<div class="news-item-info">
						<div class="name">
							<a href="#">고세라</a>
						</div>
						<div class="position">Sales Manager</div>
						<div class="time">Last logged-in: Jun 18, 5:13</div>
					</div></li>
			</ul>
		</div>
	</div>
<script type="text/javascript">
var ctx = $("#loginChart");
var loginChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '월 별',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    	maintainAspectRatio : false,
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>

</div>

<div class = "row">
	<div class="col-xs-6">
		<div class="panel panel-primary" style="height: 600px;">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-bar-chart-o"></i> 연령별
				</h3>
			</div>
			<div id="ComboChart" class="charts"><!-- 차트 시작 영역  -->
				<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
					<canvas id="myChart" width="300" height="500"></canvas>
			</div>
		</div><!-- 끝 영역 -->
	</div>
</div>
<script type="text/javascript">
	var ctx = $("#myChart");
	var myChart = new Chart(ctx, {
	    type: 'pie',
	    data: {
	        labels: ['10대', '20대', '30대',],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	maintainAspectRatio : false,
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
</script>
<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 600px;">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-bar-chart-o"></i> 연령별
				</h3>
			</div>
			<div id="PieChart" class="charts"><!-- 차트 시작 영역  -->
				<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
					<canvas id = "lineChart" width = "300" height = "500"></canvas>
				</div>
			</div><!-- 끝 영역 -->
		</div>
	</div>
</div>
<script type="text/javascript">
var ctx = $("#lineChart");
var mixedChart = new Chart(ctx, {
    type: 'line',
	    data: {
	        labels: ['10대', '20대', '30대'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	maintainAspectRatio : false,
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
</script>
<%@ include file="/tayoadmin/templet/footer.jsp"%>