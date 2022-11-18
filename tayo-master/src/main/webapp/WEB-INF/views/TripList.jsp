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
		<p>여행지 관리</p>
	</div>

	<table>
<!-- 		<thead> -->
		<tr>
			<th><input type="checkbox" id="all"/></th>
			<th>NO</th>
			<th>여행지 이름</th>
			<th>여행지 주소</th>
		</tr>
		<!-- </thead> -->
		<c:if test="${list.size()<1}">
			<tr>
				<td colspan="4">등록된 여행지가 없습니다.</td>
			</tr>
		</c:if>			
				<tbody id="list">
			
				</tbody>
		<tr>
			<td colspan="4" id="paging">
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>			
	</table>
	<div>
		<button onclick="Triplistdel()">삭제</button>
	</div>
</body>
<script>
var showpage=1;
TriplistCall(showpage);
$("#all").click(function(){
	var _$chk= _$('input[type="checkbox"]');

	if(_$(this).is(':checked')){
	$chk.prop('checked',true);
	}else{
	$chk.prop('checked',false);
	}
}); 	
function TriplistCall(page){
		$.ajax({
			type:'GET',
			url:'TriplistCall',
			data:{page:page},
			dataType:'JSON',
			
			success:function(data){

				drawList(data.list);

				_$('#pagination').twbsPagination({
					startPage:1, //시작페이지
					totalPages:data.total, //총 페이지 수
					visiblePages: 5, //기본으로 보여줄 페이지 수
					onPageClick:function(e, page){ // 클릭했을 때 실행 내용

						TriplistCall(page);
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
			content+='<td><input type="checkbox" value="'+list[i].tr_num+'"</td>';
			content+='<td>'+list[i].tr_num+'</td>'
			content+='<td>'+list[i].tr_name+'</td>';
			content+='<td>'+list[i].tr_addr+'</td>';
			content+='</tr>';
			}
			$('#list').empty();
			$('#list').append(content);	
	}
	function Triplistdel(){

		var chkArr=[];

		$('input[type="checkbox"]:checked').each(function(ha_num,item){

		if(_$(this).val()!='on'){
			
		chkArr.push($(this).val());
		}
		});
		console.log(chkArr);

		$.ajax({
		type:'GET',
		url:'Triplistdel',
		data:{'delList':chkArr},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.msg !=""){
				alert(data.msg);

				TriplistCall(showPage);
			}
		},
		error:function(e){
			console.log(e);
		}
		});

		}
	
</script>
</html>