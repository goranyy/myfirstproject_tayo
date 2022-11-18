
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- script 순서 중요!, script 자동생성시 type/src 주의!!  -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
  var _$ = jQuery.noConflict();
</script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">


<!-- <link rel="stylesheet" href="resources/common.css" type="text/css"> -->
<style>

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
		<!-- <button onclick="location.href='TogetherwriteForm'">글 작성하기</button> -->
	<h2>같이가볼래 게시판</h2>
	<table class="table table-striped" id="detail">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody id="list">	
	</tbody>
	</table>

	<table>
	<tr>
		<td colspan="5" id="paging">
			<div class="container">
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
		</td>
	</tr>
	</table>
	
	<!-- 신규추가 -->
	<c:set var="power" scope="session" value="${power}" />
	<c:choose>
		<c:when test="${power eq null}">
		</c:when>
		<c:otherwise>
			<button onclick="location.href='TogetherwriteForm'" id="write">글작성하기</button>
		</c:otherwise>
	</c:choose>
	
	<div>
         <select name="searchname">
               <option value="title">제목</option>
               <option value="mem_id">작성자</option>
         </select>      
         <input type="text" name="searchvalue" value=""/>
      <button onclick="Togethersearch()">조회</button>   
   </div>
	

</body>
<script>
var showPage=1;
TogetherlistCall(showPage);

function TogetherlistCall(page){
	$.ajax({
		type:'GET',
		url:'TogetherlistCall',
		data:{page:page}, // page라는 이름으로 page넣기
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);
			// 플러그인 적용
			_$('#pagination').twbsPagination({
				startPage:1, // 시작페이지
				totalPages:data.total, // 총 페이지 수
				visiblePages:5, // 기본으로 보여줄 페이지 수
				onPageClick:function(e,page){ //클릭했을 때 실행 내용
					//console.log(e);
					//console.log(page);
					TogetherlistCall(page);
				}				
			});			
		},
		error:function(e){
			console.log(e);
		}		
	});	
}

//수정 부분
var memPower='${sessionScope.power}'; // 관리자 권한
function drawList(Togetherlist){
		console.log(Togetherlist);
	var content='';
	for(var i=0;i<Togetherlist.length;i++){
		content +='<tr>';
		content +='<td>'+Togetherlist[i].num+'</td>';
		if((Togetherlist[i].se_secret==null || Togetherlist[i].se_secret=='무')){	
			content +='<td><a href="Togetherdetail?num='+Togetherlist[i].num+'">'+Togetherlist[i].title+'</a></td>';		
		}else if(Togetherlist[i].se_secret=='유'){
			if(memPower > 0){
				content +='<td><b>[비공개 된 글]&emsp;</b><a href="Togetherdetail?num='+Togetherlist[i].num+'">'+Togetherlist[i].title+'</a></td>';		
			}else{
				content +='<td>비공개 처리된 글입니다.</td>';
			}
		}
		content +='<td>'+Togetherlist[i].mem_id+'</td>';
		content +='<td>'+Togetherlist[i].cnt+'</td>';		
	
		
		var date=new Date(Togetherlist[i].to_date);
		//console.log(date);
		//console.log(date.toLocaleDateString('ko-KR'));
		content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';
		content +='</tr>';
	}
	$('#list').empty();
	$('#list').append(content);
}

function Togethersearch(){
	   if($('select[name=searchname]').val()=='title'&&'mem_id'){
		  var title =$('input[name=searchvalue]').val();      
	   }else{
	      var mem_id=$('input[name=searchvalue]').val();
	   }
	   $.ajax({
	      type:'GET',
	      url:'Togethersearch',
	      data:{title,mem_id},
	      datatype:'JSON',
	      success:function(data){
	         console.log(data);	      
	         drawList(data.list);        
	         
	      },
	      error:function(e){
	         console.log(e);
	      }      
	      });    
	}

</script>
</html>









