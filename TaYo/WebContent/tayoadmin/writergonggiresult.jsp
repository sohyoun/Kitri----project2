<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var = "gb" value ="${writegb}"/>
	글번호 : ${gb.gboard_seq}
	글분류: ${gb.gboard_group}
	글주제 : ${gb.gboard_subject}
	글쓴이 : ${gb.gboard_writer}
	글내용 : ${gb.gboard_contents}
	글작성일 : ${gb.gboard_date}
	글조회수 : ${gb.gboard_viewcount}