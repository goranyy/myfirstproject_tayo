
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
        height: 65px;
        width: 100%;
        border-radius: 4px;
        margin-top: 30px;
        margin-bottom: 20px;
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
	    <div class="logo"><h1 style="margin-bottom: 0px;">로그인</h1>
	    <div id="logImg">
	    	<img alt="로그인 자동차 아이콘" src="resources/img/loginCar.png" style="height: 110px; width: 110px;">
	    </div>
	  	</div>
	    <form action="login" method="post" style="margin-top: 20px;">
	    	<input type="text" name="id" style="margin-top: 0px;" placeholder=" &#xf12a;   ID" >
	    	<input type="password" name="pw" placeholder=" &#xf023;  Password" >
	        <button type="submit">LOG IN </button>
	        <ul>
                <li><a target="_blank" onclick="location.href='joinForm'" style="cursor: pointer; margin-right: 10px;" >회원가입</a></li>
                <li><a target="_blank" onclick="location.href='findIdForm'" style="cursor: pointer; margin-left: 10px;" >ID/PW 찾기</a></li>
            </ul>
	    </form>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>