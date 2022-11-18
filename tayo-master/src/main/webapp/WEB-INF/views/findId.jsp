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
	#phonChk {
		color : red;
		font-size: 12px;
	}

	input {
        height: 40px;
        width: 100%;
        margin: 20px auto;
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
    
    #findDiv {
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
        padding-top: 40px
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
</style>
</head>
<body>
	<div class="myform">
	    <div class="logo">
	    	<h1>아이디 찾기</h1>
		  	<button style="margin-right: 5px;">아이디 찾기</button>
		    <button onclick="location.href='findPwForm'" style="margin-left: 5px;">비밀번호 찾기</button>
	  	</div>
	  	<div id="findDiv">
	    	<input type="text" id="mem_name" placeholder="&#xf1ae;   이름을 입력해 주세요" >
	    	<input type="text" id="mem_email" placeholder="&#xf0e0;   이메일을 입력해 주세요">
	    	<input type="text" id="mem_pnum" onkeyup="phonChk()" placeholder="&#xf095;   휴대폰 번호를 입력해 주세요" style="margin-bottom: 0px;">
	    	<p id="phonChk" style="color: gray; text-align: left;margin-top: 5px;">휴대폰 번호에 하이픈(`-`)을 넣어 주세요</p>
	    	<!-- <div id="phonChk" style="color: gray;">휴대폰 번호에 하이픈(`-`)을 넣어 주세요</div> -->
	        <button type="submit" id="confirm" style="margin-right: 5px;">확인</button>
	        <button type="button" id="cancle" onclick="location.href='./loginForm'" style="margin-left: 5px;">취소</button>
	    </div>
	</div>
</body>
<script>
const nameRule = /^[가-힣]{2,}$/
var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phonRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/

function phonChk(){
	var pnum = document.getElementById('mem_pnum').value;
	
	if(pnum.match(phonRule) == null || pnum =='010-0000-0000'){
		document.getElementById('phonChk').style.color = 'red';
		document.getElementById('phonChk').innerHTML = "! 휴대폰 번호에 하이픈(`-`)을 넣어 주세요"+"<br>"+"예)010-0000-0000";
	}else{
		document.getElementById('phonChk').style.color = "green";
		document.getElementById('phonChk').innerHTML = "휴대폰 번호 입력 조건을 충족하셨습니다."; 
	}
}

$("#confirm").click(function(){
	console.log("동작함")
	$name = $("#mem_name");
	$email = $("#mem_email");
	$pnum = $("#mem_pnum");
	
	if($name.val()==''){
		alert("이름을 입력해 주세요");
		$name.focus();
	}else if($name.val().match(nameRule) == null){
		alert("이름은 한글로 2자 이상 입력해 주세요");
		$name.focus();
	}else if($email.val()==''){
		alert("이메일을 입력해 주세요");
		$email.focus();
	}else if($email.val().match(emailRule) == null){
		alert("email형식을 확인해 주세요");
		$email.focus();
	}else if($pnum.val().match(phonRule) == null){
		alert("핸드폰 번호에 하이픈(`-`을 넣어주세요\n ex) 010-1234-1234')");
		$pnum.focus();
	}else if($pnum.val()==''){
		alert("휴대폰 번호를 입력해 주세요");
		$pnum.focus();
	}else{
		var param ={}; // json으로 전달하기 위한 object
		param.name = $name.val();
		param.email = $email.val();
		param.pnum = $pnum.val();
		$.ajax({
			type:'POST',
			url:'findId',
			data:param,
			success:function(data){
				if(data.id != null){
					alert("아이디 찾기 성공\n"+"아이디 : "+data.id);
					location.href="./";
				}else{
					alert("아이디 찾기에 실패했습니다\n입력하신 내용을 다시 확인해 주세요");					
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