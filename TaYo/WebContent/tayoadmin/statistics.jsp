<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tayoadmin/templet/header.jsp"%>
<script src="../tayoadmin/chart/chart.js"></script>
<script src="../tayoadmin/chart/utils.js"></script>
<style>
	.row{
		margin : 0 auto;
	}

	label{
		font-size: 20px;
	
	}


</style>
<div class="row">
	<div class="col-lg-12">
		<h1><small>Statistics</small></h1>
		<div class="alert alert-dismissable alert-warning">
			<button data-dismiss="alert" class="close" type="button">&times;</button>
				Welcome to the admin dashboard! 
			<br />  
		</div>
	</div>
</div>

<div class = "row">
	<div class="col-xs-6">
		<div class="panel panel-primary" style="height: 600px;">
			<div class="panel-heading">
				<label>연령별</label>
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
	        labels: ['10대', '20대', '30대', '40대'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5,],
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
<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 600px;;">
		<div class="panel-heading">
			<label>지역별 </label>
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
	        labels: ['10대', '20대', '30대', '40대'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5,],
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
<div class = "row">
<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 600px;;">
		<div class="panel-heading">
			<label>관광지 테마별</label>
		</div>
		<div id="Histogram" class="charts"><!-- 차트 시작 영역  -->
			<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
				<canvas id = "polarChart" width="300" height = "500"></canvas>
			</div>
		</div><!-- 끝 영역 -->
	</div>
</div>

<script type="text/javascript">
	var ctx = $("#polarChart");
	var myChart = new Chart(ctx, {
	    type: 'polarArea',
	    data: {
	        labels: ['10대', '20대', '30대', '40대'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5,],
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

<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 600px;;">
		<div class="panel-heading">
			<label>기간별</label>
		</div>
		<div id="SteppedAreaChart" class="charts"><!-- 차트 시작 영역  -->
			<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
				 <canvas id="mixedChart" width="300" height="500"></canvas>
			</div>
		</div> <!-- 끝 영역 -->
	</div>
</div>
</div>

<script type="text/javascript">
var ctx = $("#mixedChart");
var mixedChart = new Chart(ctx, {
    type: 'bar',
    data: {
        datasets: [{
            label: 'Bar Dataset',
            data: [10, 20, 30, 40],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ]
            
            
        }, {
            label: 'Line Dataset',
            data: [50, 50, 50, 50],
            // Changes this dataset to become a line
            backgroundColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ]
        }],
        labels: ['January', 'February', 'March', 'April']
    },
    options:{
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
<!--

//-->
<%@include file="/tayoadmin/templet/footer.jsp"%>