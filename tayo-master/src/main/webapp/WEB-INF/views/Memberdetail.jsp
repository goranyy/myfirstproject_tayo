<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
table {

    margin-left:auto; 
    margin-right:auto;
    border: 1px solid #444444;
    border-color : black;
}

td{
	padding:5px;
}
.apa{

	position:absolute;
	text-align:center;
	
	height: 400px;
	width:600px;
	left:25%;
	padding: 20px;
} 

</style>
</head>
<body>
<%
String loginId = (String)session.getAttribute("loginId");
%>
<jsp:include page="Adminheader.jsp"></jsp:include>
 <p>회원 상세보기</p>
<div class="apa">
<div>
	<form action="Memberdetailupdate" method="post">
 <table>
 	<tr>
 		<th></th>
 		<th></th>
 		<th></th>
 		<th></th>
 	</tr>
 	<tr>
 		<td>
 			회원아이디
 		</td>
 		<td>
 			<input type="text" name="mem_id" value="${info.mem_id}" readonly/>
 		</td>
 		<td>
 			이름
 		</td>
 		<td>
 			<input type="text" name="mem_name" value="${info.mem_name}" readonly/>
 		</td>
 	</tr>
  	<tr>
 		<td>
 			비밀번호
 		</td>
 		<td>
 			<input type="text" name="mem_pw" value="${info.mem_pw}" readonly/>
 		</td>
 		<td>
 			email
 		</td>
 		<td>
 			<input type="text" name="mem_email" value="${info.mem_email}" readonly/>
 		</td>
 	</tr>
 	  	<tr>
 		<td>
 			나이
 		</td>
 		<td>
 			<input type="text" name="mem_age" value="${info.mem_age}" readonly/>
 		</td>
 		<td>
 			주소
 		</td>
 		<td>
 			<input type="text" name="mem_add" value="${info.mem_add}" readonly/>
 		</td>
 	</tr>
 	<tr>
 		<td>
 			비공개처리 횟수
 		</td>
 		<td>
 			<input type="text" name="mem_bcnt" value="${info.mem_bcnt}" readonly/>
 		</td>
 		<c:choose>
 		<c:when test="${info.mem_power eq '0'}">
 		<td>
 			관리자권한
 		</td>
 		<td>회원입니다</td>
 		</c:when>
 		<c:otherwise>
 		<td>
 			관리자권한 
 		</td>
 		<td>관리자입니다</td>
 		</c:otherwise>		
 		</c:choose>
 		</tr>

		
<%--  		<c:choose>
 		<c:when test="${loginId eq 'admin' and info.mem_power eq 0}">
 		<td>
 			관리자권한 추가
 		</td>
 		<td>
 			<input type="checkbox" name="mem_power" value=""/>
 		</td> 		
 		</c:when>
 		<c:when test="${loginId eq 'admin' and info.mem_power eq 1}">
 		<td>
 			관리자권한 
 		</td>
 		<td>
 			<input type="radio" name="mem_power" value="추가"/>추가
 			<input type="radio" name="mem_power" value="삭제"/>삭제
 		</td>  		
 		</c:when>
 		<c:otherwise></c:otherwise>
 		</c:choose>  --%>
 	<tr>
 		<c:if test="${loginId eq 'admin'}">
 		<td>
 			관리자권한 
 		</td>
 		<td>
 			<input type="radio" id="mem_power" name="mem_power" value="1"/>추가
 			<input type="radio" id="mem_power" name="mem_power" value="0"/>삭제
 		</td>		
 		</c:if> 
 	</tr>
 </table>
 <c:if test="${loginId eq 'admin'}">
 	<button>수정완료</button>
 	</c:if> 
 </form>
 	<button onclick="location.href='./MemberList'">리스트</button>
 </div>

 
 </div>
 
</body>
<script></script>
</html>