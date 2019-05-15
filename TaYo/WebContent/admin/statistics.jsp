<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "templet/header.jsp" %>
<div class="col-lg-4">
          
<body class="theme-light">
    <div id="chart"></div>

<script type="text/javascript">
    
</script>

<body class="theme-light">
    <div id="chart"></div>
    <script type="text/javascript">
    
    // 연령별 차트 
   /*  $(document).ready(function () {
        var internetUsersPercent = [
            { x: "1994", y: 4.9 },
            { x: "1995", y: 9.2 },
            { x: "1996", y: 16.4 },
            { x: "1997", y: 21.6 },
            { x: "1998", y: 30.1 },
            { x: "1999", y: 35.9 },
            { x: "2000", y: 43.1 },
            { x: "2001", y: 49.2 },
            { x: "2002", y: 59.0 },
            { x: "2003", y: 61.9 },
            { x: "2004", y: 65 },
            { x: "2005", y: 68.3 },
            { x: "2006", y: 69.2 },
            { x: "2007", y: 75.3 },
            { x: "2008", y: 74.2 },
            { x: "2009", y: 71.2 },
            { x: "2010", y: 74.2 },
            { x: "2011", y: 78.2 }
        ];
        $("#chart").shieldChart({
            theme: "light",
            axisY: {
                title: {
                    text: "Internet users in the United States"
                }
            },
            dataSeries: [{
                seriesType: "area",
                data: internetUsersPercent
            }]
        });
    });
    
    // 기간별 차트
        $(function () {
            $("#chart").shieldChart({
                theme: "light",
                seriesSettings: {
                    donut: {
                        enablePointSelection: true,
                        addToLegend: true,
                        dataPointText: {
                            enabled: true,
                            borderRadius: 4,
                            borderWidth: 2,
                            borderColor: "red"
                        }
                    }
                },               
                tooltipSettings: {
                    customPointText: "{point.collectionAlias}: {point.y}"
                },
                chartLegend: {
                    align: "center",
                    borderRadius: 2,
                    borderWidth: 2,
                    verticalAlign: "top"
                },
                exportOptions: {
                    image: false,
                    print: false
                },
                primaryHeader: {
                    text: "Browsers Popularity amongst Users"
                },
                dataSeries: [{
                    seriesType: "donut",
                    collectionAlias: "Usage",
                    data: [
                         ["IE", 9.0],
                        ["Firefox", 26.8],
                        ["Chrome", 55.8],
                        ["Safari", 3.8],
                        ["Opera", 1.9]
                    ]
                }]
            });
        }); */
    </script>
    
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="container">Containers</h1>
            </div>
            <div class="bs-example">
              <div class="jumbotron">
                <h1>Jumbotron</h1>
                <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                <p><a class="btn btn-primary btn-lg">Learn more</a></p>
              </div>
            </div>
          </div>
        </div><!-- /.row -->