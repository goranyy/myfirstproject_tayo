<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 리스트</title>
<!-- paging 처릴를 위한 부트스트랩 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
  var _$ = jQuery.noConflict();
</script>
<!-- 부트스트랩 -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<!-- 첨부한 js 파일 -->
<script src="resources/js/jquery.twbsPagination.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<style>
#searchvalue {
	width: 300px;
	padding-right: 10px;
	
}

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
<c:otherwise>
	<jsp:include page="header.jsp"></jsp:include>
</c:otherwise>
</c:choose>
<!-- 관리자_차량 목록 -->
<button class="btn btn-outLine-info" onclick="location.href='carPutForm'">등록하기</button>
<table>
	<thead>
		<tr>
			<th><input type="checkbox" id="chk_ALL" name="chk_ALL"/></th>
			<th>번호</th>
			<th>차량명</th>
			<th>가격</th>
			<th>연료</th>
		</tr>
	</thead>
	<tbody id="list">

	</tbody>
	<tr>
	<!-- 페이징 처리 -->
		<td colspan="5" id="paging">
			<input type="button" value="선택삭제" class="btn btn-outLine-info" onclick="deleteValue()" />
			<!-- 검색 -->
			<input type="text" id="searchvalue" name="searchvalue" value="" placeholder="차량명을 입력하세요." />
			<button id="searchBtn">검색</button>
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
var showPage = 1;
carList(showPage);

function carList(page){
	// ajax 호출
	$.ajax({
		type:	'GET',
		url:	'carList1',
		data:	{page:page},	 
		dataType: 'JSON',
		success: function(data){
			console.log("data: "+data);

			// list를 보여주는 함수 따로 생성
			drawList(data.list);
			
			// 플러그인 적용
			$('#pagination').twbsPagination({
				startPage:1, 	// 시작페이지
				totalPages: data.total,	// 총 페이지 수
				visiblePages:5,	// 기본으로 보여줄 페이지 수
				// 클릭했을 때 실행
				onPageClick: function(e,page){	
					// console.log(e);
					carList(page);
				}
			});
		},
		error: function(e){
			console.log(e);
		}
	});
} 

function drawList(list){
	var content ='';

	if(list.length < 1){
		var msg = "등록된 차량이 없습니다.";
		content += '<tr>';
		content += '<td colspan="5">'+msg+'</td>';	
		content += '</tr>';
		
		$('#list').empty();
		$('#list').append(content);
	} else{
		for(var i=0; i<list.length; i++){
			content += '<tr>';
			content += '<td><input type="checkbox" name="chk" value='+list[i].ca_num+'></td>';		
			content += '<td>'+list[i].ca_num+'</td>';			
			content += '<td><a href="carDetail?ca_num='+list[i].ca_num+'">'+list[i].ca_name+'</a></td>';	// 상세보기 
			content += '<td>'+list[i].ca_price+'</td>';	
			content += '<td>'+list[i].ca_fuel+'</td>';		
			content += '</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
	}
	
	
		
	// 체크박스
	$(function(){
		var chkObj = document.getElementsByName("chk");
		var chkCnt = chkObj.length;
		
		$("input[name='chk_ALL']").click(function(){
				var chk_ALL = $("input[name='chk']");
				for(var i=0; i<chk_ALL.length; i++){
				chk_ALL[i].checked = this.checked;
			}
		});
		$("input[name='chk']").click(function(){
			if($("input[name='RowCheck']:checked").length == chkCnt){
				$("input[name='chk_ALL']")[0].checked = true;
			} else{
				$("input[name='chk_ALL']")[0].checked = false;				
			}
		});
		
	}); // 체크박스
		
} // drawList()


// 선택삭제
function deleteValue() {
	console.log("삭제요청");
	var url = "Cardelete"; // 컨트롤러로 보내는 url
	var valueArr = new Array();
	var list = $("input[name='chk']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) { // 선택되어 있으면 배열에 값 저장
			valueArr.push(list[i].value);
		}
	} // end- for문
	
	if (valueArr.length == 0) {
		alert("선택된 항목이 없습니다.");
	} else {
		var chkVal = confirm((valueArr.length) + "개 삭제하시겠습니까?");
		
		if(chkVal==true){
			console.log(chkVal);
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {valueArr : valueArr},
				success : function(jdata) {
						alert("삭제 완료되었습니다.");
						carList(showPage);
				}
			}); // end-aJax
		} else if(chkVal==false){
			alert("삭제에 실패했습니다..");
			carList(showPage);
		}
		
	} // end-if~else

} //deleteValue()
	
	
// 검색
document.getElementById("searchBtn").onclick = function () {
    
	var keyword =  document.getElementsByName("searchvalue")[0].value;
	console.log(keyword);
	
	// 입력된 값 넘기기
	$.ajax({
		type:'GET',
	    url:'Carsearch',
	    data: {keyword},
	    datatype:'JSON',
	    success:function(data){
	    	console.log(data);
	        drawList(data.list);
	    }  
	});
};

</script>
</html>