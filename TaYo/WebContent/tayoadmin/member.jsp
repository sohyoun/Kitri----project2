<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/tayoadmin/templet/header.jsp"%>

<!-- jquery  --> 
<div id="grid"></div>

<script type="text/javascript">
    jQuery(function ($) {
        $("#grid").shieldGrid({
            dataSource: {
                data: gridData,
                schema: {
                    fields: {
                        id: { type: Number },
                        name: { type: String },
                        company: { type: String },
                        phone: { type: String },
                        age: { type: Number },
                        gender: { type: String }
                    }
                },
                filter: {
                    and: [
                        { path: "name", filter: "con", value: "John" }
                    ]
                }
            },
            filtering: {
                enabled: true
            },
            paging: true,
            columns: [
                { field: "id", width: "250px", title: "ID" },
                { field: "name", title: "Person Name", width: "250px" },
                { field: "company", title: "Company" },
                { field: "phone", title: "Phone", width: "250px" },
                { field: "age", title: "Age" },
                { field: "gender", title: "Gender [Custom filter]", customFilter: myCustomFilter }
            ],
            events: {
                filterWidgetCreating: function (e) {
                    if (e.field === "id") {
                        e.options = { max: 1000 };
                    }
                    if (e.field === "age") {
                        e.options = { min: 1 };
                    }
                }
            }
        });
    });
    // Calback function which creates dropdown and insert it into the filtered cell. 
    function myCustomFilter(cell) {
        $('<div id="customDropDown"/>')
            .appendTo(cell)
            .shieldDropDown({
                dataSource: {
                    data: ["all", "male", "female"]
                },
                events:
                    {
                        select: function (e) {
                            if (e.item != "all") {
                                // Manually filter the grid by gender field with equals to function and selected value in the dropdown.
                                $("#grid").swidget().filter({ path: "gender", filter: "eq", value: e.item });
                            }
                            else {
                                // Filter by not null values - will return all values - male and female.
                                $("#grid").swidget().filter({ path: "gender", filter: "notnull", value: "" });
                            }
                        }
                    }
            });
    }
</script>
<!--선택영역-->

<!--테이블 -->



<footer> <!-- footer   -->
	<section class="footer footer_w3layouts_section_1its py-5 text-center">
		<div class="container py-lg-4 py-3">
			<div class="row footer-top">
				<div class="col-lg-3 col-sm-6 footer-grid_section_1its_w3">
					<div class="footer-title">
						<h3>TaYoTaYo</h3>
					</div>
				<div class="row">
					<ul class="col-6 links">
						<li><a href="" class="scroll">관광지 추천</a></li>
						<li><a href="" class="scroll">여행지 추천</a></li>
						<li><a href="" class="scroll">여행 일정 추천</a></li>
						<li><a href="<%=root%>/schedule?act=schedule" class="scroll">일정 만들기</a></li>
						<li><a href="<%=root%>/tayotogether/tayotogether.jsp" class="scroll">함께타요</a></li>
						<li><a href="" class="scroll">My Page</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 footer-grid_section mt-sm-0 mt-4">
				<div class="footer-title">
					<h3>TaYoTaYo의 이야기</h3>
				</div>
				<div class="row">
					<ul class="col-6 links">
						<li><a href="" class="scroll">회사 소개</a></li>
						<li><a href="" class="scroll">F&amp;Q</a></li>
					</ul>
				</div>
			</div>
				<div class="col-lg-3 col-sm-6 mt-lg-0 mt-4 footer-grid_section_1its_w3">
						<div class="footer-title">
							<h3>My TaYo</h3>
						</div>
					<div class="row">
						<ul class="col-6 links">
							<li><a href="" class="scroll">나의 여행일정</a></li>
							<li><a href="" class="scroll">나의 함께타요</a></li>
							<li><a href="" class="scroll">My Page</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</footer><!-- //footer -->

<div class="copyright py-3 text-center"><!-- copyright -->
	<p>© 2019 TaYoTaYo - The Bus Trip Planner | Design by 이재운 / 김의연 / 형태희 / 박소현 / 고세라</p>
</div> <!-- //copyright -->

<div class="move-top text-right"><!-- move top -->
	<a href="#home" class="move-top"> 
		<span class="fa fa-angle-up  mb-3" aria-hidden="true"></span>
	</a>
</div>

<%@include file="/tayoadmin/templet/footer.jsp"%>
