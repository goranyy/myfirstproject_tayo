<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.board_pagetab { text-align: center; }
.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
.on a { font-weight: bold; }

<style>
.board_pagetab { text-align: center; }
.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
.on a { font-weight: bold; }

.dropdown{
  position : relative;
  display : inline-block;
}

.dropbtn_icon{
  font-family : 'Material Icons';
}
.dropbtn{
  border : 1px solid rgb(37, 37, 37);
  border-radius : 4px;
  background-color: #f5f5f5;
  font-weight: 400;
  color : rgb(37, 37, 37);
  padding : 12px;
  width :200px;
  text-align: left;
  font-size : 12px;
}
.dropdown-content{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
  font-weight: 400;
  background-color: #f9f9f9;
  min-width : 200px;
}

.dropbtn{
 cursor : default;
 }

.dropdown-content input{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 12px;
  padding : 12px 20px;
  text-align: center;
  margin: 0px 5px;
    cursor : pointer;
}

.dropdown-content input:hover{
  background-color : #ececec
}

.dropdown:hover .dropdown-content {
  display: block;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.secret{
	display: none;
}

.inputmargin{
	margin: 2px 0.5px;
	width: 100px;
	text-align: center;

}

.dropbtn{
	margin-left: 5px;
}




#listAll {
	border: 1px solid gray;
	width: 90em;
	height: 900px;
	margin: auto;
	padding-left: 7em;
}
div.card-body {
	border: 2px gray;
	width: 15em;
	height: 10em;
	border-radius: 20px;
	text-align: center;
	float: left;
	display: inline-block
}

#userCarDetail {
	text-align: left;
}
 /*   팝업 임시 버튼 스타일  */
        .btn-box .btn-open {
            display: block;
            width: 200px;
            height: 50px;
            margin: 80px auto 0;
            line-height: 50px;
            background: #333;
            text-align: center;
        }

        .btn-box .btn-open span {
            color: #fff;
        }

/* 팝업 스타일 */
.modal-bg {
	display:none;
	width:100%;
	height:100%;
	position:fixed;
	top:0;
	left:0;
	right:0;
	background: rgba(0, 0, 0, 0.6);
	z-index:999;
}
   

div .header {
	margin: auto;
	height: 40px;
}

.closeBtn{ /*팝업 x 버튼*/
	position: absolute;
	top: 7px;
	right: 15px;
	background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_pop_close03.png");
	font-weight: 900;
	width: 35px;
	height: 35px;
	border-radius: 50%;
	line-height: 16px;
	display: block;
	cursor: pointer;		
}


.container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl, .container-xxl {
    width: 100%;
    padding-right: var(--bs-gutter-x,.75rem);
    padding-left: var(--bs-gutter-x,.75rem);
    margin-right: auto;
    margin-left: auto;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
    font-weight: 300;
    font-family: 'Apple SD Gothic Neo';
    font-weight: normal;
    flex-shrink: 0;
    letter-spacing: -0.3px;
}

strong {	/*간편보기 글씨*/
    font-weight: bold;
}

/*차량목록*/
#box-items {
    list-style:none;
    width: 100%;
 	 margin-left: auto;
 	 margin-right: auto;
}
.pr_list {
	margin: 40px 0px;
	padding: 10px 10px;
}
.container-fluid{
	positon :relative;
	width: 90%;
	text-align: center;
    padding-right: var(--bs-gutter-x,.75rem);
    padding-left: var(--bs-gutter-x,.75rem);
    margin: 0 auto;
}


.container-fluid .pr_list > li #a {
    display: flex;
    flex-direction: column;
    width: 380px;
    height: 450px;
    margin: 20px 20px;
    box-sizing: border-box;
    border: 1px solid #d9d9d9;
    border-radius: 10px;
    float: left;
    cursor: pointer; 
}


.container-fluid .pr_list > li .item_box .option_box .option_list li {
    display: flex;
    margin-top: 10px;
    margin: 15px 0 10px 0;
    align-items: center;
    font-size: 12px;
    color: #666;
}


.container-fluid .pr_list > li .item_box {
    padding: 0 40px;
}

.container-fluid .pr_list > li .category {
    display: flex;
    align-items: center;
    padding: 8px 10px;
    background: #2d467b;
    color: white;
    font-size: 13px;
    border-radius: 15px;
    box-sizing: border-box;
    font-weight: 600;
    margin: 20px 0 0 20px;
    align-self: flex-start;
   }

.container-fluid .pr_list > li .name {
    margin-top: 28px;
    color: #333;
    font-size: 28px;
    letter-spacing: -0.2;
    font-weight: 700;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.container-fluid .pr_list > li .pice {
    font-size: 24px;
    color: #333;
    margin-top: 20px;
    font-weight: 540;
    letter-spacing: 1px;
    font-family: 'Roboto';
    text-align: left;
}

a:visited {
	outline: none;
}

#a #uploadResult:before {
    content: '';
    display: block;
    height: 55px;
    background: rgba(0,0,0,.5);
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    top: 284px;
    z-index: -1;
}

[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
    cursor: pointer;
}

.option_list > li {
	display: flex;
    border-radius: 10px;
    text-align: center;
    float: left;   
}

#list-more-btn {
    margin: 0px auto 0px auto;
    display: block;
    width: 46px;
    height: 46px;
    background: url(/public/static/img/icon/ic_list_plus.svg) center no-repeat ;
    border-radius: 50%;
}
.container-fluid .pr_list > li .img {
    width: 100%;
    height: 200px;
    background-position: center !important;
    background-repeat: no-repeat !important;
    background-size: 100% !important;
}
#list-more-btn {
	clear: both;
	
}
#button_top {
	height: 20px;
}

/*찜하기 버튼*/
button .good{
	position: absolute;
    float: right;
    align-items: center;
    width: 33px;
    height: 33px;
    margin-left: 320px;
    margin-top: 20px;
    margin: 395px 0px 0px 30px;
    font-size: 0;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_m_good.png");
    background-repeat: no-repeat;
    text-indent: -9999px;
    align-self: flex-start;
}


/*팝업창 CSS*/
.layerpop {
	display:none;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:500px;
	height:650px;
	border-radius: 20px;
	background:#fff;
	z-index:1000;
	/* box-shadow: 0px 0px 10px 0px #fff; */
}
.layerpop .tit {
    height: 50px;
    padding-left: 30px;
    border-radius: 18px 18px 0 0;
    line-height: 50px;
    font-size: 22px;
    letter-spacing: -1px;
    font-weight: 700;
    color: white;
    background: #2d467b;
}
.detail #uploadResult:before {
    content: '';
    display: block;
    height: 55px;
    /* background: #2d467b; */
    background: rgba(0,0,0,0.5);
    opacity: 0.2;	/*불투명도*/
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    top: 284px;
    z-index: -1;
}
button {
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
    /* outline: 0 none; */
}
.btn button {
    height: 22px;
    float: right;
    /* margin-right: 20px; */
    margin-top: 13px;
}
.btn button.good {
    width: 24px;
    height: 20px;
    background: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_good01.png") no-repeat;
}

/*리스트 찜하기*/
button.list_good {
	/*빈하트*/
    position: absolute;
    float: right;
    align-items: center;
    width: 33px;
    height: 33px;
    font-size: 0;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_m_good.png");
    background-repeat: no-repeat;
    text-indent: -9999px;
    align-self: flex-start;
}
button.list_good_full {
	/* 빨간 하트 */
    position: absolute;
    float: right;
    align-items: center;
    width: 33px;
    height: 33px;
    font-size: 0;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_m_good.png");
	background-position: 0 -43px;
    background-repeat: no-repeat;
    text-indent: -9999px;
    align-self: flex-start;
}


/*간편보기 찜하기*/

#detailShareDiv{
	float: right;
}


button>.good{
	float: right;
}

.btn button.good {
	float: right;
	/* 빈파트 */
    width: 100px;
    height: 20px;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_good01.png");
    background-repeat: no-repeat;
    background-position: 0 0;
}
.btn button.good_full {
	float: right;
	/* 발간하트 */
    width: 100px;
    height: 20px;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_good01.png");
    background-position: 0 -20px;
    background-repeat: no-repeat;
}
.btn button.good span {
	font-size: 13px;
	color: #313131;
}
.btn button.good.on {
    background-position: 0 -20px;
    background-position-x: 0px;
    background-position-y: -20px;
    
}
button {
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
    /* outline: 0 none; */
}
.spl_carInfo {
	text-align: center;
}
.spl_carInfo .ca_name {	
	margin-bottom: 30px;
    margin-top: 10px;
    margin-left: 105px;
    color: #333;
    font-size: 28px;
    letter-spacing: -0.2;
    font-weight: 700;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.spl_carInfo .ca_info {
	display: flex;
	margin-left: 165px;
    align-items: center;
    font-size: 13px;
    color: #666;
}
.spl_carInfo .pice {
	font-size: 24px;
    color: #333;
    margin-top: 15px;
    font-weight: 540;
    letter-spacing: 1px;
    font-family: 'Roboto';
    text-align: center;
}
#userCarDetail{
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


/*팝업창 CSS*/
.layerpop {
	display:none;
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:500px;
	height:650px;
	border-radius: 20px;
	background:#fff;
	z-index:1000;
	/* box-shadow: 0px 0px 10px 0px #fff; */
}
.layerpop .tit {
    height: 50px;
    padding-left: 30px;
    border-radius: 18px 18px 0 0;
    line-height: 50px;
    font-size: 22px;
    letter-spacing: -1px;
    font-weight: 700;
    color: white;
    background: #2d467b;
}
.detail #uploadResult:before {
    content: '';
    display: block;
    height: 55px;
    /* background: #2d467b; */
    background: rgba(0,0,0,0.5);
    opacity: 0.2;	/*불투명도*/
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    top: 284px;
    z-index: -1;
}
button {
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
    /* outline: 0 none; */
}
.btn button {
    height: 22px;
    float: right;
    /* margin-right: 20px; */
    margin-top: 13px;
}

.btn button.good {
    width: 24px;
    height: 20px;
    background: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_good01.png") no-repeat;
}
/*간편보기 찜하기*/
.btn button.good {
	/* 빈파트 */
    width: 100px;
    height: 20px;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_good01.png");
    background-repeat: no-repeat;
    background-position: 0 0;
}
.btn button.good_full {
	/* 발간하트 */
    width: 100px;
    height: 20px;
    background-image: url("https://korean.visitkorea.or.kr/resources/images/theme/travel100scene/btn_good01.png");
    background-position: 0 -20px;
    background-repeat: no-repeat;
}
.btn button.good span {
	font-size: 13px;
	color: #313131;
}
.btn button.good.on {
    background-position: 0 -20px;
    background-position-x: 0px;
    background-position-y: -20px;
    
}
button {
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
    /* outline: 0 none; */
}
.spl_carInfo {
	text-align: center;
}
.spl_carInfo .ca_name {	
    margin-top: 3px;
    margin-left: 105px;
    color: #333;
    font-size: 28px;
    letter-spacing: -0.2;
    font-weight: 700;
    white-space: nowrap;
    margin-bottom: 15px;
    overflow: hidden;
    text-overflow: ellipsis;
}
.spl_carInfo .ca_info {
	display: flex;
	margin-left: 165px;
    align-items: center;
    font-size: 13px;
    color: #666;
}
.spl_carInfo .pice {
	font-size: 24px;
    color: #333;
    margin-top: 15px;
    font-weight: 540;
    letter-spacing: 1px;
    font-family: 'Roboto';
    text-align: center;
}
#userCarDetail{
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
}.spl_tripInfo0 {
	float: left;
	text-align: center;
}

.spl_tripInfo:hover  {
	cursor: pointer;
	opacity: 0.5;
   /*  transition: 0.3s; */
}

div#a {
  width: 250px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
}
.tripImg img{
	display: block;
	float: left;
	text-align: center;
	margin: 0 20px; 
	
	/* border-radius: 30px; */
}
#userCarDetail{
	display: inline-block;
    width: 450px;
    margin: 0 30px 10px 30px;
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

	<form method="POST">
		<div id="SearchArea" class="container-fluid">
			<div id="SearchLocation">
				<h3>위치</h3>
				<div class="dropdown">
					<input class="dropbtn" type="text" value="지역선택" readonly />
					<div class="dropdown-content">
						<input onclick="saveloc(this)" id="서울" type="text" value="서울"
							readonly style="margin-left: 15px;"/> <input onclick="saveloc(this)" id="서울" type="text"
							value="경기" readonly style="margin-left: 15px;"/> <input onclick="saveloc(this)" id="서울"
							type="text" value="강원" readonly style="margin-left: 15px;"/> <input onclick="saveloc(this)"
							id="서울" type="text" value="충청" readonly style="margin-left: 15px;"/> <input
							onclick="saveloc(this)" id="서울" type="text" value="경상" readonly style="margin-left: 15px;"/>
						<input onclick="saveloc(this)" id="서울" type="text" value="전라"
							readonly style="margin-left: 15px;"/> <input onclick="saveloc(this)" id="서울" type="text"
							value="제주" readonly style="margin-left: 15px;"/>
					</div>
				</div>
			</div>
			<div id="SearchPrice">
				<h3>가격</h3>
				<input type="number" id="minprice" placeholder="최소 희망 가격" value="" />원~
				<input type="number" id="maxprice" placeholder="최대 희망 가격" value="" />원
			</div>
			<div id="SearchCarModel">
				<h3>차종</h3>
				<div>
					<input onclick="saveID(this)" id="소형" class="inputmargin" type="text" value="소형"
						readonly /> <input onclick="saveID(this)" id="SUV" class="inputmargin" type="text"
						value="SUV" readonly /> </br><input onclick="saveID(this)" id="중형" class="inputmargin" 
						type="text" value="중형" readonly /> <input onclick="saveID(this)"
						id="대형" class="inputmargin" type="text" value="대형" readonly />
				</div>
			</div>
		</div>

		<div style="text-align: center;">
			<input type="button" id="searchbtn" onclick="searchListCall()"
				value="검색"></input>
		</div>

		<input id="savecarval" class="secret" value="${carval}" readonly /> 
		<input id="savelocation" class="secret" value="${savelocation}" readonly />

	</form>

		<!-- 검색 후 리스트 영역 -->
		
	<div>	

		<div class="container-fluid">
			<ul class="pr_list" id="box-items">
				<!-- 차량 list -->
				<li class="pr_list_li" >
					<!-- 여기에 추가되도록 -->
				</li>
				
				
			</ul>
		</div>
	</div>

<div class="modal-bg" style="display:none;"></div>	<!-- modal 배경 -->
<div class="layerpop" tabindex="0" >
	<div class="pop_scr">
		<div class="tit">       
		   
			<strong>간편보기</strong>
			<p class="closeBtn" onclick="popup_close()"></p>
		</div>
		<div class="detail">
			<!-- 이미지 넣기 -->
			<div id="uploadResult"></div>
			<!-- 찜하기버튼 -->
			<span class="btn" id="detailShareDiv"></span>
			
		</div>
			<div class="pdt_cont"><!-- 차량 정보 --></div>
			<p>여행지 추천</p>
			<div class="tripImg"></div>


		</div>
</div>

</body>
<script>


<!--밑에 추가-->
tripInfo();

	/* 차종을 input hidden에 잠깐 저장  */
 	function saveID(elem){
 		var excarval = $(elem).val();
 		console.log("버튼누를때 차 종 저장 : "+excarval); 
 		$("#savecarval", document).val(excarval);
 	}
	
	/* 위치를 input hidden에 잠깐 저장   */
 	function saveloc(elem){
 		var exloc = $(elem).val();
 		console.log("버튼누를때 위치 저장 : "+exloc); 
 		$("#savelocation", document).val(exloc);
 	}
	

 /* 메인 검색 버튼 */
function searchListCall(){
	 
	var minprice=$("#minprice").val();
	var maxprice=$("#maxprice").val();
	var search_loc = $("#savelocation").val();
	var ca_model = $("#savecarval").val();
	
	console.log("최소가격 : "+minprice);
	console.log("최대가격 : "+maxprice);
	console.log("저장된 주소 : "+search_loc);
	console.log("저장된 차 종 : "+ca_model);
	
	//input 데이터 검사 후
	if(minprice == ''){
			alert("최소 금액을 확인해주세요");
	}else if(maxprice == ""){
			alert("최대 금액을 확인해주세요");
	}else if(search_loc == ""){
			alert("찾으실 위치를 확인해주세요");	
	}else if(ca_model == ""){
		alert("차 종류를 확인해주세요");				
	}else{
		searchwork(); //아작스 함수 실행
	}

	function searchwork() {
		
		$.ajax({
			type : 'POST',
			url : 'searchwork', 
			data :{ca_model,minprice,maxprice,search_loc},
			dataType : 'JSON', 
			success : function(data) { 
				console.log(data);
				drawList(data.searchlist);
				
			},
			error : function(e) { //에러 났을 때 넣을 데이터 
				console.log("에러입니다 : "+JSON.stringify(e));
				
			}
		});
		
	}//function searchwork()	
	
	
	/* 검색 후 차량목록 뿌리기 */
	function drawList(list) { 
		var content = ''; 
		
		for (var i = 0; i < list.length; i++) {
			console.log(list[i]);
					if(list[i].newFileName == "1668132777766.png" || list[i].newFileName == "1668483894313.png" || list[i].newFileName == "1668483948802.png" || list[i].newFileName == "1668484306753.png"){	// 모닝은 크기가 달라서..
						//content  += '<div id="a" onclick="CarSpl('+list[i].ca_num+')" value="'+list[i].ca_num+'"  style="z-index:0;">'; // 간편보기
						//content  += '<span class="btn" id="listJjim"></span>';	// 찜 버튼
						content  += '<span class="category">'+list[i].ca_model+'</span>'; // 차량 모델
						content  += '<div class="img" style="z-index:1;"><img id="readPhoto" src="/photo/'+list[i].newFileName+'" style="width:80%;"/></div>';
						content  += '<div class="item_box">';
						content  += '<h3 class="name">'+list[i].ca_name+'</h3>';
						content  += '<div class="option_box">';
						content  += '<i class="point"></i>';
						content  += '<ul class="option_list">';
						content  += '<li>'+list[i].ca_brand+'&nbsp;｜&nbsp;</li>';
						content  += '<li>'+list[i].ca_age+'&nbsp;｜&nbsp;</li><br/>';
						content  += '</ul>';
						content  += '<p class="pice">'+list[i].ca_price+'&nbsp원</p>';
						content  += '</div>';
						content  += '<div class="good" style="z-index: 2;">';
						content  += '<button type="button" id="like154defb1-57bd-4ea5-9957-0a94a739c353" name="like154defb1-57bd-4ea5-9957-0a94a739c353" onclick="setLike(1);" class="good"></button>';
						content  += '</div>';
						content  += '</div>';
						content  += '</div>';
						$(".pr_list_li").html(content);
					} else {
						//content  += '<div id="a" style="z-index:0;">'; // 간편보기
						content  += '<div id="a" onclick="CarSpl('+list[i].ca_num+')" value="'+list[i].ca_num+'"  style="z-index:0;">'; // 간편보기
						//content  += '<span class="btn" id="listJjim"></span>';	// 찜 버튼
						content  += '<span class="category">'+list[i].ca_model+'</span>'; // 차량 모델
						content  += '<div class="img" style="z-index:1;"><img id="readPhoto" src="/photo/'+list[i].newFileName+'" style="width:100%;"/></div>';
						content  += '<div class="item_box">';
						content  += '<h3 class="name">'+list[i].ca_name+'</h3>';
						content  += '<div class="option_box">';
						content  += '<i class="point"></i>';
						content  += '<ul class="option_list">';
						content  += '<li>'+list[i].ca_brand+'&nbsp;｜&nbsp;</li>';
						content  += '<li>'+list[i].ca_age+'&nbsp;｜&nbsp;</li><br/>';
						content  += '</ul>';
						content  += '<p class="pice">'+list[i].ca_price+'&nbsp원</p>';
						content  += '</div>';
						content  += '<div class="good" style="z-index: 2;">';
						content  += '<button type="button" id="like154defb1-57bd-4ea5-9957-0a94a739c353" name="like154defb1-57bd-4ea5-9957-0a94a739c353" onclick="setLike(1);" class="good"></button>';
						content  += '</div>';
						content  += '</div>';
						content  += '</div>';
						$(".pr_list_li").html(content);
					
				}
			}
	
	}// function drawList(list)
	
	
		



		
	
 }//searchListCall()
 
 	//간편보기 CarSpl 그리기	
	function readURL(data){
		var content = '';
		
		jjimChk(data);

		<!-- 차량 사진 -->
		//data.fileList.newFileName
		if(data.fileList.newFileName == "1668132777766.png" || data.fileList.newFileName == "1668483894313.png" || data.fileList.newFileName == "1668483948802.png" || data.fileList.newFileName == "1668484306753.png"){	// 모닝은 크기가 달라서..
			content += '<div>';
			content += '<img id="readPhoto" src="/photo/'+data.fileList.newFileName+'" style="width:65%; margin-left: 80px;">';
			content += '</div>';
			$("#uploadResult").html(content); // file로 변경하면 됨
		}else{
			content += '<div>';
			content += '<img id="readPhoto" src="/photo/'+data.fileList.newFileName+'" style=" width: 100%;">';
			content += '</div>';		
			$("#uploadResult").html(content); // file로 변경하면 됨
		}

		<!-- 차량 정보 -->
		var c = data.car;
		content = "";
		content += '<div class="spl_carInfo">';
		content += '<h3 class="ca_name">'+c.ca_name+'</h3>';
		content += '<span class="ca_info">'+c.ca_age+'년&nbsp;|&nbsp;'+c.ca_brand+'&nbsp;|&nbsp;'+c.ca_model
					+'&nbsp;|&nbsp;'+c.ca_fuel+'</span>';
		content += '<p class="pice">￦'+c.ca_price+' 원 ~</p>';
		content += '</div>';
		content += '<div>';
		<!-- 상세보기 버튼 -->
		content += '<a href="/tayo/userCarDetail?ca_num='+c.ca_num+'" id="userCarDetail">상세보기</a>';
		content += '</div>';
		$(".pdt_cont").html(content);
		

	} // readURL()
		
		// 간편보기 위해 데이터 받아오기
		function CarSpl(ca_num){
			// 클릭한 해당 ca_num 가져오기
			console.log(ca_num+" 간편보기");
			
			var modalPop = $('.layerpop');
		    var modalBg = $('.modal-bg'); 

		    $(modalPop).show(ca_num);
		    $(modalBg).show(ca_num);
		    
		    // 팝업창 뜨자마자 해당 ca_num 데이터 가져오기
			$.ajax({
				type: "GET",
				dataType: "json",
				url: "CarSpl", // 요청보낼 url
				data: {ca_num},
				success: function(data){
					console.log(data);
					
					// 이미지 출력
					readURL(data);
				} // success
			});
		    
		}
	
	
		
		function ListJjimChk(data){
			// 찜하기 버튼
			$.ajax({
				type: "GET",
				dataType: "json",
				url: "jjimChk", 
				data: {ca_num},
				success: function(result){
					console.log(result);
					if(result ==1){
						// 꽉 찬 하트 =1
						content = "";
						content += '<span class="good" title="">';
						content += '<button type="button" class="list_good_full" onclick="jjimDel('+ca_num+');" id="good_button" title="찜완료">';
						content += '<span>&nbsp찜하기</span>';
						content += '</button>';
						content += '</span>';
						$("#listJjim").html(content);
					} else if(result ==0){
						// 빈 하트 =0
						content = "";
						content += '<span class="good" title="">';
						content += '<button type="button" class="list_good" onclick="jjimSet('+ca_num+');" id="good_button" title="찜취소">';
						content += '<span>&nbsp찜하기</span>';
						content += '</button>';
						content += '</span>';
						$("#listJjim").html(content);
					}
				},
				error: function(e){
					alert('서버 에러!');
				}
			});
		}



		

		<!-- 찜 여부 확인 -->
		function jjimChk(data){
			// 찜하기 버튼
			$.ajax({
				type: "GET",
				dataType: "json",
				url: "jjimChk", 
				data: {ca_num:data.car.ca_num},
				success: function(result){
					//alert(result);
					if(result ==1){
						// 꽉 찬 하트 =1
						content = "";
						content += '<span class="good" title="">';
						content += '<button type="button" class="good_full" onclick="jjimDel('+data.car.ca_num+');" id="good_button" title="찜완료">';
						content += '<span>&nbsp찜하기</span>';
						content += '</button>';
						content += '</span>';
						$("#detailShareDiv").html(content);
					} else if(result ==0){
						// 빈 하트 =0
						content = "";
						content += '<span class="good" title="">';
						content += '<button type="button" class="good" onclick="jjimSet('+data.car.ca_num+');" id="good_button" title="찜취소">';
						content += '<span>&nbsp찜하기</span>';
						content += '</button>';
						content += '</span>';
						$("#detailShareDiv").html(content);
					}
				},
				error: function(e){
					alert('서버 에러!');
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
					if(result == 1){
						// 빨간 하트 그리기
						content = "";
						content += '<span class="good" title="">';
						content += '<button type="button" class="good_full" onclick="jjimDel('+ca_num+');" id="good_button" title="찜완료">';
						content += '<span>&nbsp찜하기</span>';
						content += '</button>';
						content += '</span>';
						$("#detailShareDiv").html(content);
					} else if(result == 0){
						alert('찜하기 실패..');
					} else if(result ==2){
						alert('로그인이 필요한 서비스 입니다.');
						listCall();
					}
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
					if(result ==1){
						// 빈하트 그리기
						content = "";
						content += '<span class="good" title="">';
						content += '<button type="button" class="good" onclick="jjimSet('+ca_num+');" id="good_button" title="찜취소">';
						content += '<span>&nbsp찜하기</span>';
						content += '</button>';
						content += '</span>';
						$("#detailShareDiv").html(content);				
					} else if(result == 0){
						alert("찜 되돌리기 실패..");
					} else if(result == 2){
						alert('로그인이 필요한 서비스 입니다.');
						listCall();
					}
				},
				error: function(e){
					alert('찜 삭제 실패..');
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
	
	
	
	
	
	
		// 팝업 닫기
		function popup_close(){
			var modalPop = $('.layerpop');
			var modalBg = $('.modal-bg'); 
		 
			$(modalPop).hide();
			$(modalBg).hide();
			
			location.reload();
		}//popup_close
 

		</script>
</html>







