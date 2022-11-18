<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
.apa{
	margin: auto;
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

/*찜 목록*/
 /*  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  } */
  .col-sm-4{
  	width: 300px;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0px;
  }
  .thumbnail img {
    width: 100%;
    /* height: 100%; */
    margin-bottom: 5px;
  }
  
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #f4511e;
  }
  .carousel-indicators li {
    border-color: #f4511e;
  }
  .carousel-indicators li.active {
    background-color: #f4511e;
  }
  .thumbnail {
    border: 1px solid #f4511e; 
    border-radius:0 !important;
    float: left;
    transition: box-shadow 0.5s;
  }
  .spl_carInfo:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }







.jjimListTotal{
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

#wrap1 > div {
    float: left;
    width: 100px;
    height: 100px;
    font-size: 20px;
    line-height: 100px;
    text-align: center;
}


</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

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
		<input type="text" id="mem_id" value="${info.mem_id}" readonly/>
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
	<br>
	<br>						
	<p>회원추가 정보</p>
		<table class="crc">
	<tr>
	<th> </th>
	<th> </th>
	</tr>
	<tr>
		<td>
			결혼유무
		</td>
		<td>
		<c:set var="name" value="기혼"/>
		<c:choose>
		<c:when test="${info.mem_mar eq null}">
		 <input type="radio" name="marry" value="기혼" onclick="return(false);"/>기혼
		 <input type="radio" name="marry" value="미혼"onclick="return(false);"/>미혼 		
		</c:when>		
		<c:when test="${name eq info.mem_mar}" >
		 <input type="radio" name="marry" value="기혼" checked onclick="return(false);"/>기혼
		 <input type="radio" name="marry" value="미혼" onclick="return(false);"/>미혼 
		</c:when>
		<c:otherwise>
		<input type="radio" name="marry" value="기혼" onclick="return(false);"/>기혼
		 <input type="radio" name="marry" value="미혼" checked onclick="return(false);"/>미혼 
		</c:otherwise>	
		</c:choose>	
		</td>	
	</tr>
		<tr>
		<td>
			자녀유무
		</td>
		<td>
		<c:set var="name" value="유"/>
		<c:choose>	
		<c:when test="${info.mem_child eq null}">
		 <input type="radio" name="children" value="유" onclick="return(false);"/>유
		 <input type="radio" name="children" value="무" onclick="return(false);"/>무		
		</c:when>			
		<c:when test="${name eq info.mem_child}" >
		 <input type="radio" name="children" value="유" checked onclick="return(false);"/>유
		 <input type="radio" name="children" value="무" onclick="return(false);"/>무		 
		</c:when>
		<c:otherwise>
		 <input type="radio" name="children" value="유" onclick="return(false);"/>유
		 <input type="radio" name="children" value="무"checked onclick="return(false);"/>무			
		</c:otherwise>
		</c:choose>
		</td>

	</tr>
		<tr>
		<td>
			가족 구성원 수 
		</td>
		<td>
			<input type="text" value="${info.mem_fam }" readonly/>
		</td>

		</tr>
		<tr>
		<td>
			mbti 
		</td>
		<td>
			<input type="text"  value="${info.mem_mbti }" readonly/>
		</td>

		</tr>		
</table>

			
			<button onclick="location.href='./Mypageupdate'">수정</button> <button type="button" onclick="removeMember();">회원탈퇴</button>						

</div>
<!-- 찜목록 -->
<div id="jjimListTotal" class="container-fluid text-center bg-grey" style="width:100%; word-break:break-all;word-wrap:break-word;">
<div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail" style="float: left; display: -webkit-box; height: 350px;">	
      	<!-- <div class="jjimList"></div> -->
      </div>
      <div class="thumbnail1" style="float: left; display: -webkit-box; height: 350px;">	
      	<!-- <div class="jjimList"></div> -->
      </div>
      <div class="thumbnail2" style="float: left; display: -webkit-box; height: 350px;">	
      	<!-- <div class="jjimList"></div> -->
      </div>
      <div class="thumbnail3" style="float: left; display: -webkit-box; height: 350px;">	
      	<!-- <div class="jjimList"></div> -->
      </div>
      <div class="thumbnail4" style="float: left; display: -webkit-box; height: 350px;">	
      	<!-- <div class="jjimList"></div> -->
      </div>
    </div>
</div>
</div>




</body>
<script>
carJjimList();

<!-- 찜한 목록 -->
function carJjimList(){
	var mem_id = document.getElementById('mem_id').value;
	/* console.log("mem_id:{}", mem_id); */
	
	// 찜한 데이터 가져오기
	$.ajax({
		type: 	'GET',
		url:	'myPage_jjim',
		data:	{mem_id},
		dataType: 'JSON',
		success: function(data){
			console.log(data);
			
			var jjim	= data.jjimList;
			var file	= data.fileList;
			
			jjimListCall(jjim, file);
		},
		error: function(e){
			console.log(e);
		}
	});
}

function jjimListCall(jjim, file){
	console.log("jjim: ",jjim);
	console.log("file: ",file);
	var content = "";
	//var jjim	= jjim.jjimList;
	//var file = jjim.fileList;
	
	for(var i=0; i<jjim.length; i++){
			<!-- 차량 정보 -->
			content += '<div class="spl_carInfo">';
			content += '<img id="readPhoto" src="/photo/'+file[i].newFileName+'">';
			content += '<h3 class="ca_name">'+jjim[i].ca_name+'</h3>';
			content += '<span class="ca_info">'+jjim[i].ca_age+'년&nbsp;|&nbsp;'+jjim[i].ca_brand+'&nbsp;|&nbsp;'+jjim[i].ca_model
						+'&nbsp;|&nbsp;'+jjim[i].ca_fuel+'</span>';
			content += '<p class="pice">￦'+jjim[i].ca_price+' 원 ~</p>';
			content += '</div>';
			<!-- 상세보기 버튼 -->
			/* content += '<a href="/tayo/userCarDetail?ca_num='+jjim[i].ca_num+'" id="userCarDetail">상세보기</a>';
			content += '</div>'; */
			$(".thumbnail").html(content);
	}

}
function removeMember(){
	if(window.confirm("탈퇴하시겠습니까?")){
		location.href='./remove';
	}
}

</script>
</html>