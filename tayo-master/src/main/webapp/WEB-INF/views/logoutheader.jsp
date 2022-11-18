<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	#logo{
		width:100px;height:100px;
	}
	.loogo{
		text-align:center;
	}
</style>
</head>
<body>
<div class="loogo">
<a href="./"><img id="logo" src="resources/logos/logo.png"></a>
</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="./">타볼래</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">차
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="userCarList">차량 목록</a></li>
          <li><a href="carPopulList">인기차량 목록</a></li>
          <li><a href="searchpage">차 검색</a></li>
        </ul>
      </li>
      <li><a href="noticeList">공지사항</a></li>
      <li><a href="reviewList">후기</a></li>
      <li><a href="Togetherlist">같이 가볼래</a></li>
      <li><a href="Qnalist">고객 지원</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="joinForm"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="loginForm"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
  </div>
</nav>
</body>
<script></script>
</html>