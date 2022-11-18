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
	<form action="a_notice_update" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${total.num}"/>
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${total.title}" class="chkTitle"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="mem_id" value="${total.mem_id}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="chkContent">${total.content}</textarea></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<p><input type="file" name="photo" class="chkFile"></p>
				<c:forEach items="${fileList}" var="file">
					<img src="/photo/${file.newFileName}"/><br><br>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="btn_area">
				<button type="button" onclick="location.href='./a_noticeList'">리스트</button>
				<button class="save">저장</button>
			</td>
		</tr>
	</table>
	</form>
</body>
<script>
$(".save").click(function(){
	if(confirm('수정하시겠습니까?'))  
		return true;
	else  
		return false;
});

$(".save").click(function(){
	var title = $(".chkTitle").val();
	var content = $(".chkContent").val();
	var file = $(".chkFile").val();
	if(title==''){
		alert("제목을 입력해주세요");
		return false;
	}else if(content==''){
		alert("내용을 입력해주세요");
		return false;
	}else if(file>5){
		alert("등록개수는 최대 5개 입니다.");
		return false;
	}
});
</script>
</html>