<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/tayoadmin/templet/header.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	.row{
		margin : 0 auto;
	}

	label{
		font-size: 20px;
	
	}


</style>

<script type="text/javascript">

	// 반응형 차트
	$(window).resize(function(){ 
		$("#basicpie");
		$("#rangeBarchart");
		$("#chart");
		$("#chart2");
	}); 

	$(function () {
        $("#basicpie").shieldChart({
            theme: "light",
            exportOptions: {
                image: false,
                print: false
            },
            primaryHeader: {
                text: "Browsers Popularity amongst Users"
            },
            chartLegend: {
                enabled: true
            },
            seriesSettings: {
                pie: {
                    enablePointSelection: true        
                }
            },
            dataSeries: [{
                seriesType: "pie",
                collectionAlias: "Usage",
                data: [
                    ["IE", 9.0],                        
                    { collectionAlias: "Firefox", y: 26.8, selected: true },
                    ["Chrome", 55.8],
                    ["Safari", 3.8],
                    ["Opera", 1.9]
                ]
            }]
        });
    });

	  $(function () {
          $("#rangeBarchart").shieldChart({
              theme: "light",
              axisX: {
                  axisType: 'datetime'
              },
              tooltipSettings: {
                  customPointText: 'Low Value: <b>{point.low}</b><br/>High Value:<b>{point.high}</b>'
              },
              primaryHeader: {
                  text: "Fuel Price Fluctuations"
              },
              dataSeries: [
		    {
                      seriesType: 'rangebar',
                      dataStart: Date.UTC(2010, 1, 1),
                      dataStep: 24 * 3600 * 1000, // one day
                      collectionAlias: 'Price',
                      data: [
                          [3.923, 3.993],
                          [3.973, 3.983],
                          [3.996, 4.12],
                          [3.997, 4.56],
                          [3.98, 4.23],
                          [3.929, 4.11],
                          [3.889, 4],
                          [3.849, 4.34],
                          [3.814, 4.45],
                          [3.773, 4.32],
                          [3.728, 4.11],
                          [3.671, 4.04],
                          [3.629, 4.7],
                          [3.589, 4.345],
                          [3.494, 4.543],
                          [3.415, 4.43],
                          [3.469, 4.345],
                          [3.485, 4.765],
                          [3.554, 4.567],
                          [3.568, 4.123],
                          [3.702, 4.432],
                          [3.779, 4.23],
                          [3.803, 4.33],
                          [3.837, 4.44],
                          [3.903, 4.43],
                          [3.907, 4.45],
                          [3.939, 4.65],
                          [3.889, 4.56],
                          [3.866, 4.65],
                          [3.914, 4.12],
                          [3.886, 4.32],
                          [3.756, 4.34],
                          [3.638, 4.45],
                          [3.563, 4.32],
                          [3.518, 4.21],
                          [3.497, 4],
                          [3.505, 4.12],
                          [3.463, 4.43],
                          [3.419, 4.23],
                          [3.324, 4.89],
                          [3.328, 4.98],
                          [3.369, 4.67],
                          [3.373, 4.34],
                          [3.377, 4.56],
                          [3.386, 4.57],
                          [3.427, 4.77],
                          [3.604, 4.88],
                          [3.677, 4.45],
                          [3.812, 4.67],
                          [3.851, 4.78],
                          [3.826, 4.88],
                          [3.779, 4.23],
                          [3.764, 4.34],
                          [3.746, 4.12],
                          [3.714, 4.07],
                          [3.676, 4.12],
                          [3.611, 4.77]
                      ]
                  }
		]
          });
      });
	
	
	 $(function () {
         $("#chart").shieldChart({
             theme: "light",
             zoomMode: 'xy',
             exportOptions: {
                 image: false,
                 print: false
             },
             axisX: {
                 categoricalValues: ['2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012']
             },
             axisY: {
                 title: {
                     text: "Price (EUR per kWh)"
                 }
             },
             tooltipSettings: {
                 axisMarkers: {
                     enabled: true,
                     mode: 'x',
                     width: 1,
                     zIndex: 3
                 }
             },
             primaryHeader: {
                 text: "Electricity prices"
             },
             dataSeries: [{
                 seriesType: 'line',
                 collectionAlias: 'Households',
                 data: [0.164, 0.173, 0.184, 0.167, 0.177, 0.189, 0.180, 0.183, 0.188, 0.160, 0.176, 0.178]
             }, {
                 seriesType: 'line',
                 collectionAlias: 'Industry',
                 data: [0.103, 0.105, 0.112, 0.111, 0.102, 0.099, 0.110, 0.113, 0.117, 0.119, 0.123, 0.117]
             }]
         });
     });
	
	 $(function () {
         $("#chart2").shieldChart({
             theme: "light",
             axisX: {
                 categoricalValues: ["2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011"]
             },
             axisY: {
                 title: {
                     text: "Percentage statistics"
                 }
             },
             primaryHeader: {
                 text: "Gross domestic product growth /GDP annual %/"
             },
             dataSeries: [{
                 seriesType: "bar",
                 collectionAlias: "India",
                 data: [3.907, 7.943, 7.848, 9.284, 9.263, 9.801, 3.890, 8.238, 9.552, 6.855]
             }, {
                 seriesType: "bar",
                 collectionAlias: "Russian Federation",
                 data: [4.743, 7.295, 7.175, 6.376, 8.153, 8.535, 5.247, -7.832, 4.3, 4.3]
             }, {
                 seriesType: "bar",
                 collectionAlias: "Germany",
                 data: [0.010, -0.375, 1.161, 0.684, 3.7, 3.269, 1.083, -5.127, 3.690, 2.995]
             }]
         });
     });
</script>
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
		<div class="panel panel-primary" style="height: 491px;">
			<div class="panel-heading">
				<label>연령별</label>
			</div>
			<div id="ComboChart" class="charts"><!-- 차트 시작 영역  -->
				<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
					<div id = "basicpie"></div>
			</div>
		</div><!-- 끝 영역 -->
	</div>
</div>


<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<label>지역별 </label>
		</div>
			<div id="PieChart" class="charts"><!-- 차트 시작 영역  -->
				<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
					<div id ="rangeBarchart" style = "height : 100%;"></div>
				</div>
			</div><!-- 끝 영역 -->
		</div>
	</div>
</div>

<div class = "row">
<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<label>관광지 테마별</label>
		</div>
		<div id="Histogram" class="charts"><!-- 차트 시작 영역  -->
			<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
				<div id = "chart"></div>
			</div>
		</div><!-- 끝 영역 -->
	</div>
</div>

<div class="col-xs-6">
	<div class="panel panel-primary" style="height: 491px;">
		<div class="panel-heading">
			<label>연도별</label>
		</div>
		<div id="SteppedAreaChart" class="charts"><!-- 차트 시작 영역  -->
			<div id="shielddw" class="shield-container" style="position: relative; overflow: hidden; line-height: normal; z-index: 0; font-size: 12px;">
				 <div id ="chart2" style = "height: 100%;"></div>
			</div>
		</div> <!-- 끝 영역 -->
	</div>
</div>
</div>
<%@include file="/tayoadmin/templet/footer.jsp"%>