<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
}	

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
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
   <!-- Modal -->
   <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
         <button type="button" class="close" data-dismiss="modal" onClick="close_pop();" 
         style="float: right; width: 35px; height: 35px; font-size: 22pt;" >
         &times;
         </button>
         <br>
         <div class="modal-header">
            <p style="font-size: 24pt; text-align: center;">이벤트</p>
         </div>   
      <div class="modal-body">
         <p id="modal-notice">
            <span>타볼래 첫 번째 이벤트!!</span>
            <br>
            <span>설문에 참여해 주시면 추첨을 통해</span>
            <br>
            <span>소정의 상품을 드려요!</span>
         </p>
         <p id="modal-notice">
            <span>맥북 (1명)</span>
            <br>
            <span>네이버 포인트 10만원 (1명)</span>
            <br>
            <span>비비큐 황금 올리브 유 (3명)</span>
            <br>
         </p>
         <br>
         <!-- 입력 칸 -->
         <div id = "input-body">
            <div class="left" style="line-height:30px">
               결혼 유무
            </div>
            <div class="right" style="line-height:30px">
               <input type="radio" name="marry" value="기혼"> 기혼
               &nbsp; &nbsp; &nbsp;
               <input type="radio" name="marry" value="미혼"> 미혼
            </div>
            <br>
            <div class="left" style="line-height:30px">
               자녀 유무
            </div>
            <div class="right" style="line-height:30px">
               <input type="radio" name="children" value="유"> 유
               &nbsp; &nbsp; &nbsp; &nbsp; 
               <input type="radio" name="children" value="무"> 무
            </div>
            <br>   
            <div class="left" style="line-height:30px">
               가족 구성원 수
            </div>   
            <div class="right" style="line-height:30px">
               <input type="text" style="width:100px" id="familly">
            </div>   
            <br>
            <div class="left" style="line-height:30px">
               MBTI
            </div>
            <div class="right" style="line-height:30px">
               <input type="text" style="width:100px" id="mbti">
               <br>
               <button id="mbtiOpen">mbti 목록</button>
            </div>
            <br>
            <br>
            <br>
            <br>
         </div>
      </div>
      <div style="text-align: center;">
         <button id="submit" type="submit" 
         style="background-color: gray; cursor: pointer; text-align: center; 
         padding-top: 10px; padding-bottom: 10px; border-color: gray;
         width: 200px; height: 50px; font-size: 14pt; color: white;">
            제출
         </button>
      </div>
      </div>
   </div>
   
   <!-- Modal -->
  <div class="modal" id="mbtiImg" role="dialog" style="position: fixed;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content2">
        <div class="modal-body2">
             <img src="resources/img/mbti.PNG" style="float: left;">
        <div style="float: left;">
        <button type="button" class="close" data-dismiss="modal" onClick="close_mbtiOpen()" 
            style="width: 35px; height: 35px; font-size: 22pt; position: absolute;">&times;</button>
            </div>
        </div>
      </div>
      
    </div>
   </div>

</body>
<script>
// var familly;
// var mbti;
var seMbti = '<%=(String)session.getAttribute("mbti")%>';
var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
var mbtiRule = /^[a-zA-Z]{4}$/;

jQuery(document).ready(function() {
   if(seMbti=='0'){
         $('#myModal').show();
   }else{
      close_pop();
   }
});

function close_pop(flag) {
 $('#myModal').hide(); //모달 닫기
};


$("#mbtiOpen").click(function(){
   $('#mbtiImg').show();
})

$("#mbtiImg").click(function(){
   $('#mbtiImg').hide();
})

function close_mbtiOpen(){
   $('#mbtiImg').hide();
}


// 전송
$("#submit").click(function(){
   $marry = $("input[name='marry']:checked");
   $children = $("input[name='children']:checked");
   var familly = document.getElementById("familly").value;
   var mbti = document.getElementById("mbti").value;
   
   if($marry.val()==null){
      alert("결혼 여부를 선택해 주세요");
   }else if($children.val()==null){
      alert("자녀 여부를 선택해 주세요");
   }else if(familly=='' || familly==null){
      alert("가족 구성원 수를 입력해 주세요");
      document.getElementById("familly").focus();
   }else if(familly.match(reg) == null){
      alert("가족 구성원 수는 숫자만 입력해 주세요");
      document.getElementById("familly").focus();
   }else if(mbti=='' || mbti==null){ // 여긴 수정중
      alert("MBTI를 입력해 주세요");
      document.getElementById("mbti").focus();
   }else if( (mbti!='ISTJ')&&(mbti!='ISFJ')&&(mbti!='INFJ')&&(mbti!='INTJ')&&
         (mbti!='ISTP')&&(mbti!='ISFP')&&(mbti!='INFP')&&(mbti!='INTP')&&
         (mbti!='ESTP')&&(mbti!='ESFP')&&(mbti!='ENFP')&&(mbti!='ENTP')&&
         (mbti!='ESTJ')&&(mbti!='ESFJ')&&(mbti!='ENFJ')&&(mbti!='ENTJ')&&
         (mbti!='istj')&&(mbti!='isfj')&&(mbti!='infj')&&(mbti!='intj')&&
         (mbti!='istp')&&(mbti!='isfp')&&(mbti!='infp')&&(mbti!='intp')&&
         (mbti!='estp')&&(mbti!='esfp')&&(mbti!='enfp')&&(mbti!='entp')&&
         (mbti!='estj')&&(mbti!='esfj')&&(mbti!='enfj')&&(mbti!='entj') )
      {
         console.log(mbti);
         alert("MBTI를 정상적으로 입력해 주세요");
         document.getElementById("mbti").focus();
      }
   
   else if(mbti.match(mbtiRule) == null){
      alert("영어만 입력해 주세요.(4글자)");
      document.getElementById("familly").focus();
   }else {
      var param ={};
      param.marry = $marry.val();
      param.children = $children.val();
      param.familly = familly;
      param.mbti = mbti;
       $.ajax({
         type:'POST',
         url:'eventPage',
         data:param, //object 형태로 담은 데이터를 보냄
         dataType:'JSON',
         success:function(data){
            if(data.row>0){
               alert("이벤트 응모가 완료되었습니다.");
               location.href="./loginMain";
            }else{
               alert("오류 발생\n이벤트 응모에 실패했습니다.\n이 현상이 반복된다면 관리자에게 문의해 주세요");               
            }
            close_pop();
         },
         error:function(e){
            console.log(data);
         }
      });
   }
});


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