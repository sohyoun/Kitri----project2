<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix = "c"	 uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var = "gonggi" value = "${requestScope.goboard}"/>
	<%-- <c:forEach var = "g" items ="${gonggi}"> --%>
		<tr>
			<td>${gonggi.gboard_seq}</td>		
			<td>${gonggi.gboard_subject}</td>		
			<td>${gonggi.gboard_contents}</td>		
			<td>${gonggi.gboard_date}</td>		
			<td>${gonggi.gboard_group}</td>		
			<td>${gonggi.gboard_viewcount}</td>		
		</tr>
	<%-- </c:forEach> --%>
