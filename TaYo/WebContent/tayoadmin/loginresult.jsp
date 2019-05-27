<%@page import="com.kitri.admin.model.AdminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	AdminDto adminDto = (AdminDto) request.getAttribute("loginInfo");
%>

<%=adminDto.getAdminEmail()%> 님 로그인 성공
