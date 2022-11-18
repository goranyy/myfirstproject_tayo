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
				<button type="button" onclick="location.href='./a_noticeList'">리스트</button>
				<button type="button" onclick="location.href='./a_notice_updateForm?num=${total.num}'">수정하기</button>
				<button type="button" class="delete">삭제</button>
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


$(".delete").click(function(){
	var result = confirm("삭제하시겠습니까?");
	if(result == true){
		$(location).attr('href', 'a_notice_delete?num=${total.num}');
		alert("삭제되었습니다.");
	}else{
		alert("취소하였습니다.");
		return false;
	}
});


</script>
</html>