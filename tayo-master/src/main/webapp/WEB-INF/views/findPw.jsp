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
		color : gray;
		font-size: 14px;
		font-weight: bold;
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
    
    form {
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
	    	<h1>비밀번호 찾기</h1>
	    	<button onclick="location.href='findIdForm'" style="margin-right: 5px;">아이디 찾기</button>
		    <button style="margin-left: 5px;">비밀번호 찾기</button>
	  	</div>
	    <form action="findPw" method="post">
	    	<input type="text" name="mem_name" placeholder="&#xf1ae;   이름을 입력해 주세요" >
	    	<input type="text" name="mem_email" placeholder="&#xf0e0;   이메일을 입력해 주세요">
	    	<input type="text" name="mem_pnum" placeholder="&#xf095;   휴대폰 번호를 입력해 주세요">
	        <button type="submit" id="confirm" style="margin-right: 5px;">확인</button>
	        <button type="button" onclick="location.href='./loginForm'" style="margin-left: 5px;">취소</button>
	    </form>
	</div> 
</body>
<script>
</script>
</html>