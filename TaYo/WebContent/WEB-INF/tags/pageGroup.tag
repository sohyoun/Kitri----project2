<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="current" required="true" type="java.lang.Integer"%>
<%@attribute name="start" required="true" type="java.lang.Integer"%>
<%@attribute name="end" required="true" type="java.lang.Integer"%>
<%@attribute name="total" required="true" type="java.lang.Integer"%>
<div class="pagegroup"> 
  <ul>
   <c:if test="${start > 1 }">
   <li><a href="${start - 1}" >◀</a></li> 
   </c:if>     
   
   <c:forEach begin="${start}" end="${end}" var="i">
     <c:choose>
       <c:when test="${current == i}">
         <li>${i}</li>
       </c:when>
       <c:otherwise>  
         <li><a href="${i}">${i}</a></li> 
       </c:otherwise>
     </c:choose>  
   </c:forEach>
   <c:if test="${total > end }">
     <li><a href="${end+1}">▶</a></li>     
   </c:if>
  </ul>   
</div>   