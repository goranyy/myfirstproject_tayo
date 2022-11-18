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
<a href="loginBestadminMain"><img id="logo" src="resources/logos/logo.png"></a>
</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="loginBestadminMain">타볼래</a>
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
    <li class="dropdown">
     <a class="dropdown-toggle" data-toggle="dropdown" href="#">관리자 항목
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="MemberList">회원관리</a></li>
          <li><a href="A_alllist">글 관리</a></li>
          <li><a href="RentCarList">렌트카 관리</a></li>
          <li><a href="carList">차량 관리</a></li>
          <li><a href="TripList">여행지 관리</a></li>
          <li><a href="Hash">해시태그 관리</a></li>
        </ul>
          </li>
        </ul>
    <ul class="nav navbar-nav navbar-right">
    <li><a href="AdminMypage"><span class="glyphicon glyphicon-user"></span>내정보</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
    </ul>
  </div>
</nav>
</body>
<script></script>
</html>