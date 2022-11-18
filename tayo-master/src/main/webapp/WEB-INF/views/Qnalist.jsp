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
<h2>고객 지원</h2>	
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
<c:when test="${power eq null}">	
</c:when>
<c:otherwise>
		<button onclick="location.href='QnawriteForm'" id="write">글 작성하기</button>	
</c:otherwise>
</c:choose>	
	
	
		<!-- 검색  -->
	 <div id="searchbox">
         <select name="searchname">
               <option value="title">제목</option>
               <option value="mem_id">작성자</option>
         </select>      
         <input type="text" name="searchvalue" value=""/>
      <button onclick="search()">조회</button>   
   </div>
   
	<table style="border: none;">
			<tr>
			<td colspan="5" id="paging"> <!-- 아래는 pagination 적용시 필수 작성 내용  -->
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>
	

</body>
<script>
	var showPage = 1;//현재 보여주고 있는 페이지를 1로 잡는다 
	QnalistCall(showPage); //hoisting //listCall 실행 //listCall은 showpage에 의해 출력

	function QnalistCall(page) {
		$.ajax({
			type : 'GET', //전송 방식
			url : 'QnalistCall', //요청 보낼 서버 
			data : {
				page : page
			}, //페이지에 페이지를 넣는다.
			dataType : 'JSON', //데이터를 주고 받을 형태 
			success : function(data) { //성공했을 때 넣을 데이터
				console.log(data);
				drawList(data.list); //data에 있는 list를 전달받은 후 drawList를 실행시킨다. 

				//pagination 플러그인 적용 
				_$('#pagination').twbsPagination({
					startPage : 1, //시작 페이지
					totalPages : data.total, // 총 페이지 수 
					visiblePages : 5, //기본으로 보여줄 페이지 수 
					onPageClick : function(e, page) {//클릭했을 때 실행 내용 //e는 event
						console.log(e);
						QnalistCall(page); //listCall을 호출해서 클릭한 page가 가도록 한다. -> 클릭할때 logger.info(list 요청!! +page) 페이지 수에 변화가 있다. 
					}
				});

			},
			error : function(e) { //에러 났을 때 넣을 데이터 
				console.log(e);
			}
		});
	}

	// 수정 부분
	var memPower='${sessionScope.power}';
	function drawList(list) { //데이터가 정상적으로 들어와있고 로그인이 되어있는 상태면 위의 drawList(data.list)를 호출한다.
		var content = ''; //for문이 돌때마다 한줄씩 생기기 위해 누적합으로 <tr>로 시작하고 </tr>로 끝낸다. 제이쿼리 시간에 배운거 응용
		//데이터가 정상적으로 들어와있는지 확인하기 위해 for문
		for (var i = 0; i < list.length; i++) {
			content += '<tr>';
			content += '<td>' + list[i].num + '</td>'; //list의 i번째에 있는 id 
			
			if((list[i].se_secret==null || list[i].se_secret=='무')){	
				content +='<td><a href="Qnadetail?num='+list[i].num+'">'+list[i].title+'</a></td>';		
			}else if(list[i].se_secret=='유'){
				if(memPower > 0){
					content +='<td><b>[비공개 된 글]&emsp;</b><a href="Qnadetail?num='+list[i].num+'">'+list[i].title+'</a></td>';		
				}else{
					content +='<td>비공개 처리된 글입니다.</td>';
				}
			}
					
			content += '<td>' + list[i].mem_id + '</td>'; //list의 i번째에 있는 id 	
			content += '<td>' + list[i].cnt + '</td>';
			var date = new Date(list[i].to_date); //reg_date를 date객체로 만든다. 
			content += '<td>' + date.toLocaleDateString('ko-KR') + '</td>';

			content += '</tr>';
		}
		$('#list').empty(); //삭제 한번시키고 
		$('#list').append(content); //그 안의 내용을 덧붙이다. 
	}
	
	function search(){
		   if($('select[name=searchname]').val()=='title'&&'mem_id'){
			   var title=$('input[name=searchvalue]').val();    
		   }else{
			   var mem_id =$('input[name=searchvalue]').val();  
		   }
		   
		   $.ajax({
		      type:'GET',
		      url:'Qnasearch',
		      data:{mem_id,title},
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

