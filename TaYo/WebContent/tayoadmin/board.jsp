<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/tayoadmin/templet/header.jsp"%>
<style>
</style>

<!-- 테이블 영역  -->

<div class="container">
	<div class="row">
		<div class="col-sm-9">
			<div class="row">
				<div class="col-xs-12">
					<h2>1</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Duis pharetra varius quam sit amet vulputate. Quisque mauris
						augue, molestie tincidunt condimentum vitae, gravida a libero.
						Aenean sit amet felis dolor, in sagittis nisi. Sed ac orci quis
						tortor imperdiet venenatis. Duis elementum auctor accumsan.
						Aliquam in felis sit amet augue.</p>
					<div class="text-center">
						<a href="#"><i class="fa fa-plus"></i>Full Story</a> <a href="#"><i
							class="fa fa-comment"></i>12 Comments</a> <a href="#"><i
							class="fa fa-share"></i>11 Shares</a>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12">
					<h2>2</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Duis pharetra varius quam sit amet vulputate. Quisque mauris
						augue, molestie tincidunt condimentum vitae, gravida a libero.
						Aenean sit amet felis dolor, in sagittis nisi. Sed ac orci quis
						tortor imperdiet venenatis. Duis elementum auctor accumsan.
						Aliquam in felis sit amet augue.</p>
					<div class="text-center">
						<a href="#"><i class="fa fa-plus"></i>Full Story</a> <a href="#"><i
							class="fa fa-comment"></i>2 Comments</a> <a href="#"><i
							class="fa fa-share"></i>211 Shares</a>
					</div>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12">
					<h2>3</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Duis pharetra varius quam sit amet vulputate. Quisque mauris
						augue, molestie tincidunt condimentum vitae, gravida a libero.
						Aenean sit amet felis dolor, in sagittis nisi. Sed ac orci quis
						tortor imperdiet venenatis. Duis elementum auctor accumsan.
						Aliquam in felis sit amet augue.</p>
					<div class="text-center">
						<a href="#"><i class="fa fa-plus"></i>Full Story</a> <a href="#"><i
							class="fa fa-comment"></i>7 Comments</a> <a href="#"><i
							class="fa fa-share"></i>67 Shares</a>
					</div>
				</div>
			</div>
			<hr />

			<!-- the comment box -->
			<div class="well">
				<h4>4</h4>
				<form role="form">
					<div class="form-group">
						<textarea class="form-control" rows="3"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>

			<hr>

			<!-- the comments -->
			<h3>
				Blog contents <small>2014/03/07 11:43 PM</small>
			</h3>
			<p>This is a very interesting blog, well structured and
				organized. Would be great if you included more information on other
				IT topics as well.</p>

			<h3>
				Contacts <small>2014/03/09 12:11 PM</small>
			</h3>
			<p>I wanted to get in touch with the author of the blog, but I
				see no way to do this.</p>

		</div>
		<div class="col-sm-3">
			<div class="row">
				<div class="col-xs-12">
					<h2>Side</h2>
					<div class="panel panel-default">
						<div class="panel-heading">News</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Duis pharetra varius quam sit amet
							vulputate.</div>
						<div class="text-center">
							<a href="#"><i class="fa fa-plus"></i>Full Story</a>
						</div>
					</div>
					<hr />
					<div class="panel panel-default">
						<div class="panel-heading">News</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Duis pharetra varius quam sit amet
							vulputate.</div>
						<div class="text-center">
							<a href="#"><i class="fa fa-plus"></i>Full Story</a>
						</div>
					</div>
					<hr />
					<div class="panel panel-default">
						<div class="panel-heading">News</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Duis pharetra varius quam sit amet
							vulputate.</div>
						<div class="text-center">
							<a href="#"><i class="fa fa-plus"></i>Full Story</a>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">News</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Duis pharetra varius quam sit amet
							vulputate.</div>
						<div class="text-center">
							<a href="#"><i class="fa fa-plus"></i>Full Story</a>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">News</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Duis pharetra varius quam sit amet
							vulputate.</div>
						<div class="text-center">
							<a href="#"><i class="fa fa-plus"></i>Full Story</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		`
	</div>
</div>

<footer>
<section class="footer footer_w3layouts_section_1its py-5">
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
</footer>
<!-- //footer -->

<!-- copyright -->
<div class="copyright py-3 text-center">
	<p>© 2019 TaYoTaYo - The Bus Trip Planner | Design by 이재운 / 김의연 / 형태희 / 박소현 / 고세라</p>
</div>
<!-- //copyright -->

<!-- move top -->
<div class="move-top text-right">
	<a href="#home" class="move-top"> 
		<span class="fa fa-angle-up  mb-3" aria-hidden="true"></span>
	</a>
</div>

<%@ include file="/tayoadmin/templet/footer.jsp"%>