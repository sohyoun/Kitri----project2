<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(function(){
	var start = $("#start");
	var end = $("#end");
	
	$.datepicker.setDefaults({
		dateFormat: 'yy.mm.dd',
		showOtherMonths: true,
		showMonthAfterYear:true,
		buttonImageOnly: true,
		changeYear: true,
		changeMonth: true,
		yearSuffix: "년",
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		minDate: "0D"
	});
	
	var startDate = $(start).datepicker();
		
	$(start).click(function(){
		$(start).datepicker().show();
	});
	
	$(end).click(function(){
		var sDate = $("#start").val().split('.');
		var newDate = new Date(sDate[0], sDate[1] - 1, sDate[2]);
		console.log(newDate);
		newDate.setDate(newDate.getDate() + ($(".list-group").length - 1));
		console.log(newDate);
		var year = newDate.getFullYear();
		var month = newDate.getMonth() + 1;
		var currDay = newDate.getDate();
		
		if (month < 10) {
			month = '0' + month;
		}
		
		if (currDay < 10) {
			currDay = '0' + currDay;
		}
		
		$(this).val(year + '.' + month + '.' + currDay);
	});
	
	$("input[name='theme']").click(function() {
		if ($("#solo").is(':checked')) {
			$("#person").val('1');
			$("#personlb").hide();			
		} else {
			$("#personlb").show();
		}
	});
	
	function closeModal() {
		$("#planSaveModal").modal("hide");
		$("#planName").val('');
		$(start).val('');
		$(end).val('');
		$("#person").val('1');
	}
	
	$("#cancel").click(function() {
		closeModal();
	});
	
	var daylists;
	$("button[name='save']").click(function() {
		var savetype;
		if ($(this).attr("value") == 'tempsave') {
			savetype = 'N';
		} else if ($(this).attr("value") == 'complete') {
			savetype = 'Y';
		} else {
			alert("오류 발생");
			closeModal();
			return false;
		}
		
		daylists = $(".list-group");
		
		var plandata = new Array();
		var plandatastr = "";
		var idx = 0;
		
		if ((daylists.length == 1) && ($(daylists).find(".list-group-item").length == 0)) {
			alert("저장을 위해서는 최소 하나 이상의 일정이 있어야 합니다.");
			closeModal();
			return false;
		}
		
		if ($("#planName").val().trim() == '') {
			alert("여행 제목을 입력하세요.");
			return false;
		}
		
		if ($("#person").val() < 1) {
			alert("최소 인원은 1명 입니다.");
			return false;
		}
		
		if ($("#start").val() == '' || $("#end").val() == '') {
			alert("출발 일자 및 종료 일자를 선택하세요.");
			return false;
		}
		
		for (var i = 0; i < daylists.length; i++) {
			var items = $(daylists[i]).find(".list-group-item");
			var itemslength = items.length;
			
			for(var j = 0; j < itemslength; j++) {
				var tempArray = new Array();
				
				tempArray.push(i + 1);
				tempArray.push(j + 1);
				tempArray.push($(items[j]).attr("value"));
				tempArray.push($(items[j]).attr("areaCode"));
				tempArray.push($(items[j]).attr("axisx"));
				tempArray.push($(items[j]).attr("axisy"));
				
				plandata[idx++] = tempArray;
			}
		}

		for(var k = 0; k < plandata.length; k++) {
			plandatastr += ('&plandata=' + plandata[k]);
		}
		
		$.ajax({
			url: '${pageContext.request.contextPath}/schedule',
			data: 'act=savePlan' + plandatastr + '&savetype=' + savetype + '&person=' + $("#person").val() + '&title=' + $("#planName").val() + '&theme=' + $("input[name='theme']:checked").val() + '&season=' + $("input[name='season']:checked").val() + '&start=' + $("#start").val() + '&end=' + $("#end").val(),
			method: 'post',
			success: function(result) {
				alert("임시저장 되었습니다.");
				closeModal();
				location.href='${pageContext.request.contextPath}/schedule?act=myschedule';
			},
			error: function(error) {
				alert("임시저장 처리 중 서버 오류가 발생하였습니다.");
			}
		});
		return false;
	});
});
</script>

<div id="planSaveModal" class="modal fade" role="dialog">
	<h5 class="modal-title" id="myModalLabel">지역선택</h5>
	<div class="modal-dialog modal-lg">
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
					<div class="col-sm-2">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="theme" value="나홀로" id="solo">나홀로
							</label>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="theme" value="친구">친구
							</label>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="theme" value="커플">커플
							</label>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="theme" value="가족">가족
							</label>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="theme" value="함께타요" checked="checked">함께타요
							</label>
						</div>
					</div>
					<div class="col-sm-2">
						<label id="personlb">인원 : <input type="text" id="person" name="person" value="1" placeholder="1" size="2" style="text-align: center;"/> 명</label>
					</div>
				</div>
				<br>
           		<div align="center">
           			<label><strong>여행 시기</strong></label>
           		</div>
           		<div class="row">
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="season" value="봄" checked="checked">봄
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="season" value="여름">여름
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="season" value="가을">가을
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="radio" class="form-check-input" name="season" value="겨울">겨울
							</label>
						</div>
					</div>
				</div>
           		<br>
           		<div align="center">
           			<label><strong>여행 일자</strong></label>
           		</div>
           		<div class="input-group" align="center">
           			<div class="row" style="margin: auto;">
           				<div class="col-sm-5" style="margin: auto;">
           					<div class="d-inline-flex p-2 text-white">
								<input type="text" class="form-control" id="start" name="start" placeholder="20XX.XX.XX" style="display: inline-block;" readonly="readonly">
							</div>
       					</div>
        				<div class="col-sm-1" style="margin: auto;" align="center">~</div>
        				<div class="col-sm-5" style="margin: auto;">
	        				<div class="d-inline-flex p-2 text-white">
	        					<input type="text" class="form-control" id="end" name="end" placeholder="20XX.XX.XX" style="display: inline-block;" readonly="readonly">
							</div>
           				</div>
         			</div>
           		</div>
           		<br>
           		<div class="row">
           			<div class="col-sm-4">
						<button type="button" class="btn btn-warning btn-block" id="cancel">취소</button>           			
           			</div>
           			<div class="col-sm-4">
           				<button type="button" class="btn btn-info btn-block" name="save" value="tempsave">임시 저장</button>
           			</div>
           			<div class="col-sm-4">
           				<button type="button" class="btn btn-success btn-block" name="save" value="complete">완료</button>
           			</div>
           		</div>
            </div>
		</div>
	</div>
</div>