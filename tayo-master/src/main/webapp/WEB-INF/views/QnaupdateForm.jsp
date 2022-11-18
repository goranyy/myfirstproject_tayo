<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- script 순서 중요!, script 자동생성시 type/src 주의!!  -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
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
   <form action="Qnaupdate" method="POST" enctype="multipart/form-data">
   <input type="hidden" name="num" value="${Qnadto.num}"/>
   <h3>고객센터</h3>
   
      <table class="table table-striped">
         <tr>
         	<th>제목</th>
				<td colspan="2">
					<input type="text" name="title" value="${Qnadto.title}"/>
				</td>
         </tr>
         <tr>
         	<th>작성자</th>            
            	<td>${Qnadto.mem_id}</td>
           </tr>
            <tr>
           		 <th>작성일</th>   
           	 		<td>${Qnadto.to_date}</td>         
         </tr>         
         <tr>
         	<th>내용</th>
            	<td colspan="2">
               		<textarea name="content">${Qnadto.content}</textarea>
            </td>
         </tr>
		<tr>
			<th>이미지</th>
			<td>
				<p><input type="file" name="photo" multiple="multiple"/></p>
				<c:forEach items="${fileList}" var="file">
					<img src="/photo/${file.newFileName}"/><br><br>
				</c:forEach>
			</td>
		</tr>
         <tr>
            <td colspan="2" class="btn_area">
               <button type="button" onclick="location.href='./Qnalist'">취소</button>
               <button type="submit" class="updateQ" >수정하기</button>
            </td>
         </tr>      
      </table>
   </form>
</body>
<script>
$(".updateQ").click(function() {
	if(confirm("수정하시겠습니까?")){
		alert("수정되었습니다.")
	}
})

</script>
</html>