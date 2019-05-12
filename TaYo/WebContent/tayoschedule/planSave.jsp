<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="planSaveModal" class="modal fade" role="dialog">
	<h5 class="modal-title" id="myModalLabel">지역선택</h5>
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-center">
            	<div align="center">
           			<label><strong>여행 이름</strong></label>
           		</div>
           		<div class="input-group" align="left">
           			<input type="text" class="form-control" id="planName" name="planName" placeholder="기대되는 나의 여행.">
           		</div>
           		<br>
           		<div align="center">
           			<label><strong>여행 테마</strong></label>
           		</div>
           		<div class="row">
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="theme" value="나홀로" checked="checked">나홀로
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="theme" value="친구">친구
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="theme" value="커플">커플
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="theme" value="가족">가족
							</label>
						</div>
					</div>
				</div>
				<br>
           		<div align="center">
           			<label><strong>여행 시기</strong></label>
           		</div>
           		<div class="row">
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="season" value="봄" checked="checked">봄
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="season" value="여름">여름
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="season" value="가을">가을
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="season" value="겨울">겨울
							</label>
						</div>
					</div>
				</div>
           		<br>
           		<div align="center">
           			<label><strong>여행 일자</strong></label>
           		</div>
           		<div class="input-group" align="center">
           			<span><input type="text" class="form-control" id="start" name="start" placeholder="20XX.XX.XX"></span> ~ 
           			<span><input type="text" class="form-control" id="end" name="end" placeholder="20XX.XX.XX"></span>
           		</div>
           		<br>
           		<div class="row">
           			<div class="col-sm-4">
						<button type="button" class="btn btn-warning btn-block">취소</button>           			
           			</div>
           			<div class="col-sm-4">
           				<button type="button" class="btn btn-info btn-block">저장</button>
           			</div>
           			<div class="col-sm-4">
           				<button type="button" class="btn btn-success btn-block">완료</button>
           			</div>
           		</div>
            </div>
		</div>
	</div>
</div>