
<%@page import="com.kitri.dto.AdminDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminDTO adminDto = (AdminDTO) request.getAttribute("loginInfo");
%>

<%=adminDto.getAdmin_email()%> 님 로그인 성공
