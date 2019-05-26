<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/tayoadmin/templet/header.jsp"%>

		<div>
			<div class="row text-center">
				<h2>New Registration</h2>
			</div>
			<div>
				<div>
					<label for="emailaddress" class="col-md-2"> Email address:
					</label>
					<div class="col-md-9">
						<input type="email" class="form-control" id="emailaddress"
							placeholder="Enter email address">
						<p class="help-block">Example: yourname@domain.com</p>
					</div>
					<div class="col-md-1">
						<i class="fa fa-lock fa-2x"></i>
					</div>
				</div>
				<div>
					<label for="password" class="col-md-2"> Password: </label>
					<div class="col-md-9">
						<input type="password" class="form-control" id="password"
							placeholder="Enter Password">
					</div>

					<div class="col-md-10">
						<button type="submit" class="btn btn-info">Register</button>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/tayoadmin/templet/footer.jsp"%>