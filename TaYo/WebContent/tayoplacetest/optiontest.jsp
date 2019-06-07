<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script language = "javascript"> 
//상위 셀렉트로 하위 셀렉트 제어하기
function showSub(obj) {

    f = document.forms.select_machine;

    if(obj == 1) {
    
        f.SUB1.style.display = "";
        f.SUB2.style.display = "";
        f.SUB3.style.display = "";
        f.SUB4.style.display = "none";
        f.SUB5.style.display = "none";
        f.SUB6.style.display = "none";

    } else {

        f.SUB1.style.display = "none";
        f.SUB2.style.display = "none";
        f.SUB3.style.display = "none";
        f.SUB4.style.display = "";
        f.SUB5.style.display = "";
        f.SUB6.style.display = "";

     }
}
</script>
</head>

<body>


<form name="select_machine">

//상위 셀렉트박스
<select name=" " onChange="showSub(this.options[this.selectedIndex].value);"> 
<option value="1">자동차</option> 
<option value="2">오토바이</option> 
</select>

<br><br>

//여기부턴 하위셀렉트박스
<select name="SUB1" style="display: ;">
<option value=" ">기아자동차</option>
<option value=" ">스포티지</option>
<option value=" ">오피러스</option>
<option value=" ">소렌토</option>
<option value=" ">카니발</option>
</select>


<select name="SUB2" style="display: ;">
<option value=" ">현대자동차</option>
<option value=" ">소나타</option>
<option value=" ">산타페</option>
<option value=" ">투산</option>
</select>


<select name="SUB3" style="display: ;">
<option value=" ">대우자동차</option>
<option value=" ">매그너스</option>
<option value=" ">마티즈</option>
</select>


<select name="SUB4" style="display: none;">
<option value=" ">대림오토바이</option>
<option value=" ">시티100</option>
<option value=" ">엑시브</option>
</select>


<select name="SUB5" style="display: none;">
<option value=" ">가와사키오토바이</option>
<option value=" ">ZXR400</option>
<option value=" ">ZX6R</option>
<option value=" ">ZX10R</option>
<option value=" ">ZX12R</option>
</select>


<select name="SUB6" style="display: none;">
<option value=" ">비엠베오토바이</option>
<option value=" ">R1150GS</option>
<option value=" ">R1100RT</option>
<option value=" ">K1200LT</option>
</select>

</form>
</body>
</html>