<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<style>
	img{
   		width: 50px;
   		height: 50px;
   		float: left;
   		text-align: center;
	}
	
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	p {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
	}
</style>
</head>
<body>

	<div id="toggle">
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
					<img src="/photo/${file.newFileName}"/>
				</c:forEach>
			</td>
		</tr>
		</c:if>
	</table>
	</div>
				<button type="button" onclick="location.href='./a_reviewList'">리스트</button>
				<%-- <button type="button" onclick="location.href='./a_review_updateForm?num=${total.num}'">수정하기</button> --%>
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
		$(location).attr('href', 'a_review_delete?num=${total.num}');
		alert("삭제되었습니다.");
	}else{
		alert("취소하였습니다.");
		return false;
// 		$(location).attr('href', "http://localhost:8080/tayo/a_reviewList");
	}
});

const $toggle = document.querySelector(".toggleSwitch");

var check = $("input[type='checkbox']");
check.click(function(){
	$("p").toggle();
});

var check = $("input[type='checkbox']");
check.click(function(){
	$("#toggle").toggle();
});


</script>
</html>