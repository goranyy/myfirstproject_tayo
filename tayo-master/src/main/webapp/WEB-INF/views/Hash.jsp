<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
  var _$ = jQuery.noConflict();
</script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script> 
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
 
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
   background-color: #fefefe;
   margin: 7% auto; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 30%; /* Could be more or less, depending on screen size */
}

#modal-notice {
font-size: 13pt;
text-align: center;
}

#input-body {
font-size: 13pt;
font-weight: bold;
}

div.left {
    width: 50%;
    float: left;
    text-align: center;
    box-sizing: border-box;
}
div.right {
    width: 50%;
    float: right;
    box-sizing: border-box;
}

.modal-content2 {
margin: 7% auto;
padding: 20px;
border: 1px solid #888;
}
table,th,td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
      font-size: 5pt;
   }
</style>
</head>
<body>
<jsp:include page="Adminheader.jsp"></jsp:include>
	<div>
		<p>해시태그 관리(관리자)</p>
	</div>
	<form action="Hashwrite" method="post">
	<table>
		<tr>
		<th>차량 명</th>
		<th>해시태그 이름</th>
		<th>해시태그 값</th>
		</tr>
		<tr>
		<td>
			<input type="text" name="ca_name" value=""/>
		</td>
		<td>
			<input type="text" name="ha_name" value=""/>		
		</td>
		<td>
			<input type="text" name="ha_value" value=""/>		
			
		</td>
		</tr>
		<tr>
			<th colspan="3"><button>등록</button></th>
		</tr>
	</table>
	</form> 
	<%-- 
	<jsp:include page="table.jsp"></jsp:include> --%>
	
	<table>
<!-- 		<thead> -->
			<tr>
				<th><input type="checkbox" id="all"/></th>
				<th>태그등록순서</th>
				<th>차량이름</th>
				<th>해시태그 이름</th>
				<th>해시태그 값</th>
				<th>버튼</th>	
			</tr>
		<!-- </thead> -->
		<c:if test="${list.size()<1}">
		<tr><td colspan="6">작성된 글이 없습니다</td></tr>
		</c:if>			
				<tbody id="list">
			</tbody>
		<tr id="page">
			<td colspan="6" id="paging">
				<div>
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div> 				
			</td>
		</tr>			
	</table>
	<div><button onclick="Hashdel()">삭제</button></div>
<!-- <form action="search" method="post"> -->
	<div>
			<!-- <select class="form-control form-control-sm" name="searchType" id="searchType"> -->
			<select name="searchname" id="pagePerNum">
					<option value="title">차 이름</option>
					<option value="Content">해시태그 이름</option>
			</select>
		<!-- <input type="text" class="form-control form-control-sm" name="keyword" id="keyword"> -->
		
			<input type="text" name="searchvalue" value=""/>
		<button onclick="flags(); Hashsearch(1)">조회</button>	
		<!-- <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch" >조회</button> -->
	</div>
 	<!-- </form>  -->

</body>
<script>

var showPage=1;
HashlistCall(showPage);

$("#all").click(function(){
var _$chk= _$('input[type="checkbox"]');

if(_$(this).is(':checked')){
$chk.prop('checked',true);
}else{
$chk.prop('checked',false);
}

});         
function HashlistCall(page){
	$.ajax({
		type:'GET',
		url:'HashlistCall',
		data:{page:page},
		dataType:'JSON',
		
		success:function(data){

			drawList(data.list);

			_$('#pagination').twbsPagination({
				startPage:1, //시작페이지
				totalPages:data.total, //총 페이지 수
				visiblePages: 5, //기본으로 보여줄 페이지 수
				onPageClick:function(e, page){ // 클릭했을 때 실행 내용

					HashlistCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content = '';
	for(var i=0; i<list.length; i++){
		console.log(list[i]);
		content+='<tr>';
		content+='<td><input type="checkbox" value="'+list[i].ha_num+'"</td>';
		content+='<td>'+list[i].ha_num+'</td>'
		content+='<td>'+list[i].ca_name+'</td>';
		content+='<td>'+list[i].ha_name+'</td>';
		content+='<td>'+list[i].ha_value+'</td>';
		content+='<td><a href="HashupdateForm?ha_num='+list[i].ha_num+'">수정</a></td>';
		/* content+='<td><input type="button" onclick="(this'+','+'\''+list[i].ha_num+'\''+')"></td>'; */
		/*content+='<td><button type="button" onclick='location.href="./HashupdateForm?ha_num='+list[i].ha_num+'"'>수정</button></td>';*/
		/*content+='<td><button type="button" onclick='location.href="./HashupdateForm?ha_num=+list[i].ha_num+"'>수정</button></td>'*/;	
		content+='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);	
}



function Hashdel(){

var chkArr=[];

$('input[type="checkbox"]:checked').each(function(ha_num,item){

if(_$(this).val()!='on'){
	
chkArr.push($(this).val());
}
});
console.log(chkArr);

$.ajax({
type:'GET',
url:'Hashdel',
data:{'delList':chkArr},
dataType:'JSON',
success:function(data){
	console.log(data);
	if(data.msg !=""){
		alert(data.msg);

		HashlistCall(showPage);
	}
},
error:function(e){
	console.log(e);
}
});

}


function drawPage(){
	
	   var paging = "";	   
	   $("#page").empty();
	   paging += "<td colspan='6' id='paging'>";
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


function Hashsearch(page){
	if(flag){
		drawPage();
	}
	if(_$('select[name=searchname]').val()=='title'){
	var ca_name =_$('input[name=searchvalue]').val();		
	}else{
		var ha_name=_$('input[name=searchvalue]').val();
	}
	$.ajax({
		type:'GET',
		url:'Hashsearch',
		data:{ca_name,ha_name,page:page},
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
		            	 Hashsearch(page);
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