<%@page import="com.kitri.admin.model.AdminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getAttribute("loginInfo")%> 
<% 
	AdminDto adminDto = (AdminDto) request.getAttribute("loginInfo");
%>
<html>

<body>
<section>
	<%=adminDto.getAdminEmail()%> 님 로그인 성공
</section>>
</body>

</html>