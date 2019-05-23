<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/temp/header.jsp" %>






<!--관광타입 -->
<form>
<select  name ="tourtype">
	<option value=12>관광지</option>
	<option value=14>문화시설</option>
	<option value=15>행사/공연/축제</option>
	<option value=25>여행코스</option>
	<option value=28>레포츠</option>
</select>
</form>

<script>


	
</script>
<div class="asdfasdf container mt-3">

</div>


<div class="container mt-3">
	<h3 class="heading text-capitalize text-center">함께 타요</h3>
	<p class="text mt-2 mb-5 text-center">타요인들과 함께 여행을 떠나 새로운 추억을
		쌓아보세요!</p>
<!-- 필터 -->
	<table class="table table-bordered" id="tayowith-filter">
	  <tr>
	  	<td id="filter-title" >필터</td>
	  	<td id="filter-body" colspan="2">
	  	<button type="button" class="btn btn-light">서울 | <span class="fa fa-remove"></button>
	  	<button type="button" class="btn btn-light">7-10일 | <span class="fa fa-remove"></button>
	  	<button type="button" class="btn btn-light">여름 | <span class="fa fa-remove"></button>
	  	</td>
	  </tr>	
      <tr>
        <td id="filter-title">여행도시</td>
        <td id="filter-body">
      	  <button type="button" class="btn btn-light">서울</button>
		  <button type="button" class="btn btn-light">부산</button>
	 	  <button type="button" class="btn btn-light">인천</button>
 		  <button type="button" class="btn btn-light">대전</button>
 		  <button type="button" class="btn btn-light">대구</button>
 		  <div id="city-toggle" class="collapse">
 		  <button type="button" class="btn btn-light">광주</button>
 		  <button type="button" class="btn btn-light">울산</button>
 		  <button type="button" class="btn btn-light">세종특별자치시</button>
 		  <button type="button" class="btn btn-light">가평군</button>
 		  <button type="button" class="btn btn-light">고양시</button>
 		  <button type="button" class="btn btn-light">과천시</button>
 		  <button type="button" class="btn btn-light">광명시</button>
 		  <button type="button" class="btn btn-light">광주시(경기)</button>
 		  <button type="button" class="btn btn-light">구리시</button>
 		  <button type="button" class="btn btn-light">군포시</button>
 		  </div>
        </td>
        <td width="4%"><span class="fa fa-chevron-down" data-toggle="collapse" data-target="#city-toggle"></td>
      </tr>
      <tr>
        <td id="filter-title">여행일</td>
        <td id="filter-body"  colspan="2">
        	<button type="button" class="btn btn-light">1-3일</button>
			<button type="button" class="btn btn-light">4-6일</button>
			<button type="button" class="btn btn-light">7-10일</button>
 			<button type="button" class="btn btn-light">11-15일</button>
 			<button type="button" class="btn btn-light">15일 이상</button>
        </td>
      </tr>
      <tr>
        <td id="filter-title">여행시기</td>
        <td id="filter-body"  colspan="2">
 			 <button type="button" class="btn btn-light">봄</button>
			 <button type="button" class="btn btn-light">여름</button>
			 <button type="button" class="btn btn-light">가을</button>
 			 <button type="button" class="btn btn-light">겨울</button>
        </td>
      </tr>
  </table>
<!-- 필터 -->
</div>
<%@ include file="/temp/footer.jsp" %>