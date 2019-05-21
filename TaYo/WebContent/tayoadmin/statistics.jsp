<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tayoadmin/templet/header.jsp"%>
<style>

</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	
	google.charts.load('current', {// google chart1 start
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		// Some raw data (not necessarily accurate)
		var data = google.visualization.arrayToDataTable([
				[ 'Month', 'Bolivia', 'Ecuador', 'Madagascar',
						'Papua New Guinea', 'Rwanda', 'Average' ],
				[ '2004/05', 165, 938, 522, 998, 450, 614.6 ],
				[ '2005/06', 135, 1120, 599, 1268, 288, 682 ],
				[ '2006/07', 157, 1167, 587, 807, 397, 623 ],
				[ '2007/08', 139, 1110, 615, 968, 215, 609.4 ],
				[ '2008/09', 136, 691, 629, 1026, 366, 569.6 ] ]);

		var options = {
			title : 'Monthly Coffee Production by Country',
			vAxis : {
				title : 'Cups'
			},
			hAxis : {
				title : 'Month'
			},
			seriesType : 'bars',
			series : {
				5 : {
					type : 'line'
				}
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('googlechart1'));
		chart.draw(data, options);
	} // end

	google.charts.load("current", { //begin
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
				[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options = {
			title : 'My Daily Activities',
			is3D : true,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('googlechart2'));
		chart.draw(data, options);
	}//end
	
</script>

<script type="text/javascript">
google.charts.load("current", {
	packages : [ "corechart" ]
});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
	var data = google.visualization.arrayToDataTable([
			[ 'Dinosaur', 'Length' ],
			[ 'Acrocanthosaurus (top-spined lizard)', 12.2 ],
			[ 'Albertosaurus (Alberta lizard)', 9.1 ],
			[ 'Allosaurus (other lizard)', 12.2 ],
			[ 'Apatosaurus (deceptive lizard)', 22.9 ],
			[ 'Archaeopteryx (ancient wing)', 0.9 ],
			[ 'Argentinosaurus (Argentina lizard)', 36.6 ],
			[ 'Baryonyx (heavy claws)', 9.1 ],
			[ 'Brachiosaurus (arm lizard)', 30.5 ],
			[ 'Ceratosaurus (horned lizard)', 6.1 ],
			[ 'Coelophysis (hollow form)', 2.7 ],
			[ 'Compsognathus (elegant jaw)', 0.9 ],
			[ 'Deinonychus (terrible claw)', 2.7 ],
			[ 'Diplodocus (double beam)', 27.1 ],
			[ 'Dromicelomimus (emu mimic)', 3.4 ],
			[ 'Gallimimus (fowl mimic)', 5.5 ],
			[ 'Mamenchisaurus (Mamenchi lizard)', 21.0 ],
			[ 'Megalosaurus (big lizard)', 7.9 ],
			[ 'Microvenator (small hunter)', 1.2 ],
			[ 'Ornithomimus (bird mimic)', 4.6 ],
			[ 'Oviraptor (egg robber)', 1.5 ],
			[ 'Plateosaurus (flat lizard)', 7.9 ],
			[ 'Sauronithoides (narrow-clawed lizard)', 2.0 ],
			[ 'Seismosaurus (tremor lizard)', 45.7 ],
			[ 'Spinosaurus (spiny lizard)', 12.2 ],
			[ 'Supersaurus (super lizard)', 30.5 ],
			[ 'Tyrannosaurus (tyrant lizard)', 15.2 ],
			[ 'Ultrasaurus (ultra lizard)', 30.5 ],
			[ 'Velociraptor (swift robber)', 1.8 ] ]);

	var options = {
		title : 'Country Populations',
		legend : {
			position : 'none'
		},
		colors : [ '#e7711c' ],
		histogram : {
			lastBucketPercentile : 5
		},
		vAxis : {
			scaleType : 'mirrorLog'
		}
	};

	var chart = new google.visualization.Histogram(document
			.getElementById('googlechart3'));
	chart.draw(data, options);
}
</script>

<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Director (Year)',  'Rotten Tomatoes', 'IMDB'],
    ['Alfred Hitchcock (1935)', 8.4,         7.9],
    ['Ralph Thomas (1959)',     6.9,         6.5],
    ['Don Sharp (1978)',        6.5,         6.4],
    ['James Hawes (2008)',      4.4,         6.2]
  ]);

  var options = {
    title: 'The decline of \'The 39 Steps\'',
    vAxis: {title: 'Accumulated Rating'},
    isStacked: true
  };

  var chart = new google.visualization.SteppedAreaChart(document.getElementById('googlechart4'));

  chart.draw(data, options);
}
</script>


<div class="row">
          <div class="col-lg-12">
            <div class="page-header">
            </div>
            <div class="bs-example">
              <div class="jumbotron">
                <h1>통계</h1>
                <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                
              </div>
            </div>
          </div>
</div><!-- /.row -->

<!-- 차트 시작 영역  -->

<div class="col-lg-12">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<h3 class="text-center"> ????? <span class="glyphicon glyphicon-screenshot pull-right"></span>
			</h3>
		</div>
		<div id="chart1" class="shield-chart">
			<div id="shielddw" class="shield-container"
				style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
				<div id="google_chart1" style="width: 100%; height: 500px;"></div>
			</div>
		</div>
	</div>
</div><!-- 끝 영역 -->

<!-- 차트 시작 영역  -->
<div class="col-lg-12">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<h4 class="text-center">
				? <span class="glyphicon glyphicon-screenshot pull-right"></span>
			</h4>
		</div>
		<div id="chart1" class="shield-chart"></div>
		<div id="shielddw" class="shield-container"
			style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
			<div id="googlechart2" style="width: 500; height: 500px;"></div>
		</div>
	</div>
</div>
<!-- 끝 영역 -->

<!-- 차트 시작 영역  -->
<div class="col-lg-12">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<h4 class="text-center">
				? <span class="glyphicon glyphicon-screenshot pull-right"></span>
			</h4>
		</div>
		<div id="chart1" class="shield-chart"></div>
		<div id="shielddw" class="shield-container"
			style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
			<div id="googlechart3" style="width: 500; height: 500px;"></div>
		</div>
	</div>
</div>
<!-- 끝 영역 -->

<!-- 차트 시작 영역  -->
<div class="col-lg-12">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<h4 class="text-center">
				? <span class="glyphicon glyphicon-screenshot pull-right"></span>
			</h4>
		</div>
		<div id="chart1" class="shield-chart"></div>
		<div id="shielddw" class="shield-container"
			style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
			 <div id="googlechart4" style="width: 500; height: 500px;"></div>
		</div>
	</div>
</div>
<!-- 끝 영역 -->

<%@include file="/tayoadmin/templet/footer.jsp"%>