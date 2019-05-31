<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<!-- 여행일정 -->
<div class="container py-lg-4 py-sm-3">
<c:forEach var="tripBasicDto" items="${requestScope.filteredList}">
		private int tripSeq;		//여행아이디
	private String email;		//이메일
	private String tripTitle;	//여행이름
	private String tripTheme;	//여행테마
	private String tripSeason;	//여행시즌
	private int tripNum;		//여행정원
	private Date startDate;		//출발일
	private Date endDate;		//종료일
	private int viewCount;		//조회수
	private int likeCount;		//추천수
	private Date lastUpDate;		//최종수정일
	private String isComplete;		//완료여부
	
	List detailList;	//상세일정리스트
	private int trip_order; 		//순서
	private int trip_day;			//일자
	private int trip_seq;			//여행id
	private String place_name;		//장소 이름
	private int loc_id;				//지역코드
	private String image;			//이미지
	private String detail_title;	//세부제목
	private Clob detail_content;	//세부내용
	private float posX;				//x좌표
	private float posY;				//y좌표



	여행아이디: ${tripBasicDto.tripSeq}<br>
	이메일: ${tripBasicDto.email}<br>
	여행이름: ${tripBasicDto.tripTitle}<br>
	여행테마: ${tripBasicDto.tripTheme}<br>
	여행시즌: ${tripBasicDto.tripSeason}<br>
	종료일: ${tripBasicDto.endDate}<br>
	조회수: ${tripBasicDto.viewCount}<br>
	추천수: ${tripBasicDto.likeCount}<br>
	최종수정일: ${tripBasicDto.lastUpDate}<br>
	완료여부: ${tripBasicDto.isComplete}<br>
		<c:forEach var="tripDetailDto" items="${tripBasicDto.detailList }">
			순서: ${tripDetailDto.trip_order}<br>
			일자: ${tripDetailDto.trip_day}<br>
			여행id: ${tripDetailDto.trip_seq}<br>
			완료여부: ${tripDetailDto.place_name}<br>
			완료여부: ${tripDetailDto.loc_id}<br>
			완료여부: ${tripDetailDto.image}<br>
			완료여부: ${tripDetailDto.detail_title}<br>
			완료여부: ${tripDetailDto.detail_content}<br>
			완료여부: ${tripDetailDto.posX}<br>
			완료여부: ${tripDetailDto.posY}<br>
			

		<h3 class="heading text-capitalize text-center">베스트 여행일정</h3>
		<div class="col-lg-3 col-sm-6 mt-lg-0 mt-5">
			<div class="image-tour position-relative">
				<img src="/TaYo/images/p4.jpg" alt="" class="img-fluid">
				<p>
					<span>56 <span class="fa fa-thumbs-up"> | 3726 <span class="fa fa-eye"></span>
					</span></span>
				</p>
			</div>
			<div class="package-info">
				<h6 class="mt-1">
					<span class="fa fa-map-marker mr-2"></span>제천
				</h6>
				<h5 class="my-2">생애 첫 패러글라이딩</h5>
				<p class="">나홀로여행</p>
				<ul class="listing mt-3">
					<li><span class="fa fa-clock-o mr-2"></span><span>2019.04.19 (1)</span></li>
				</ul>
				<h6 class="mt-1">
					<span class="fa fa-user-circle"> lovetayo </span>
				</h6>
			</div>
		</div>

		</c:forEach>
</c:forEach>

</div>

