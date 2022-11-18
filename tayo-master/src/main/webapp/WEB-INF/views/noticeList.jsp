<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- script 순서 중요!, script 자동생성시 type/src 주의!!  -->
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
</c:when>
<c:when test="${power eq 1}">
	<jsp:include page="Adminheader.jsp"></jsp:include>
</c:when>
<c:when test="${power eq 0}">
	<jsp:include page="header.jsp"></jsp:include>
</c:when>
<c:otherwise>
	<jsp:include page="logoutheader.jsp"></jsp:include>
</c:otherwise>
</c:choose>

	<h2>공지사항</h2>
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
<c:set var = "power" scope = "session" value = "${power}"/>
<c:choose>
<c:when test="${power eq 0}">
	      <!-- <button>글 작성하기</button>  -->
</c:when>
<c:when test="${power eq null}">
	      <!-- <button>글 작성하기</button>  -->
</c:when>
<c:otherwise>
		<button onclick="location.href='a_notice_writeForm'">글 작성하기</button> 
</c:otherwise>      
 </c:choose> 
 	<div>
      	<select name="searchname" id="pagePerNum">
               <option value="title">제목</option>
               <option value="mem_id">작성자</option>
        </select>      
        <input type="text" name="searchvalue" value=""/>
     	<button onclick="flags(); search2(1)">조회</button>  
     </div>
    <table>
   <tr id="page">
      <td colspan="5" id="paging">
         <div class="container">
            <nav aria-label="Page navigation" style="text-align:center">
               <ul class="pagination" id="pagination"></ul>
            </nav>
         </div>
      </td>
   </tr>
     </table>
 

</body>
<script>
var showPage=1;
listCall2(showPage);

function listCall2(page){
   $.ajax({
      type:'GET',
      url:'notice_listCall',
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
               listCall2(page);
            }            
         });         
      },
      error:function(e){
         console.log(e);
      }      
   });   
}

function drawList(list){
	   var content='';
	   for(var i=0;i<list.length;i++){
	      //console.log(list[i]);
	      content +='<tr>';
	      content +='<td>'+list[i].num+'</td>';
	      
	      content +='<td><a href="notice_detail?num='+list[i].num+'">'+list[i].title+'</a></td>';
	      
	      content +='<td>'+list[i].mem_id+'</td>';
	      content +='<td>'+list[i].cnt+'</td>';      
	   
	      
	      var date=new Date(list[i].to_date);
	      //console.log(date);
	      //console.log(date.toLocaleDateString('ko-KR'));
	      content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>'; 
	      content +='</tr>';
	   }
	   $('#list').empty();
	   $('#list').append(content);
	}



function drawPage(){
	
	   var paging = "";	   
	   $("#page").empty();
	   paging += "<td colspan='5' id='paging'>";
	   paging += "<div>";
	   paging += "<nav aria-label='Page navigation' style='text-align:center'>";
	   paging += "<ul class='pagination' id='pagination'></ul>"
	   paging += "</nav></div></td>";
	   $("#page").append(paging);
}

var flag = true;

function flags(){
	if(!flag){
		flag=true;
	}
	
}

function search2(page){
	if(flag){
		drawPage();
	}
	if(_$('select[name=searchname]').val()=='title'&&'mem_id'){
	var title =_$('input[name=searchvalue]').val();		
	}else{
		var mem_id =_$('input[name=searchvalue]').val();
	}
	$.ajax({
		type:'GET',
		url:'notice_search',
		data:{mem_id,title,page:page},
		datatype:'JSON',
		success:function(data){
		   console.log(data);
		   console.log(data.list);
		   console.log(data.total);

		   drawList(data.list);
		   console.log(flag);
		   
		   
		          _$("#pagination").twbsPagination({
		             startPage:1,
		             totalPages:data.total,
		             visiblePages:5,
		             onPageClick:function(e, page){
		            	 search2(page);
		                flag = false;
		             

		             }
		          });
		       		   

		},
		error:function(e){
		   console.log(e);
		}      
		});	 
}
 
</script>
</html>