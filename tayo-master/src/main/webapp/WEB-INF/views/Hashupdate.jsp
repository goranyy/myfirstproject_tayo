<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
	<div>
		<p>해시태그 관리(관리자)</p>
	</div>
	<form action="Hashupdate" method="post">
	<input type="hidden" name="ha_num" value="${hash.ha_num}"/>
	<table>
		<tr>
		<th>차량 명</th>
		<th>해시태그 이름</th>
		<th>해시태그 값</th>
		</tr>
		<tr>
		<td>
			<input type="text" name="ca_name" value="${hash.ca_name}"/>
		</td>
		<td>
			<input type="text" name="ha_name" value=""/>		
		</td>
		<td>
			<input type="text" name="ha_value" value=""/>		
			
		</td>
		</tr>
		<tr>
			<th colspan="3"><button>수정</button></th>
		</tr>
	</table>
	</form> 
	
	
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="all"/></th>
				<th>태그등록순서</th>
				<th>차량이름</th>
				<th>해시태그 이름</th>
				<th>해시태그 값</th>
			</tr>
			
		</thead>
		<c:if test="${list.size()<1}">
		<tr><td colspan="6">작성된 글이 없습니다</td></tr>
		</c:if>	
				<tbody id="list">
			</tbody>
		<tr>
			<td colspan="6" id="paging">
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>			
	</table>
	<div><button onclick="Hashdel()">삭제</button>
		<button onclick="location.href='./Hash'">취소</button>
	</div>
</body>
<script>
var showPage=1;
HashlistCall(showPage);

$("#all").click(function(){
var $chk= $('input[type="checkbox"]');

if($(this).is(':checked')){
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

			$('#pagination').twbsPagination({
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
		/* content+='<td><button type="button" onclick="location.href='./updateForm?idx=+list[i].ha_num+'">수정</button></td>'; */
		content+='</tr>';
		}
		$('#list').empty();
		$('#list').append(content);	
}

function Hashdel(){

var chkArr=[];

$('input[type="checkbox"]:checked').each(function(ha_num,item){

if($(this).val()!='on'){
	
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
</script>
</html>