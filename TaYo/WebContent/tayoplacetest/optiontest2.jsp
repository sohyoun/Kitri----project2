
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <SCRIPT language=JavaScript>
	
	var f_selbox = new Array('한식', '중식', '일식' , '외국식');

	var s_selbox = new Array();
	s_selbox[0] = new Array('김치찌게', '된장찌게', '불고기', '설렁탕', '뼈해장국');
	s_selbox[1] = new Array('탕수육', '팔보채', '깐풍기');
	s_selbox[2] = new Array('초밥', '덮밥', '문어구이');
	s_selbox[3] = new Array('스테이크', '캐비어', '푸아그라', '파스타');

	function init(f){
		var f_sel = f.first;
		var s_sel = f.second;

		f_sel.options[0] = new Option("선택", "");
		s_sel.options[0] = new Option("선택", "");

		for(var i =0; i<f_selbox.length; i++){
			f_sel.options[i+1] = new Option(f_selbox[i], f_selbox[i]);
		}
	}

	function itemChange(f){
		var f_sel = f.first;
		var s_sel = f.second;

		var sel = f_sel.selectedIndex;
		for(var i=s_sel.length; i>=0; i--){
			s_sel.options[i] = null;
		}

		s_sel.options[0] = new Option("선택", "");

		if(sel != 0){
			for(var i=0; i<s_selbox[sel-1].length; i++){
				s_sel.options[i+1] = new Option(s_selbox[sel-1][i], s_selbox[sel-1][i]);
			}
		}
	}

   </SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
</head>
<body onload = "init(this.form);">	
	<form name="form">
		<select id="first" style="width:70px;" onchange="itemChange(this.form);" ></select>
		<select id="second" style="width:70px;" ></select>
	</form>
</body>
</html>

