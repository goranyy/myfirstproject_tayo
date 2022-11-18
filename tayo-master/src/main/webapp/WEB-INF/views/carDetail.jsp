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
<!-- 관리자 -->
<h3>차량 상세보기</h3>
	<form action="carPut" method="POST">
	<table>
		<tr>
			<th>차량명 :</th>
			<td>${car.ca_name}</td>
		</tr>
		<tr>
			<th>차종 :</th>
			<td>${car.ca_model }</td>
		</tr>
		<tr>
			<th>브랜드 :</th>
			<td>${car.ca_brand }</td>
		</tr>
		<tr>
			<th>연료 :</th>
			<td>${car.ca_fuel}</td>
		</tr>
		<tr>
			<th>연식 : </th>
			<td>${car.ca_age}</td>
		</tr>
		<c:if test="${fileList.size() > 0 }">
		<tr>
			<th>사진</th>
			<td>
				<c:forEach items="${fileList }" var="file">
					<img src="/photo/${file.newFileName }" style="height: 100px;"><br/>
				</c:forEach>
			</td>		
		</tr>
		</c:if>
		<tr>
			<td colspan="2" class="btn_area">
				<button type="button" onclick="location.href='./carList'">목록보기</button>
				<button type="button" onclick="location.href='./carUpdateForm?ca_num=${car.ca_num}'">수정하기</button>	
			</td>
		</tr>
	</table>
	</form>
</body>
<script>

</script>
</html>