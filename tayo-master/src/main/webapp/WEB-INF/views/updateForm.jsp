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
<h3>수정하기</h3>
	<form action="update" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="ca_num" value="${car.ca_num}"/>
	<table>
		<tr>
			<th>차량명 :</th>
			<td>
				<input type="text" name="ca_name" value="${car.ca_name}" />
			</td>
		</tr>
		<tr>
			<th>차종 :</th>
			<td>
				<select size="1" name="ca_model" id="ca_model" onchange="model_change()">
				<c:choose>
					<c:when test="${empty car.ca_model}">
						<option value="소형">소형</option>
						<option value="중형">중형</option>
						<option value="대형">대형</option>
						<option value="SUV">SUV</option>
					</c:when>
					<c:when test="${car.ca_model eq '소형'}">
						<option value="소형" checked>소형</option>
						<option value="중형">중형</option>
						<option value="대형">대형</option>
						<option value="SUV">SUV</option>
					</c:when>
					<c:when test="${car.ca_model eq '중형'}">
						<option value="소형" >소형</option>
						<option value="중형" checked>중형</option>
						<option value="대형">대형</option>
						<option value="SUV">SUV</option>
					</c:when>
					<c:when test="${car.ca_model eq '대형'}">
						<option value="소형" >소형</option>
						<option value="중형">중형</option>
						<option value="대형" checked>대형</option>
						<option value="SUV">SUV</option>
					</c:when>
					<c:when test="${car.ca_model eq 'SUV'}">
						<option value="소형" >소형</option>
						<option value="중형">중형</option>
						<option value="대형">대형</option>
						<option value="SUV" checked>SUV</option>
					</c:when>
				</c:choose>
				</select>
			</td>
		</tr>
		<tr>
			<th>브랜드 :</th>
			<td>
				<input type="text" name="ca_brand" value="${car.ca_brand }"/>
			</td>
		</tr>
		<tr>
			<th>연료 :</th>
			<td>
				<select size="1" name="ca_fuel" id="ca_fuel" onchange="fuel_change()">
				<c:choose>
					<c:when test="${empty car.ca_fuel}">
						<option value="휘발유" >휘발유</option>
						<option value="경유">경유</option>
						<option value="LPG">LPG</option>
						<option value="전기차">전기차</option>
						<option value="하이브리드">하이브리드</option>
					</c:when>
					<c:when test="${car.ca_fuel eq '휘발유'}">
						<option value="휘발유" checked>휘발유</option>
						<option value="경유">경유</option>
						<option value="LPG">LPG</option>
						<option value="전기차">전기차</option>
						<option value="하이브리드">하이브리드</option>
					</c:when>
					<c:when test="${car.ca_fuel eq '경유'}">
						<option value="휘발유" >휘발유</option>
						<option value="경유" checked>경유</option>
						<option value="LPG">LPG</option>
						<option value="전기차">전기차</option>
						<option value="하이브리드">하이브리드</option>
					</c:when>
					<c:when test="${car.ca_fuel eq 'LPG'}">
						<option value="휘발유" >휘발유</option>
						<option value="경유">경유</option>
						<option value="LPG" checked>LPG</option>
						<option value="전기차">전기차</option>
						<option value="하이브리드">하이브리드</option>
					</c:when>
					<c:when test="${car.ca_fuel eq 'SUV'}">
						<option value="휘발유" >휘발유</option>
						<option value="경유">경유</option>
						<option value="LPG">LPG</option>
						<option value="전기차" checked>전기차</option>
						<option value="하이브리드">하이브리드</option>
					</c:when>
					<c:when test="${car.ca_fuel eq '하이브리드'}">
						<option value="휘발유" >휘발유</option>
						<option value="경유">경유</option>
						<option value="LPG">LPG</option>
						<option value="전기차">전기차</option>
						<option value="하이브리드" checked>하이브리드</option>
					</c:when>
				</c:choose>
				</select>
			</td>
		</tr>
		<tr>
			<th>연식 : </th>
			<td>
				<input type="text" name="ca_age" value="${car.ca_age}"/>
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
			<input type="file" class="real-upload" name="uploadFile" accept=".png, .jpeg, .jpg" style="height: 40px" multiple /><br/>
				<div id="uploadResult">
						<!-- 이미지 삭제버튼 -->
						<!-- 업로드된 이미지가 있다면 출력 -->
					<c:if test="${fileList.size() > 0 }">
						<c:forEach items="${fileList }" var="file">
							<div id="result_card">
								<div class="imgDeleteBtn" onclick="fileDelete()">x</div>
								<img src="/photo/${file.newFileName }" id="uploadFile" name='uploadFile' style="height: 100px" ><br/>
							</div>
						</c:forEach>
					</c:if>
				</div>	
			</td>		
		</tr>
		<tr>
			<td colspan="2" >
				<button type="button" onclick="location.href='./'">목록보기</button>
				<button type="submit" id="save">저장</button>	
			</td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript">
//드롭다운
function model_change(){
	var model = document.getElementById("ca_model");
	var val = model.options[ca_model.selectedIndex].value;
	console.log("model"+model);
	console.log("val"+val);
	
}
function fuel_change(){
	var fuel = document.getElementById("ca_fuel");
	var val = fuel.options[ca_fuel.selectedIndex].value;
	console.log("fuel"+fuel);
	console.log("val"+val);
}

// imgDeleteBtn 클릭시 삭제
function fileDelete(){
	console.log("삭제 요청!");
	// id가 uploadFile인 파일 삭제하기
	$("#result_card").remove();		
	// 삭제한 데이터 넘기기....
}

$(".save").click(function(){
	if(confirm('수정하시겠습니까?'))  
		return true;
	else  
		return false;
		
});
</script>
</html>