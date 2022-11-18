<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
body{
	width: 100%;
	/* text-align: center; */
	margin-left: 200px;
}
table{
	
}
table, td, th{
	text-align: center;
	/* border: 1px solid black;  */
	border-collapse : collapse;
}
#file{
	/* 이미지 */
	width: 50%;
  
}
button {
	border: 0 none;
    background-color: transparent;
}
/*찜하기*/
button.good {
	/*빈하트*/
    position: absolute;
    float: right;
    align-items: center;
    width: 33px;
    height: 33px;
    /* margin-left: 320px;
    margin-top: 20px; */
    /* margin: 395px 0px 0px 30px; */
    font-size: 0;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_m_good.png");
    background-repeat: no-repeat;
    text-indent: -9999px;
    align-self: flex-start;
}
button.good_full {
	/* 빨간 하트 */
    position: absolute;
    float: right;
    align-items: center;
    width: 33px;
    height: 33px;
    /* margin-left: 320px;
    margin-top: 20px; */
    /* margin: 395px 0px 0px 30px; */
    font-size: 0;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_m_good.png");
	background-position: 0 -43px;
    background-repeat: no-repeat;
    text-indent: -9999px;
    align-self: flex-start;
}
button#carList{
	/*차량목록보기 버튼*/
	display: inline-block;
    width: 450px;
    margin: 40px 25px;
    height: 40px;
    line-height: 60px;
    text-align: center;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    border-radius: 50px;
    color: #fff;
    letter-spacing: -1.3px;
    background: #2d467b;
}
#carList:hover {
	cursor: pointer;
	opacity: 0.7;
}
.spl_tripInfo:hover  {
	cursor: pointer;
	opacity: 0.5;
   /*  transition: 0.3s; */
}
.tripImg{
	display: inline-block;
}
.rentcar{	
	display: inline-block;
	
	/* width: 300px;
	height: 400px;; */

}
.rentImg_o0, .rentImg_o1{
	width: 33%;
	text-align: left;
	float: left; 
}
 .rentImg_o2{
	/* text-align: left; */
	width: 33%;	
	float: right; 
}  
.rent_info{
	/* float: center; */
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
<!-- 	<button onclick="location.href='TogetherwriteForm'">글 작성하기</button> -->
</c:when>
<c:when test="${power eq 1}">
	<jsp:include page="Adminheader.jsp"></jsp:include>
<!-- 	<button onclick="location.href='TogetherwriteForm'">글 작성하기</button> -->
</c:when>
<c:when test="${power eq 0}">
	<jsp:include page="header.jsp"></jsp:include>
	<!-- <button onclick="location.href='TogetherwriteForm'">글 작성하기</button> -->
</c:when>
<c:otherwise>
	<jsp:include page="logoutheader.jsp"></jsp:include>
</c:otherwise>
</c:choose>
<!-- 사용자 -->
<h3>차량 상세보기</h3>
	<table>
		<tr>
			<!-- <th>찜하기</th> -->
			<td>
				<span class="btn" id="detailShareDiv"></span>		
			</td>
		</tr>
		<c:if test="${fileList.size() > 0 }">
		<tr>
			<!-- <th>사진</th> -->
			<td colspan="2">
				<c:forEach items="${fileList }" var="file">
					<img src="/photo/${file.newFileName }" id="file"><br/> <!-- height: 100px; -->
				</c:forEach>
			</td>		
		</tr>
		</c:if>
		<tr>
			<!-- <th>차량명 :</th> -->
			<td colspan="2" style=" font-size: x-large;  font-weight: bolder;" >${car.ca_name}</td>
		</tr>
		<tr>
			<!-- <th>가격 :</th> -->
			<td colspan="2" style=" font-size: x-large;  font-weight: bolder;">${car.ca_price } 원</td>
		</tr>
		<tr>
			<th style="text-align: center; ">차종 :</th>
			<td>${car.ca_model }</td>
		</tr>
		<tr>
			<th style="text-align: center;">브랜드 :</th>
			<td>${car.ca_brand }</td>
		</tr>
		<tr>
			<th style="text-align: center;">연료 :</th>
			<td>${car.ca_fuel}</td>
		</tr>
		<tr>
			<th style="text-align: center;">연식 : </th>
			<td>${car.ca_age}</td>
		</tr>
		<tr>
			<td colspan="2" class="btn_area">
				<button type="button" id="carList" onclick="location.href='/tayo/userCarList'">차량 목록 보기</button>
			</td>
		</tr>
	</table>
	<p>렌터카 추천</p>
	<div class="rentcar">
		<span><!-- 렌트카 이미지 --></span>
		<span><!-- 렌트카 정보 --></span>
	</div>
	
	<p>여행지 추천</p>
	<div class="tripImg">
	</div>
		
	
	
</body>
<script>
carDetailCall_call();
tripInfo();
rentCar();

function carDetailCall_call(){
	var msg = "${msg}";
	var url = "${url}";
	if(msg != ""){
		alert(msg);
		document.location.href = url;
		location.replace();
	} else{
		jjim(${car.ca_num});	// 상세보기 요청된 해당 ca_num	
	}
}

function rentCar(){
	var content ="";
	$.ajax({
		type: "post",
		/* dataType: "json",*/
		url: "rentCar", // 요청보낼 url
		data: {},
		success: function(data){
			console.log("rentCar"+data);
			
			for(var i=0; i<data.rentCar.length; i++){
				//content = "";
				///content += '<div class="spl_tripInfo" title="'+data.tripInfo[i].tr_name+'" style="display: relative;">';
				content += '<div class="rentImg_o'+i+'"><img src="././resources/tayo.png" class="rentImg" title="'+data.rentCar[i].tr_name+'" style="display: absolute; width: 10%; border-radius: 20px; margin: 10px; 10px;"/>'; // 이미지
				content += '<div class="rent_info"><div id="rent_info"><b>렌트카 업체&nbsp|&nbsp</b>'+data.rentCar[i].ren_name+'</div>';
				content += '<div id="rent_info"><b>주소&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp</b>'+data.rentCar[i].ren_location+'</div>';
				content += '<div id="rent_info"><b>렌트 최저가&nbsp|&nbsp</b>'+data.rentCar[i].ren_midprice+'&nbsp원</div></div><br/></div>';
				//content += '<p class="spl_tripInfo ca_name"><img src="/photo/'+data.tripInfo[i].newFileName+'"  style="width: 20%;"/>'+data.tripInfo[i].tr_name+'</p>'; // 이미지
				//content += '</div>';
				//content += '<p class="ca_name">'+data.tripInfo[i].tr_name+'</p>'; // 여행지명
				$(".rentcar").html(content);
				
			}
			
		} 
	});
}
function tripInfo(){
	var content ="";
	$.ajax({
		type: "post",
		/* dataType: "json",*/
		url: "tripInfo", // 요청보낼 url
		data: {},
		success: function(data){
			console.log(data.tripInfo.length);
			//console.log(data.tripInfo[0].newFileName);
			//console.log(data.tripInfo[0].tr_name);
			
			for(var i=0; i<data.tripInfo.length; i++){
				//content = "";
				///content += '<div class="spl_tripInfo" title="'+data.tripInfo[i].tr_name+'" style="display: relative;">';
				content += '<img src="/photo/'+data.tripInfo[i].newFileName+'" class="spl_tripInfo" title="'+data.tripInfo[i].tr_name+'" style="display: absolute; width: 25%; border-radius: 20px; margin: 10px; 50px;"/>'; // 이미지
				//content += '<p class="spl_tripInfo ca_name"><img src="/photo/'+data.tripInfo[i].newFileName+'"  style="width: 20%;"/>'+data.tripInfo[i].tr_name+'</p>'; // 이미지
				//content += '</div>';
				//content += '<p class="ca_name">'+data.tripInfo[i].tr_name+'</p>'; // 여행지명
				$(".tripImg").html(content);
				
			}
			
		} 
	});
}

function jjim(ca_num){
	console.log(ca_num); 
	var content = "";
	
	// 찜하기 버튼
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "jjimChk", 
		data: {ca_num},
		success: function(result){
			//alert(result);
			if(result ==1){
				// 꽉 찬 하트 =1
				content = "";
				content += '<span class="good" title="">';
				content += '<button type="button" class="good_full" onclick="jjimDel('+ca_num+');" id="good_button" title="찜완료">';
				content += '<span>&nbsp찜하기</span>';
				content += '</button>';
				content += '</span>';
				$("#detailShareDiv").html(content);
			} else if(result ==0){
				// 빈 하트 =0
				content = "";
				content += '<span class="good" title="">';
				content += '<button type="button" class="good" onclick="jjimSet('+ca_num+');" id="good_button" title="찜취소">';
				content += '<span>&nbsp찜하기</span>';
				content += '</button>';
				content += '</span>';
				$("#detailShareDiv").html(content);
			}
		},
		error: function(e){
			console.log("찜 조회 에러..");
			alert('찜하기 불러오기 실패');
		}
	});
	
}


<!-- 찜하기 -->
function jjimSet(ca_num){
	console.log(ca_num);
	
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "jjimSet", 
		data: {ca_num},
		success: function(result){
			console.log(result);
			// 빨간 하트 그리기
			content = "";
			content += '<span class="good" title="">';
			content += '<button type="button" class="good_full" onclick="jjimDel('+ca_num+');" id="good_button" title="찜완료">';
			content += '<span>&nbsp찜하기</span>';
			content += '</button>';
			content += '</span>';
			$("#detailShareDiv").html(content);
		},
		error: function(e){
			alert('찜하기 실패..');
		}
	});
}

<!-- 찜 취소 -->
function jjimDel(ca_num){
	console.log(ca_num);
	
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "jjimDel", 
		data: {ca_num},
		success: function(result){
			console.log(result);
			// 빈하트 그리기
			content = "";
			content += '<span class="good" title="">';
			content += '<button type="button" class="good" onclick="jjimSet('+ca_num+');" id="good_button" title="찜취소">';
			content += '<span>&nbsp찜하기</span>';
			content += '</button>';
			content += '</span>';
			$("#detailShareDiv").html(content);
		},
		error: function(e){
			alert('찜 삭제 실패..');
		}
	});
}


</script>
</html>