<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
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
	<form action="Qnawrite" method="POST" enctype="multipart/form-data">
	<!-- enctype="multipart/form-data" : 사진 들어가유 -->
	<!-- 양이 많아지면 끊길 수 있기 때문에 post -->
	<h3>고객센터</h3>
		<table class="table table-striped">
			<tr>
				<th>제목</th>
				<td colspan="2"><input type="text" name="title" placeholder="제목" value=""/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="mem_id" value="${sessionScope.loginId }" readonly/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea name="content"  class="contentt" placeholder="내용을 입력해주세요" /></textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo" multiple="multiple"/></td>
			</tr>
			<tr>
				<td colspan="2" class="btn_area">
					<button type="button" onclick="location.href='./Qnalist'">취소</button>
					<button id="insertQ">등록하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
/*
var titleval = $('input[name=title]').val();
var contentval = $('input[name=content]').val();

$("#insertQ").click(function() {
	if(titleval==''){
         alert("제목을 입력해 주세요");
         $titleval.focus();
      }else if(contentval==''){
         alert("내용을 입력해 주세요");
      	$contentval.focus();
      }else ($pw.val()==''){
    	  alert("등록되었습니다.")
      })
      */
      
      $("#insertQ").click(function(){
    	  
    	   var title = $('input[name=title]').val();
    	   var content = $('.contentt').val();
    	   var file = $('input[name=photo]').val();
    	   
    	   if(title==''){
    		   
    	      alert("제목을 입력해주세요");
    	      $('title').focus();
    	      return false;
    	      
    	   }else if(content==''){
    	      alert("내용을 입력해주세요");
    	      $('content').focus();
    	      return false;
    	      
    	   }else if(file<5){
    	      alert("사진 등록은 최대 5개 입니다.");
    	      return false;
    	   }
    	});
    	
</script>
</html>

