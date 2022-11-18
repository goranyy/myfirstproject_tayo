<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
#checkPwd, #pwr {
	color : red;
	font-size: 12px;
}

input {
        height: 40px;
        width: 100%;
		margin-left: 20px auto;
		margin-right: 20px auto;
        border-left: none;
        border-right: none;
        border-top: none;
        color: white;
        background: #0b2144;
  		padding-left:5px;
        font-family: FontAwesome, "Open Sans", Verdana, sans-serif;
    	font-style: normal;
    	font-weight: normal;
    	text-decoration: inherit;
    }
    
    button {
        height: 50px;
        width: 35%;
        border-radius: 4px;
        margin-top: 10px;
        border: none;
        background: white;
        color: black;
        font-family: sans-serif;
        font-weight: 700;
        font-size: 14pt;
        cursor: pointer;
    }
    
     .findDiv {
        width: 90%;
        margin: 40px auto;
        text-align: center;
    }
    
    input:focus {
        outline: none
    }
    
    .logo {
        color: white;
        font-family: sans-serif;
        font-size: 15pt;
        font-weight: 600;
        text-align: center;
        padding-top: 40px;
        margin-bottom: 70px;
    }
    
    .myform {
        background: #0b2144;
        width: 40%;
        margin: auto;
        height: 600px;
        -webkit-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        -moz-box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
        box-shadow: 0px 0px 3px 1px rgba(38, 35, 128, 1);
    }
    
    .myform a {
        text-decoration: none;
        color: white;
        font-family: sans-serif;
        letter-spacing: .1em;
    }
    
     ::-webkit-input-placeholder {
        /* Chrome/Opera/Safari */
         color: #cccccc;
       
    }
	.fa-cloud-upload{
	  font-size:90px;
	  
	}
    
    ::-moz-placeholder {
        /* Firefox 19+ */
        color: #cccccc;
          }
    
    :-ms-input-placeholder {
        /* IE 10+ */
         color: #cccccc;
         }
    
    :-moz-placeholder {
        /* Firefox 18- */
        color: #cccccc;
      
    }
  @media screen and (max-width:500px){
        .myform{
            width:80%;
        }
    }
    @media screen and (max-width:800px){
        .myform{
            width:60%;
        }
    }
    
	ul {
		list-style: none;
		width: 200px;
		margin-left: auto;
  		margin-right: auto;
	}

	li {
	    margin: 0 0 0 0;
	    padding: 0 0 0 0;
	    border : 0;
	    float: left;
	}
	.put {
		text-align: left;
		color: white;
		font-weight: bold;
		margin-bottom: 3px;
	}
</style>
</head>
<body>
	<div class="myform">
	    <div class="logo">
	    	<h1>비밀번호 변경하기</h1>
	    	<input type="hidden" id="id" value="${id}">
	  	</div>
	  	<div class="findDiv">
	  		<p class="put"> 비밀번호 입력 </p>
	    	<input type="password" id="mem_pw" onkeyup="pwr()" value="" placeholder="&#xf023;   비밀번호를 입력해 주세요" >
	    	<p id="pwr" style="color: gray; text-align: left;margin-top: 5px;">6자 이상 영문, 숫자를 사용하세요</p>
	    	<br>
	    	<p class="put"> 비밀번호 확인 </p>
	    	<input type="password" id="mem_pwCheck" onkeyup="checkPwd()" placeholder="&#xf023;   비밀번호를 확인해 주세요">
	    	<p id="checkPwd" style="text-align: left;margin-top: 5px;"></p>
	    	<div style="margin-top: 55px;">
		    	<button type="submit" id="changePw" style="margin-right: 5px;">확인</button>
		        <button onclick="location.href='./loginForm'" style="margin-left: 5px;">취소</button>
	        </div>
	    </div>
	</div>
</body>
<script>
$id = $("#id");
if($id.val() ==''){
	alert("비밀번호를 찾지 못했습니다.\n 다시 입력해 주세요.");
	location.href="./findPwForm";
}else{
	alert("비밀번호를 찾았습니다 \n 비밀번호를 변경해 주세요")
}

var pwRule = /^(?=.*?[A-Za-z])(?=.*?\d)[A-Za-z\d]{6,}$/
//비밀번호 실시간 검증
function pwr(){
	var pw = document.getElementById('mem_pw').value;
	
	if(pw.match(pwRule) == null){
		document.getElementById('pwr').style.color = 'red';
		document.getElementById('pwr').innerHTML = "! 6자 이상 영문, 숫자를 사용하세요"+"<br>"+"예)abc123";
	}else{
		document.getElementById('pwr').style.color = "green";
		document.getElementById('pwr').innerHTML = "비밀번호 조건에 충족하였습니다."; 
	}
}

//비밀번호 확인 실시간 검증
function checkPwd(){
	var pw = document.getElementById('mem_pw').value;
	var pwChk = document.getElementById('mem_pwCheck').value;
	
	if(pw!=pwChk){
		document.getElementById('checkPwd').style.color = 'red';
		document.getElementById('checkPwd').innerHTML = "! 동일한 암호를 입력하세요.";
	}else{
		document.getElementById('checkPwd').style.color = "green";
		document.getElementById('checkPwd').innerHTML = "암호가 일치합니다."; 
	}
}

$("#changePw").click(function(){
	$pw = $("#mem_pw");
	$pwChk = $("#mem_pwCheck");
	
	if($pw.val()==''){
		alert("비밀번호를 입력해 주세요");
		$pw.focus();
	}else if($pwChk.val()==''){
		alert("비밀번호 확인을 입력해 주세요");
		$pwChk.focus();
	}else if($pw.val()!=$pwChk.val()){ // 비밀번호 체크
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("mem_pwCheck").value ='';
		$pwChk.focus();
	}else{
		var param ={}; // json으로 전달하기 위한 object
		param.id = $id.val();
		param.pw = $pw.val();
		$.ajax({
			type:'POST',
			url:'changePw',
			data:param,
			success:function(data){
				if(data.changePw>0){
					alert("비밀번호 변경 완료");
					location.href="./loginForm";
				}else{
					alert("비밀번호 변경 실패\n 다시 시도해주세요\n 지속적으로 문제 발생 시 관리자에게 문의해주세요");			
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
</script>
</html>