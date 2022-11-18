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
<c:when test="${power eq 0}">
	<jsp:include page="header.jsp"></jsp:include>
</c:when>
<c:otherwise>
	<jsp:include page="logoutheader.jsp"></jsp:include>
</c:otherwise>
</c:choose>
	<table>
		<tr>
			<th>제목</th>
			<td>${total.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${total.mem_id}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${total.content}</td>
		</tr>
		<c:if test="${fileList.size()>0}">
		<tr>
			<th>이미지</th>
			<td>
				<c:forEach items="${fileList}" var="file">
					<img src="/photo/${file.newFileName}"/><br><br>
				</c:forEach>
			</td>
		</tr>
		</c:if>
	</table>
				<button type="button" onclick="location.href='./noticeList'">리스트</button>
<%-- 				<button type="button" onclick="location.href='delete?num=${total.num}'" class="delete">삭제</button> --%>
</body>
<script>
// function save(){
// 	var result = confirm("등록하시겠습니까?");
// 	if(result == true){
// 		alert("등록되었습니다.");
// 	}else{
// 		alert("취소하였습니다.");
// 	}
// }



</script>
</html>