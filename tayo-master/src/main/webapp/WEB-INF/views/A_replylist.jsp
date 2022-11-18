
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


<!-- <link rel="stylesheet" href="resources/common.css" type="text/css"> -->
<style>
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	} 
</style>
</head>
</head>
<body>
<jsp:include page="Adminheader.jsp"></jsp:include>
<h2>관리자 글관리 페이지</h2>

	<div>
		관리자 ID : ${sessionScope.loginId}
		<select name="Asearchname" onchange="if(this.value) location.href=(this.value);">
			<option value="" selected>===선택===</option>
			<option value="http://192.168.11.87:8080/tayo/A_alllist">전체</option>
			<option value="http://192.168.11.87:8080/tayo/A_Togetherlist">같이가볼래</option> 
			<option value="http://192.168.11.87:8080/tayo/a_reviewList">후기</option>
			<option value="http://192.168.11.87:8080/tayo/AdminQnalist">문의사항</option>
			<option value="http://192.168.11.87:8080/tayo/A_replylist">댓글</option>
			<option value="http://192.168.11.87:8080/tayo/a_noticeList">공지사항</option>
		</select> 
		<button onclick="A_replylistdel()">삭제</button>	
	<table>
	<!-- <thead> -->
		<tr>
			<th><input type="checkbox" id="all"/></th>
			<th>작성일</th>
			<th>해당글 카테고리</th>
			<th>댓글내용</th>
			<th>작성자</th>
			<th>비공개여부</th>
			<th>관리</th>
		</tr>
	<!-- </thead> -->
	<c:if test="${A_replylist.size()<1}">
	<tr><td colspan="7">작성된 글이 없습니다</td></tr>
	</c:if>
	<tbody id="list">	
	</tbody>
	<tr id="page">
		<td colspan="7" id="paging">
			<div>
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
		</td>
	</tr>
	</table>
	</div>
	
	<div>
         <select name="searchname">
               <option value="re_coment">댓글내용</option>
               <option value="mem_id">작성자</option>
         </select>      
         <input type="text" name="searchvalue" value=""/>
      <button onclick="flags(); A_replylistsearch(1)">조회</button>   
   </div>
	
</body>

<script>
var showPage=1;
A_replylistCall(showPage);

function A_replylistCall(page){
	$.ajax({
		type:'GET',
		url:'A_replylistCall',
		data:{page:page}, // page라는 이름으로 page넣기
		dataType:'JSON',
		success:function(data){
			
 			drawList(data.list);
			// 플러그인 적용
			_$('#pagination').twbsPagination({
				startPage:1, // 시작페이지
				totalPages:data.total, // 총 페이지 수
				visiblePages:5, // 기본으로 보여줄 페이지 수
				onPageClick:function(e,page){ //클릭했을 때 실행 내용
					//console.log(e);
					//console.log(page);
					A_replylistCall(page);
				}				
			});			
		},
		error:function(e){
			console.log(e);
		}		
	});	
}

function drawList(A_replylist){
	var content='';
	for(i=0;i<A_replylist.length;i++){
		//console.log(list[i]);
		content +='<tr>';
		content +='<td><input type="checkbox" value="'+A_replylist[i].re_num+'"/></td>';
		
		var date=new Date(A_replylist[i].re_date);
		//console.log(date);
		//console.log(date.toLocaleDateString('ko-KR'));
		content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';
		
		content +='<td>'+A_replylist[i].bo_name+'</td>';	
		content +='<td>'+A_replylist[i].re_coment+'</td>';
		content +='<td>'+A_replylist[i].mem_id+'</td>';
		
		if(!A_replylist[i].se_secret){
			content +='<td>'+"무"+'</td>';
		}else{
			content +='<td>'+A_replylist[i].se_secret+'</td>';
		}
		
	      if(A_replylist[i].bo_num=1){
	          content +='<td><a href="review_detail?num='+A_replylist[i].num+'">'+"상세보기"+'</a></td>';      
	       }else if(A_replylist[i].bo_num=2){
	          content +='<td><a href="Qnadetail?num='+A_replylist[i].num+'">'+"상세보기"+'</a></td>';
	       }else if(A_replylist[i].bo_num=3){
	          content +='<td><a href="notice_detail?num='+A_replylist[i].num+'">'+"상세보기"+'</a></td>';
	       }else if(A_replylist[i].bo_num=4){
	          content +='<td><a href="Togetherdetail?num='+A_replylist[i].num+'">'+"상세보기"+'</a></td>';
	       }
			
		content +='</tr>';
	}
	$('#list').empty();
	$('#list').append(content);
}

function A_replylistdel(){
		
		var chkArr=[];
		
		$('input[type="checkbox"]:checked').each(function(mem_id,re_coment){
			
					if($(this).val()!='on'){
				chkArr.push($(this).val());	
			}
		});
		
		console.log(chkArr)
		;
		$.ajax({
			type:'GET',
			url:'A_replylistdel',
			data:{'delList':chkArr},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.msg!=""){
					alert(data.msg);
					A_replylistCall(showPage);				
				}
			},			
			error:function(e){
				console.log(e);
			}
				
		});
	}

	$("#all").click(function(){
		var $chk=$('input[type="checkbox"]');
		//console.log($chk);
		// attr : 정적인 속성을 다룰때
		// prop : 동적인 속성을 다룰때
		if($(this).is(':checked')){
			$chk.prop('checked',true);
		}else{
			$chk.prop('checked',false);
		}
	});
	

	function drawPage(){
		
		   var paging = "";	   
		   $("#page").empty();
		   paging += "<td colspan='7' id='paging'>";
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

	function A_replylistsearch(page){
		if(flag){
			drawPage();
		}	
		if($('select[name=searchname]').val()=='re_coment'&&'mem_id'){
			  var re_coment =$('input[name=searchvalue]').val();      
		   }else{
		      var mem_id=$('input[name=searchvalue]').val();
		   }
		   $.ajax({
		      type:'GET',
		      url:'A_replylistsearch',
		      data:{re_coment,mem_id,page:page},
		      datatype:'JSON',
		      success:function(data){
		         console.log(data);	      
		         drawList(data.list); 
		         
		         _$("#pagination").twbsPagination({
		             startPage:1,
		             totalPages:data.total,
		             visiblePages:5,
		             onPageClick:function(e, page){
		            	 A_replylistsearch(page);
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