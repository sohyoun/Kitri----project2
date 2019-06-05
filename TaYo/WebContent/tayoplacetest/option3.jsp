<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
  function changes(fr) {
    if(fr==1) {
    //뿌려줄값을 배열로정렬
    num = new Array("1)첫번째목록","1)두번째목록","1)세번째목록");
    vnum = new Array("1","2","3");
    } else if(fr==2) {
      num = new Array("2)첫번째목록","2)두번째목록","2)세번째목록");
    vnum = new Array("1","2","3");
    }
    // 셀렉트안의 리스트를 기본값으로 한다..
  for(i=0; i<form.test2.length; i++) {
    form.test2.options[0] = null;
  }
    //포문을 이용하여 두번째(test2)셀렉트 박스에 값을 뿌려줍니당)
  for(i=0;i < num.length;i++) {
    document.form.test2.options[i] = new Option(num[i],vnum[i]);
  }
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
  <form name="form">
  <select name="test" onchange="changes(document.form.test.value)">
    <option value="">--선태하여주세요--</option>
    <option value="1">1번입니다</option>
    <option value="2">2번입니다</option>
  </select>
    <select name="test2">
    <option>--소분류입니다--</option>
  </select>
</form>
</div>
</body>
</html>







