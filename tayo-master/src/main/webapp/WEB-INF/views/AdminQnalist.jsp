
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
	img{
   	padding: 100px 100px;
   }
</style>
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
	</div>
	<table class="table table-striped" id="detail">
	<thead>
		<tr>
			<th><input type="checkbox" id="all"/></th>
			<th>번호</th>
			<th>제목</th>			
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>비공개여부</th>
		</tr>
	</thead>
	<c:if test="${list.size()<1}">
		<tr><td colspan="6">작성된 글이 없습니다</td></tr>
	</c:if>
	<tbody id="list">	
	</tbody>
	</table>
		<button onclick="AdminQnaChkDel()">삭제</button>	
	<div>
         <select name="searchname"  id="pagePerNum" >
               <option value="title">제목</option>
               <option value="mem_id">작성자</option>
         </select>      
         <input type="text" name="searchvalue" value=""/>
      <button onclick="flags(); AdminQnasearch(1)">조회</button>   
   </div>
	<table>
	<tr>
		<td colspan="7" id="paging">
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
AdminQnalistCall(showPage);

//체크박스
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

function AdminQnalistCall(page){
	$.ajax({
		type:'GET',
		url:'AdminQnalistCall',
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
					AdminQnalistCall(page);
				}				
			});			
		},
		error:function(e){
			console.log(e);
		}		
	});	
}//AdminQnalistCall(page)


function drawList(AdminQnalist){
	var content='';
	for(i=0;i<AdminQnalist.length;i++){
		content +='<tr>';
		content +='<td><input type="checkbox" value="'+AdminQnalist[i].num+'"/></td>';
		content +='<td>'+AdminQnalist[i].num+'</td>';		
		content +='<td><a href="Qnadetail?num='+AdminQnalist[i].num+'">'+AdminQnalist[i].title+'</a></td>';	
		content +='<td>'+AdminQnalist[i].mem_id+'</td>';
		content +='<td>'+AdminQnalist[i].cnt+'</td>';		
	
		
		var date=new Date(AdminQnalist[i].to_date);
		content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>';
		if(!AdminQnalist[i].se_secret){
	         content +='<td>'+"무"+'</td>';
	      }else{
	         content +='<td>'+AdminQnalist[i].se_secret+'</td>';
	      }
		content +='</tr>';
	}
	$('#list').empty();
	$('#list').append(content);
}//drawList(AdminQnalist)


	//창 다시 그려주기
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

	//검색기능
	function AdminQnasearch(page){
		
		if(flag){
			drawPage();
		}
		
	   if($('select[name=searchname]').val()=='title'&&'mem_id'){
		  var title =$('input[name=searchvalue]').val();      
	   }else{
	      var mem_id=$('input[name=searchvalue]').val();
	   }
	   $.ajax({
	      type:'GET',
	      url:'AdminQnasearch',
	      data:{title,mem_id,page:page},
	      datatype:'JSON',
	      success:function(data){
	         console.log(data);	      
			  console.log(data.list);
			  console.log(data.total);
	         drawList(data.list);        
	         		
	         		//검색 후 페이징 처리
		         _$("#pagination").twbsPagination({
		             startPage:1,
		             totalPages:data.total,
		             visiblePages:5,
		             onPageClick:function(e, page){
		            	 AdminQnasearch(page);
		                flag = false;
	             }
	          });
	      },
	      error:function(e){
	         console.log(e);
	      }      
	      });    
	}//AdminQnasearch()
	
	
	
	//체크된 목록 삭제
	function AdminQnaChkDel(){
		var chkArr=[];
		
		$('input[type="checkbox"]:checked').each(function(mem_id,title){
			if($(this).val()!='on'){
				chkArr.push($(this).val());	
			}
		});
		
		console.log(chkArr)
		;
		$.ajax({
			type:'GET',
			url:'AdminQnaChkDel',
			data:{'delList':chkArr},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.msg!=""){
					alert(data.msg);
					// 삭제가 완료되면 ajax는 기본적으로 페이지를 새로고침 하지 않는다
					// 그래서 리스트를 다시 호출해 그려야 한다
					AdminQnalistCall(showPage);		
				}
			},			
			error:function(e){
				console.log(e);
			}	
		});
	}//AdminQnaChkDel()
	
	
	



</script>

</html>