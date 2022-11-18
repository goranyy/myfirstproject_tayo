<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<style></style>
</head>
<body>
<%
String power = (String)session.getAttribute("power");
%>
<c:set var = "power" scope = "session" value = "${power}"/>
<c:choose>
<c:when test="${power eq 2}">
	<jsp:include page="Adminheader.jsp"></jsp:include>
</c:when>
<c:when test="${power eq 1}">
	<jsp:include page="Adminheader.jsp"></jsp:include>
</c:when>
<c:otherwise>
	<jsp:include page="header.jsp"></jsp:include>
</c:otherwise>
</c:choose>
	<form action="Togetherupdate" method="post">
	<input type="hidden" name="num" value="${total.num}"/>
		<table>
			<tr>
				<td>
					<input type="text" name="title" value="${total.title}"/>
				</td>
			</tr>
			<tr>				
				<td>${total.mem_id}</td>
				<td>${total.to_date}</td>			
			</tr>			
			<tr>
				<td>
					<textarea name="content">${total.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btn_area">
					<button type="button" onclick="location.href='./Togetherlist'">취소</button>
					<button class="rev">수정하기</button>
				</td>
			</tr>		
		</table>
	</form>
</body>
<script>
$(".rev").click(function() {
    if(confirm("수정하시겠습니까?")) {
        alert("수정이 완료되었습니다");
    }
})
</script>
</html>







