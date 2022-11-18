<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<style>
/* 삭제버튼 css / 이미지위치  */
#result_card img {
	/* max-width: 100%; */
	height: auto;
	display: block;
	padding-left: 25px;
	padding-top: 5px;
	/* margin-top: 10px;
	margin: auto; */
}
#result_card {
	position: relative;
}
.imgDeleteBtn{
	position: absolute;
	top: 5px;
	/*right: 5%;*/
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	line-height: 16px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;	
}	
</style>
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
<h3>차량 등록</h3>
	<form action="carPut" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>차량명 :</th>
			<td><input type="text" name="ca_name"/></td>
		</tr>
		<tr>
			<th>차종 :</th>
			<td>
			<!-- 차종 드롭다운  ca_model-->
			<select size="1" name="ca_model" id="ca_model" onchange="model_change()">
				<option>종류를 선택하세요.</option>
				<option value="소형" >소형</option>
				<option value="중형">중형</option>
				<option value="대형">대형</option>
				<option value="SUV">SUV</option>
			</select>

			</td>
		</tr>
		<tr>
			<th>브랜드 :</th>
			<td><input type="text" name="ca_brand"/></td>
		</tr>
		<tr>
			<th>가격 :</th>
			<td><input type="text" name="ca_price"/></td>
		</tr>
		<tr>
			<th>연료 :</th>
			<td>
				<select size="1" name="ca_fuel" id="ca_fuel" onchange="fuel_change()">
					<option>연료를 선택하세요.</option>
					<option value="휘발유">휘발유</option>
					<option value="경유">경유</option>
					<option value="LPG">LPG</option>
					<option value="전기차">전기차</option>
					<option value="하이브리드">하이브리드</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>연식 : </th>
			<td><input type="text" name="ca_age"/></td>
		</tr>
		<!-- 파일 업로드 -->
		<tr>
			<th>사진 업로드</th>
			<td>
				<div id="file">
					<input type="file" id ="files" name="files" onchange="readURL(this)" style="width: 70%;">
					<!-- <input type="submit" value="전송"> -->
					<!-- 삭제되는지 보기.. -->
					<div id="result_card">
						<!-- <div class="imgDeleteBtn" onclick="fileDelete()">x</div> -->
						<!-- <div class=uploadResult></div> -->
						<%-- <img src="/photo/${file.newFileName }" id="uploadFile" name='uploadFile' ><br/> --%>
					</div>
					<div id="uploadResult">	<!-- 업로드 미리보기 -->
					</div>
					
				</div>
			
			</td>	
		</tr>
		<tr>
			<td colspan="2" >
				<button type="button" onclick="location.href='./carList'">취소</button>
				<button id="uploadBtn">저장</button>	
			</td>
		</tr>
	</table>
	</form>
</body>

<script type="text/javascript">
// 드롭다운
function model_change(){
	var model = document.getElementById("ca_model");
	var val = model.options[ca_model.selectedIndex].value;
	
}
function fuel_change(){
	var fuel = document.getElementById("ca_fuel");
	var val = fuel.options[ca_fuel.selectedIndex].value;
}



// 파일 체크(javascript)
let regex = new RegExp("(.*?)\.(jpg|png|image|jpeg)$");	// 사용자가 이미지 파일만 올리도록
function fileCheck(fileName){
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;	
}



//미리보기 삭제

//업로드 이미지 미리보기 : 하나씩 선택하면 미리보기 출력됨
function readURL(obj){
	let reader = new FileReader();
	if(!obj.files.length){
		return;
	} else{
		var fileURL = reader.readAsDataURL(obj.files[0]);	// url
		console.log(obj.files[0]);
		for(var i=0; i<obj.files.length; i++){
			//console.log("obj.files.length: "+obj.files.length);
			reader.onload = function(e){
				var cont = "";
				cont += '<div class="imgDeleteBtn" onclick="fileDelete()">x</div>';
				$('#result_card').html(cont);
				
				
				let img = $('<img/>');
				$(img).attr('src', e.target.result);
				$(img).attr('style', "width: 40%;");
				$('#uploadResult').append(img);
				
			}			
		}
	}
	
} // readURL()

function fileDelete(){
	$("#files").val('');
	$("#result_card").remove();
	$("#uploadResult").remove();
	
}

</script>
</html>












