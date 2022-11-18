<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.apa{

	position:absolute;
	text-align:center;
	border: 1px solid black;
	height: 600px;
	width:600px;
	left:25%;
	padding: 20px;
}
table {

    margin-left:auto; 
    margin-right:auto;
    border: 1px solid #444444;
    border-color : balck;
}

td{
	padding:5px;
}
.look{
 
	text-align:center;
	position:absolute;
		border: 1px solid gold;	
	top:720px;
	height: 400px;
	width:100%;
}
.lookup{
 
	text-align:center;
	position:absolute;
		border: 1px solid gold;
	top:1130px;	
	height:400px;
	width:100%;	
}
</style>
</head>
<body>
<jsp:include page="Adminheader.jsp"></jsp:include>


<div>
	<p>마이페이지</p>
</div>
<div class="apa">
	<p>회원정보</p>
	<table class="beta">
	<tr>
	<th> </th>
	<th> </th>
	</tr>
	<tr>
	<td>
		ID 
	</td>
	<td>
		<input type="text" value="${info.mem_id}" readonly/>
			</td>
	</tr>
		<tr>
	<td>
		비밀번호
	</td>
	<td>
		<input type="text" value="${info.mem_pw }" readonly/>
	</td>
	</tr>
		<tr>
	<td>
		 email 
	</td>
	<td>
		<input type="text" value="${info.mem_email }" readonly/>
	</td>
	</tr>
		<tr>
	<td>
		 핸드폰번호 
	</td>
	<td>
		<input type="text" value="${info.mem_pnum }" readonly/>
	</td>
	</tr>	
		<tr>
	<td>
		주소 
	</td>
	<td>
		<input type="text" value="${info.mem_add }"readonly/>
	</td>
	</tr>
		<tr>
	<td>
		상세주소
	</td>
	<td>
		<input type="text"value="${info.mem_detailAdd }"readonly/>
	</td>
	</tr>
		<tr>
	<td>
		이름
	</td>
	<td>
		<input type="text" value="${info.mem_name }"readonly/>
	</td>
	</tr>
			<tr>
	<td>
		나이
	</td>
	<td>
		<input type="text" value="${info.mem_age }"readonly/>
	</td>
	</tr>
					

</table>

			
			<button onclick="location.href='./AdminMypageupdate'">수정</button> <button type="button" onclick="removeMember();">회원탈퇴</button>						

</div>

</body>
<script>
function removeMember(){
	if(window.confirm("탈퇴하시겠습니까?")){
		location.href='./remove';
	}
}

</script>
</html>