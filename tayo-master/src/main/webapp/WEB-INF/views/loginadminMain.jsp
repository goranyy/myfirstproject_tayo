<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>


<style>

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
   background-color: #fefefe;
   margin: 7% auto; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 30%; /* Could be more or less, depending on screen size */
}

#modal-notice {
font-size: 13pt;
text-align: center;
}

#input-body {
font-size: 13pt;
font-weight: bold;
}

div.left {
    width: 50%;
    float: left;
    text-align: center;
    box-sizing: border-box;
}
div.right {
    width: 50%;
    float: right;
    box-sizing: border-box;
}

.modal-content2 {
margin: 7% auto;
padding: 20px;
border: 1px solid #888;
}
/* 추가한 style */
p {
    margin: 10px -10px 0;
}

button.hashbtn {
  border: 0;
    outline: none;
    width: 200px;
    height: 80px;
    border-radius: 30px;
    font-size: 15px;
    font-weight: bold;
    margin: 30px;
    /* box-shadow: 3px 3px 3px #286090, -3px -3px 3px #286090; */
    transition: 0.3s;
}


button.hashbtn:hover {
  box-shadow: -3px -3px 3px rgb(172, 172, 172), 3px 3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}
.carousel-inner>.item>img {	/*인기차량 6개*/
	/* width: 40%;  */
    /* height: 450px;*/
    margin: auto;
	margin-left: 14em;
    text-align: center;
    float: left;
    /* min-height:200px; */
}
.carousel-inner p{
	font-size: 13px;
}
/* carousel-indicators {
	width: 12px;
    height: 12px;
    margin: 0;
    background-color: #2d467b;
} 
.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #2d467b;
    background-color: rgba(0,0,0,0);
    border: 1px solid #2d467b;
    border-radius: 10px;
} */
.carousel-control {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    /* width: 30%; */
    font-size: 20px;
    color: #2d467b;
    text-align: center;
    text-shadow: 0 1px 2px rgb(0 0 0 / 60%);
    background-color: rgba(0,0,0,0);
    filter: alpha(opacity=50);
    opacity: .5;
}
/* Hide the carousel text when the screen is less than 600 pixels wide */
@media (max-width: 600px) {
.carousel-caption {
	display: none; 
}
.col-sm-3 {
	/* width: 20em; */
}
}	/* 추가한 style */
p {
    margin: 10px -10px 0;
}

button.hashbtn {
  border: 0;
    outline: none;
    width: 200px;
    height: 80px;
    border-radius: 30px;
    font-size: 15px;
    font-weight: bold;
    margin: 30px;
    /* box-shadow: 3px 3px 3px #286090, -3px -3px 3px #286090; */
    transition: 0.3s;
}


button.hashbtn:hover {
  box-shadow: -3px -3px 3px rgb(172, 172, 172), 3px 3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}
.carousel-inner>.item>img {	/*인기차량 6개*/
	/* width: 40%;  */
    /* height: 450px;*/
    margin: auto;
	margin-left: 14em;
    text-align: center;
    float: left;
    /* min-height:200px; */
}
.carousel-inner p{
	font-size: 13px;
}
/* carousel-indicators {
	width: 12px;
    height: 12px;
    margin: 0;
    background-color: #2d467b;
} 
.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #2d467b;
    background-color: rgba(0,0,0,0);
    border: 1px solid #2d467b;
    border-radius: 10px;
} */
.carousel-control {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    /* width: 30%; */
    font-size: 20px;
    color: #2d467b;
    text-align: center;
    text-shadow: 0 1px 2px rgb(0 0 0 / 60%);
    background-color: rgba(0,0,0,0);
    filter: alpha(opacity=50);
    opacity: .5;
}
/* Hide the carousel text when the screen is less than 600 pixels wide */
@media (max-width: 600px) {
.carousel-caption {
	display: none; 
}
.col-sm-3 {
	/* width: 20em; */
}
}	

</style>
</head>
<body>
<jsp:include page="Adminheader.jsp"></jsp:include>
 

<!-- 메인 추가한 부분 -->
<!-- 해시태그 입력 예정 -->
<div class="container text-center">    
  <br>
  <div class="row">
    <div class="col-sm-3" id="col1">
    </div>
    <div class="col-sm-3" id="col2">
    </div> 
    <div class="col-sm-3" id="col3">
    </div>
    <div class="col-sm-3" id="col4">
    </div> 
  </div>
  <div class="row">
    <div class="col-sm-3" id="col5">
    </div>
    <div class="col-sm-3" id="col6">
    </div> 
    <div class="col-sm-3" id="col7">
    </div>
    <div class="col-sm-3" id="col8">
    </div> 
  </div>
  <hr>
</div>


<!-- 인기차량 6개 띄우기 -->
<div class="container">
  <h2>실시간 인기 차량</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">

    <!-- Wrapper for slides -->
    <div class="carousel-inner" onclick="location.href='./carPopulList'">
      <div class="item active">
        <img src="item1" id="item1" style="width: 400px; height: 300px;">
        <p id="p_item1"></p> 
      </div>

      <div class="item" >
        <img src="item1" id="item2" style="width: 400px; height: 300px;">
        <p id="p_item2"></p> 
      </div>
    
      <div class="item">
        <img src="item3" id="item3" style="width: 400px; height: 300px;">
        <p id="p_item3"></p> 
      </div>
      
      <div class="item">
        <img src="item4" id="item4" style="width: 400px; height: 300px;">
        <p id="p_item4"></p> 
      </div>

      <div class="item" >
        <img src="p_item5" id="item5" style="width: 400px; height: 300px;">
        <p id="p_item5"></p> 
      </div>
    
      <div class="item">
        <img src="p_item6" id="item6" style="width: 400px; height: 300px;">
        <p id="p_item6"></p> 
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</body>
<script>
mainListCall();

/* 해시태그/차정보 */
function mainListCall(){
	// 차 > 조회수 기준으로 가져오기
	$.ajax({
		type:	'GET',
		url:	'mainListCall', // 기존 메서드 이용(인기차량)
		data:	{},	
		dataType: 'JSON',
		success	: function(data){
			//console.log(data.carPopulList);
			//console.log(data.mainListCall); // 해시태그
			drawlist(data);			
		}		
	});
}

function drawlist(data){
	var content = "";
	var list = data.carPopulList;
	var hash = data.mainListCall;
	//console.log(hash);
	
	// 해시태그
	for(var i=0; i<4; i++){
		console.log(hash[i].ha_num);
		//console.log(hash[i].ha_value);
		content = "";
		content += '<button class="hashbtn" id="well'+[i+1]+'" onclick="location.href=\'./hashCarList?ha_value='+hash[i].ha_value+'\'">';
		content += '<p id="h1"><span id="ha_num">'+hash[i].ha_value+'</span></p>';
		content += '</button>';
		$("#col"+(i+1)).empty();
		$("#col"+(i+1)).append(content);
	}
	for(j=4; j<8; j++){
		console.log(hash[j].ha_num);
		content = "";
		content += '<button class="hashbtn" id="well'+[j+1]+'" onclick="location.href=\'./hashCarList?ha_value='+hash[i].ha_value+'\'">';
		content += '<p id="h1"><span id="ha_num">'+hash[j].ha_value+'</span></p>';
		content += '</button>';	
		$("#col"+(j+1)).empty();
		$("#col"+(j+1)).append(content);
	}		

	
	// 차량정보
	for(var i=0; i<6; i++){
		//console.log(list[i]);
		var itemImg = document.getElementById('item'+(i+1));
		itemImg.setAttribute("src", '/photo/'+list[i].newFileName+'');
	
		var itemCnt = document.getElementById('p_item'+(i+1));
		
		content = "";
		content += '<div class="spl_carInfo">';
		content += '<h3 class="ca_name">'+list[i].ca_name+'</h3>';
		content += '<span class="ca_info">'+list[i].ca_age+'년&nbsp;|&nbsp;'+list[i].ca_brand+'&nbsp;|&nbsp;'+list[i].ca_model
					+'&nbsp;|&nbsp;'+list[i].ca_fuel+'</span>';
		content += '<p class="pice">￦'+list[i].ca_price+' 원 ~</p>';
		content += '</div>';
		content += '<div>';
		<!-- 상세보기 버튼 -->
		/* content += '<a href="/tayo/userCarDetail?ca_num='+list[i].ca_num+'" id="userCarDetail">상세보기</a>'; */
		content += '</div>';
		$("#p_item"+(i+1)).html(content);
	}
}



</script>
</html>