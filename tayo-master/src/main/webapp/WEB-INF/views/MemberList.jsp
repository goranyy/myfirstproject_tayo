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
<style>
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
		<p>회원 관리</p>
	</div>

	<table>
<!-- 		<thead> -->
		<tr>
			<th><input type="checkbox" id="all"/></th>
			<th>회원 아이디</th>
			<th>핸드폰 번호</th>
			<th>회원 비밀번호</th>
			<th>Email</th>
			<th>이름</th>	
			<th>나이</th>	
			<th>주소</th>
			<th>관리</th>
		</tr>
		<!-- </thead> -->
		<c:if test="${list.size()<1}">
			<tr>
				<td colspan="9">회원이 없습니다.</td>
			</tr>
		</c:if>			
				<tbody id="list">
			
				</tbody>
		<tr id="page">
			<td colspan="9" id="paging">
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>			
	</table>
	<div>
		<button onclick="Memberlistdel()">삭제</button>
	</div>
		<div>
			<select name="searchname">
					<option value="title">관리자</option>
					<option value="Content">회원</option>
			</select>		
			<input type="text" name="searchvalue" value=""/>
		<button onclick="flags(); MemberListsearch(1)">조회</button>			
	</div>
	
</body>
<script>
var showPage=1;
MemberlistCall(showPage);

$("#all").click(function(){
var $chk= $('input[type="checkbox"]');

if($(this).is(':checked')){
$chk.prop('checked',true);
}else{
$chk.prop('checked',false);
}

});         
function MemberlistCall(page){
	$.ajax({
		type:'GET',
		url:'MemberlistCall',
		data:{page:page},
		dataType:'JSON',
		
		success:function(data){

			drawList(data.list);

			_$('#pagination').twbsPagination({
				startPage:1, //시작페이지
				totalPages:data.total, //총 페이지 수
				visiblePages: 5, //기본으로 보여줄 페이지 수
				onPageClick:function(e, page){ // 클릭했을 때 실행 내용

					MemberlistCall(page);
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
		content+='<td><input type="checkbox" value="'+list[i].mem_id+'"</td>';
		content+='<td>'+list[i].mem_id+'</td>'
		content+='<td>'+list[i].mem_pnum+'</td>';
		content+='<td>'+list[i].mem_pw+'</td>';
		content+='<td>'+list[i].mem_email+'</td>';
		content+='<td>'+list[i].mem_name+'</td>';
		content+='<td>'+list[i].mem_age+'</td>';
		content+='<td>'+list[i].mem_add+'</td>';
		content+='<td><a href="MemberdetailForm?mem_id='+list[i].mem_id+'">관리</a></td>';
		/*content+='<td><button onclick="memberdetail('+list[i].mem_id+')">관리</button></td>';*/
		/*content+='<td><button type="button" onclick="location.href='./updateForm?idx=+list[i].ha_num+'">수정</button></td>'; */
		content+='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);	
}

function Memberlistdel(){

var chkArr=[];

$('input[type="checkbox"]:checked').each(function(ha_num,item){

if($(this).val()!='on'){
	
chkArr.push($(this).val());
}
});
console.log(chkArr);

$.ajax({
type:'GET',
url:'Memberlistdel',
data:{'delList':chkArr},
dataType:'JSON',
success:function(data){
	console.log(data);
	if(data.msg !=""){
		alert(data.msg);

		MemberlistCall(showPage);
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
	   paging += "<td colspan='9' id='paging'>";
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

function MemberListsearch(page){
	if(flag){
		drawPage();
	}	
	if($('select[name=searchname]').val()=='title'&&$('input[name=searchvalue]').val()=='admin'){		
	var mem_id =$('input[name=searchvalue]').val();
	var mem_power=2;
	}else if($('select[name=searchname]').val()=='title'&&$('input[name=searchvalue]').val()!='admin'){
		var mem_power=1;
	}
		else{
		var mem_id=$('input[name=searchvalue]').val();
		var mem_power=0;
	}
	$.ajax({
		type:'GET',
		url:'MemberListsearch',
		data:{mem_id,mem_power,page:page},
		datatype:'JSON',
		success:function(data){
		   console.log(data);

		   drawList(data.list);
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
 function memberdetail(){
     window.open("Memberdetail","팝업 테스트","width=600, height=600, top=20, left=500");
 }



</script>
</html>