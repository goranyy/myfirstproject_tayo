<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/common.css" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
  var _$ = jQuery.noConflict();
</script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
/* 댓글 css */
.outer-div {
	width: 100%;
 	text-align: center;
}

.inner-div {
	margin: auto;
    border: 2px solid;
    width: 1403px;
}

.repleList {
 	margin: auto;
	border-bottom: 1px solid;
	width: 1400px; 
}

.rereply-content {
	border: 1px solid;
    margin: auto;
}

.reReple{
	border: 1px solid;
	border-color: gray;
	display: none;
	margin:auto;
	width: 900px;
}

.reReBox {
 	border : 1px solid #eaeaea; 
}

#replyW {
width: 300px;
}

/* 비공개 토글 버튼 css */
.toggleSwitch {
  width: 6rem;
  margin: 2rem;
  height: 3rem;
  display: block;
  position: relative;
  border-radius: 2rem;
  background-color: #fff;
  box-shadow: 0 0 1rem 3px rgba(0 0 0 / 15%);
  cursor: pointer;
}

.toggleSwitch .toggleButton {
  width: 2.6rem;
  height: 2.6rem;
  position: absolute;
  top: 50%;
  left: .2rem;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #f03d3d;
}

/* 체크박스 css */
.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	.secret {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
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
<c:when test="${power eq 0}">
	<jsp:include page="header.jsp"></jsp:include>
</c:when>
<c:otherwise>
	<jsp:include page="logoutheader.jsp"></jsp:include>
</c:otherwise>
</c:choose>
<input type="hidden" id="num" value="${total.num}">
	<table id="detail">
		<c:if test="${sessionScope.power > 0}">
				<tr>
					<c:choose>
						<c:when test="${total.se_secret eq '무' || total.se_secret eq null}">
							<td colspan="2" style="text-align: right;">
								<span><b>게시물 비공개 처리 </b></span>
								<label class="switch" style="margin-top: 5px;">
									<input type="checkbox" onclick="detailSecret(this)">
									<span class="slider round"></span>
								</label>
								<p class="secret">OFF</p>
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="2" style="text-align: right;">
								<span><b>게시물 비공개 처리 </b></span>
								<label class="switch" style="margin-top: 5px;">
									<input type="checkbox" checked onclick="detailSecret(this)">
									<span class="slider round"></span>
								</label>
								<p class="secret">ON</p>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:if>
		<tr>
			<th>제목</th>
			<td>${total.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td class="writer">${total.mem_id}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${total.content}</td>
		</tr>
		<c:if test="${fileList.size()>0}">
		<tr>
			<th>이미지</th>
			<td>
				<c:forEach items="${fileList}" var="file">
					<img src="/photo/${file.newFileName}"/><br><br>
				</c:forEach>
			</td>
		</tr>
		</c:if>

	</table>
				<button type="button" onclick="location.href='./reviewList'">리스트</button>
            <c:if test="${sessionScope.loginId eq total.mem_id}" >
               <button type="button" onclick="location.href='./review_updateForm?num=${total.num}'">수정하기</button>
            </c:if>
            <c:if test="${(sessionScope.loginId eq total.mem_id) || sessionScope.power>0}">
               <button type="button" class="delete">삭제</button>
            </c:if>
<%-- 				<button type="button" onclick="location.href='delete?num=${total.num}'" class="delete">삭제</button> --%>

	<!-- 댓글  -->
	<div class="outer-div">
		<br>
			<h3 style="text-align: left;" >댓글</h3>
		<br>
		<div class="inner-div">
			<!-- 댓글 목록 -->
	       	<div class="repleList">
	       		<!-- 댓글 리스트가 들어가는 공간 -->
	        </div>
	        
	        <div>
	        	<div id="paging">
	        		<div class="container">
						<nav aria-label="Page navigation" style="text-align: center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
	        	</div>
	        </div>
	        
	        <!-- 로그인 시에만 입력 창 나옴 -->
	        <c:choose>
	            <c:when test="${not empty sessionScope.loginId }">
			        <div class="row reply_write">
						<div class="col-8" class="input_reply_div">
							<input id="replyW" type="text" placeholder="댓글을 입력해 주세요">
							<button type="button" id="replySubmit" class="btn btn-success mb-1 write_reply">등록</button>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<h4>&lt;&lt; 댓글 입력을 하시려면 로그인을 해주세요. &gt;&gt;</h4>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
<script>
// function save(){
// 	var result = confirm("등록하시겠습니까?");
// 	if(result == true){
// 		alert("등록되었습니다.");
// 	}else{
// 		alert("취소하였습니다.");
// 	}
// }


$(".delete").click(function(){
	var result = confirm("삭제하시겠습니까?");
	if(result == true){
		$(location).attr('href', 'review_delete?num=${total.num}');
		alert("삭제되었습니다.");
	}else{
		alert("취소하였습니다.");
		return false;
	}
});


var num = document.getElementById("num").value; //게시물 번호
var loginId='${sessionScope.loginId}';
var memPower='${sessionScope.power}';

if('${total.se_secret}' == '유' && (memPower == 0 || memPower == null)){
	alert("비공개 처리 된 글입니다. \n접근 할 수 없습니다.")
	location.href="./";
}

var page = 1;

listCall(num, page);

function listCall(num, page) {
	$('#list').empty();
	$.ajax({
		type:'POST',
		url:'replyListCallR',
		data:{num:num, page:page},
		datatype:'JSON',
		success:function(data){
			drawList(data.list, data.total);
			console.log(data.list);
		},
		error:function(e){
			alert("댓글 불러오기 실패. \n페이지를 새로고침 해주세요.")
		}      
	});
}

function drawList(list, total){
	var content='';
	
	if(list.length > 0){
		for(var i=0; i<list.length; i++){
			var date = new Date(list[i].re_date);
			content += "<div id='reOuterDiv'>";
			// 댓글
			content += "<div class='rereply-content'>";
			content += 		"<br>";
			content += 		"<span class='reNum'>";
			content += 			'<input type="hidden" readonly value="'+list[i].re_num+'"/></input>'
			content += 		"</span>";
			content += 		"<span>";
            content += 			date.toLocaleDateString('ko-KR');
			content += 			"&emsp;&emsp;|";
			content += 		"</span>";
			content += 		"<span>";
			content += 			"&emsp;&emsp;";
			content += 			"<b>"+ list[i].mem_id +"</b>";
			content += 		"</span>";
			if((list[i].se_secret==null || list[i].se_secret=='무')|| memPower > 0){
				content += 		"<p class='comment' style='margin-top:10px;'>";
				content += 			"<span>";
				content += 				list[i].re_coment;
	            content += 			"</span>";
	            content += 				'<input type="hidden" style="width=150px"" value="'+list[i].re_coment+'" >';			
	            content += 		"</p>";
			}else{
				content += 		"<p class='comment' style='margin-top:10px;'>";
				content += 			"<span>";
				content += 				'비공개 처리된 댓글입니다.'
	            content += 			"</span>";			
	            content += 		"</p>";
			}
            content += 		"<span>";
            content+=			'<button class="reReList" onclick="reReplyList(this)">'+'답글'+'</button>';
            content += 		"</span>";
           	if(loginId==list[i].mem_id && (list[i].se_secret==null || list[i].se_secret=='무')){
		        content += 		"<span>";
		        content += 			"&emsp;";
		        content+=			'<button onclick="replyModify(this)">'+'수정'+'</button>';
		        content += 			"&emsp;";
		        content += 		"</span>";
	        }
           	if(loginId==list[i].mem_id && (list[i].se_secret==null || list[i].se_secret=='무') || memPower > 0){
		        content+=			'<button class="reDel" onclick="replyDel('+list[i].re_num+')">'+'삭제'+'</button>';
           	}
           	content += 		"&emsp;";
           	if(memPower>=1){ //비공개 토글 버튼
           		if(list[i].se_secret==null || list[i].se_secret=='무'){
           			content+=			'<label class="switch">';
    	           	content+=			'<input type="checkbox" onclick="reSecret(this'+','+'\''+list[i].se_secret+'\''+')">';
    	           	content+=			'<span class="slider round"></span>';
    	           	content+=			'</label>';
    	           	content+=			'<p class="secret">OFF</p>';
           		}else{
           			content+=			'<label class="switch">';
    	           	content+=			'<input type="checkbox" checked onclick="reSecret(this'+','+'\''+list[i].se_secret+'\''+')">';
    	           	content+=			'<span class="slider round"></span>';
    	           	content+=			'</label>';
    	           	content+=			'<p class="secret">ON</p>';
           		}
           	}
            content += 		"<br>";
            content += 		"<br>";
            content += 		"<div class='reReple'>";
            				/* 답글이 들어갈 공간 */
            content += 		"</div>";            
			content += "</div>";
		}
	}else{
		content+='<tr>';
		content+='<h6>'+'&lt;&lt; 등록된 댓글이 없습니다. &gt;&gt;'+'</h6>';
		content+='</tr>';
	}
	$('.repleList').empty(); //비워내고
    $(".repleList").append(content); //넣음
    
    /* 페이징 처리 */
    _$('#pagination').twbsPagination({
		startPage:1, //시작페이지
		totalPages:total, //총 페이지 수
		visiblePages: 5, //기본으로 보여줄 페이지 수
		onPageClick:function(e, page){ // 클릭했을 때 실행 내용
			listCall(num, page);
		}
	});
}

$("#replySubmit").click(function(){
	var reply = document.getElementById("replyW").value;
	if(reply=='null'||reply==''){
		alert('내용을 입력해 주세요');
	}else{
		$.ajax({
			type:'POST',
			url:'replyWriteR',
			data:{reply:reply, num:num},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					document.getElementById("replyW").value="";
					listCall(num, page);
				}else{
					alert("댓글 등록 실패");
				}
			},
			error:function(e){
				alert("댓글 등록 실패 \n서버와 연결을 할 수 없습니다.");
			}
		});
	}
})

function replyModify(modifyBtn){
	var comment = $(modifyBtn).closest("div").find("p.comment");
	$(comment).find("span").hide();
	$(comment).find("input").prop("type","text");
	$(modifyBtn).html("저장");
	modifyBtn.setAttribute("onclick","modify(this)");
	$(modifyBtn).closest("div").find("button.reDel").html("취소");
	$(modifyBtn).closest("div").find("button.reDel").attr("onclick","reCancel()")
}

function modify(modifyBtn){
	var comment = $(modifyBtn).closest("div").find("p.comment");
	var recom = $(comment).find("input").val();
	var reNum = $(modifyBtn).closest("div").find("span.reNum");
	var reNumVal = $(reNum).find("input").val();
	if(recom=='null'||recom==''){
		alert('내용을 입력해 주세요');
	}else{
		$.ajax({
			type:'POST',
			url:'replyUpdateR',
			data:{reNumVal:reNumVal, recom:recom},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					listCall(num, page);
				}else{
					alert("댓글 수정 실패");				
				}
			},
			error:function(e){
				alert("댓글 수정 실패 \n서버와 연결을 할 수 없습니다.");
			}
		});
	}
}

function replyDel(re_num){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			type:'POST',
			url:'replyDeleteR',
			data:{re_num:re_num},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					listCall(num, page);
				}else{
					alert("댓글 삭제 실패");				
				}
			},
			error:function(e){
				alert("댓글 삭제 실패 \n서버와 연결을 할 수 없습니다.");
			}
		});
	}
}

function reCancel(){ //수정 취소
	listCall(num, page);
}

// 아ㅏㅏㅏ 힘들다ㅏㅏㅏㅏ
function reReplyList(reReListBtn){
	var reNum = $(reReListBtn).closest("div").find("span.reNum").find("input").val();
	$(reReListBtn).closest("div").find(".reReple").attr("style", "display: block");
	var recontent='';
	$.ajax({
		type:'POST',
		url:'reReplyListCallR',
		data:{reNum:reNum},
		datatype:'JSON',
		success:function(data){
 			drawList2(data.list, reReListBtn, reNum);
		},
		error:function(e){
		   alert("답글 목록 불러오기 실패 \n다시 시도해주세요")
		}      
	});
	
	$(reReListBtn).html("닫기");
	$(reReListBtn).attr("onclick","reReClose(this)")
}

/* 대댓글 */
function drawList2(list, reReListBtn, reNum){
	var recontent='';
	recontent += '<br>'
	if(list.length > 0){
		for(var i=0; i<list.length; i++){
			var date = new Date(list[i].rr_date);
			recontent += 		"<div class='reReBox'>";
			recontent += 		'<input class="reReNum" type="hidden" value="'+list[i].rr_num+'"/></input>';
			recontent += 		'<span>'+list[i].rr_coment+'&emsp; &emsp; |  &emsp; &emsp;'+'</span><input class="rr_comment" type="hidden" value="'+list[i].rr_coment+'"/>';
			recontent += 		'<span>'+'<b>'+list[i].mem_id+'</b>'+' &emsp; |  &emsp;'+'</span>';
			recontent += 		'<span>'+date.toLocaleDateString('ko-KR')+'&emsp;'+'</span>';
			if(loginId==list[i].mem_id){
				recontent += 		'<button onclick="reReplyModify(this)">'+'수정'+'</button>';
				recontent += 		'<button onclick="reRepleDel(this)">'+'삭제'+'</button>';
			}
			recontent += 		"</div>";
		}
	}else{
		recontent += '<h5>&lt;&lt; 등록된 답글이 없습니다. &gt;&gt;</h5>'
	}
	
	var content='';
	
	/* 답글 입력 */
	recontent += '<br>'
	if(loginId.length == ""){
		recontent += '<h4>'+'&lt;&lt; 답글을 입력하시려면 로그인을 해주세요 &gt;&gt;'+'</h4>'
	}else{
		recontent += 		"<div>";
		recontent += 		'<input type="text" placeholder="답글을 입력해 주세요" value=""/></input>';
		recontent += 		'<button onclick="reReplySubmit('+'this'+","+reNum+')">'+'등록'+'</button>';
		recontent += 		"</div>";		
	}
	recontent += '<br>'
	
	$(reReListBtn).closest("div").find("div.reReple").empty();
	$(reReListBtn).closest("div").find("div.reReple").append(recontent);
}

function reRepleDel(reRepleDelBtn){
	var reReListBtn = $(reRepleDelBtn).closest("div").parent().parent().find(".reReList");
	var reReNum = $(reRepleDelBtn).closest("div").find(".reReNum").val();
	
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			type:'POST',
			url:'reReplyDeleteR',
			data:{rr_num:reReNum},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					reReplyList(reReListBtn);
				}else{
					alert("댓글 삭제 실패");				
				}
			},
			error:function(e){
				alert("답글 삭제 실패 \n서버와 연결할 수 없습니다.")
			}
		});
	}
	
}

// 답글 닫기
function reReClose(reReCloseBtn){
	$(reReCloseBtn).closest("div").find("div.reReple").empty();
	$(reReCloseBtn).closest("div").find("div.reReple").attr("style", "display: none");
	$(reReCloseBtn).html("답글");
	reReCloseBtn.setAttribute("onclick","reReplyList(this)");
}

function reReplySubmit(reReBtn, reReNum){
	var reReListBtn = $(reReBtn).closest("div").parent().parent().find(".reReList");
	var reReply = $(reReBtn).closest("div").find("input");
	
	if(reReply.val()=='null'||reReply.val()==''){
		alert('내용을 입력해 주세요');
	}else{
		$.ajax({
			type:'POST',
			url:'reReplyWriteR',
			data:{reReply:reReply.val(), reReNum:reReNum},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					reReply.val('');
					reReplyList(reReListBtn);
				}else{
					alert("답글 등록 실패");
				}
			},
			error:function(e){
				alert("답글 등록 실패 \n서버와 연결할 수 없습니다.")
			}      
		});
	}
}

function reReplyModify(reReModiBtn){
	var reComment = $(reReModiBtn).closest("div").find(".rr_comment");
	$(reReModiBtn).closest("div").find("span").hide();
	$(reComment).prop("type","text");
	$(reReModiBtn).html("저장");
	reReModiBtn.setAttribute("onclick","reModify(this)");
	$(reReModiBtn).next().html("취소");
	$(reReModiBtn).next().attr("onclick","reReModiCancelBtn(this)")
}

function reModify(reModifyBtn){
	var reReListBtn = $(reModifyBtn).closest("div").parent().parent().find(".reReList");
	var reComment = $(reModifyBtn).closest("div").find(".rr_comment").val();
	var reReNum = $(reModifyBtn).closest("div").find(".reReNum").val();
	if(reComment=='null'||reComment==''){
		alert('내용을 입력해 주세요');
	}else{
		$.ajax({
			type:'POST',
			url:'reReplyUpdateR',
			data:{reComment:reComment, reReNum:reReNum},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					reReplyList(reReListBtn);
				}else{
					alert("답글 수정 실패");				
				}
			},
			error:function(e){
				alert("답글 수정 실패 \n서버와 연결할 수 없습니다.")
			}
		});
	}
}

function reReModiCancelBtn(reReModiCancelBtn){
	var reReListBtn = $(reReModiCancelBtn).closest("div").parent().parent().find(".reReList");
	reReplyList(reReListBtn);
}

/* 게시글 비공개 */
function detailSecret(dtSecretBtn){
	var check = $(dtSecretBtn).attr('checked');
	var writer = $('#detail').find('.writer').text();
	var secret = '${total.se_secret}';
	if(check == 'checked'){
		$(dtSecretBtn).removeAttr('checked');
		$.ajax({
			type:'POST',
			url:'detailSecretCancelR',
			data:{num:num, writer:writer},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					alert("비공개 취소 완료 \n새로고침 될 때까지 기다려 주세요")
					location.reload(true);
				}else{
					alert("비공개 취소가 정상적으로 동작되지 않았습니다. \n다시 시도해 주세요");
				}
			},
			error:function(e){
				alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
			}
		});
	}else{
		$(dtSecretBtn).attr('checked', 'on');
		if(secret=='무'){
			$.ajax({
				type:'POST',
				url:'detailSecretUpdateR',
				data:{num:num, writer:writer},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						alert("비공개 처리 완료 \n새로고침 될 때까지 기다려 주세요")
						location.reload(true);
					}else{
						alert("비공개 처리가 정상적으로 동작되지 않았습니다. \n새로고침을 하지 않은 상태로 비공개를 취소하시고, 다시 시도해 주세요.");
					}
				},
				error:function(e){
					alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
				}
			});
		}else{
			$.ajax({
				type:'POST',
				url:'detailSecretInsertR',
				data:{num:num, writer:writer},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						alert("비공개 처리 완료 \n새로고침 될 때까지 기다려 주세요")
						location.reload(true);
					}else{
						alert("비공개 처리가 정상적으로 동작되지 않았습니다. \n새로고침을 하지 않은 상태로 비공개를 취소하시고, 다시 시도해 주세요.");
					}
				},
				error:function(e){
					alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
				}
			});
		}//end else-if
	}//end else-if
}

function reSecret(reSecretBtn, secret){
	var reNum = $(reSecretBtn).closest("div").find("span.reNum").find("input").val();
	var writer = $(reSecretBtn).closest("div").find("span.reNum").next().next().find('b').html();
	var check = $(reSecretBtn).attr('checked');
	
	if(check == 'checked'){
		$(reSecretBtn).removeAttr('checked');
		$.ajax({
			type:'POST',
			url:'replySecretCancelR',
			data:{reNum:reNum, writer:writer},
			datatype:'JSON',
			success:function(data){
				if(data.success>0){
					listCall(num, page);
				}else{
					alert("비공개 취소가 정상적으로 동작되지 않았습니다. \n다시 시도해 주세요");
				}
			},
			error:function(e){
				alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
			}
		});
	}else{
		$(reSecretBtn).attr('checked', 'on');
		if(secret=='무'){
			$.ajax({
				type:'POST',
				url:'replySecretUpdateR',
				data:{reNum:reNum, writer:writer},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						listCall(num, page);
					}else{
						alert("비공개 처리가 정상적으로 동작되지 않았습니다. \n다시 시도해 주세요");
					}
				},
				error:function(e){
					alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
				}
			});
		}else{
			$.ajax({
				type:'POST',
				url:'replySecretInsertR',
				data:{reNum:reNum, writer:writer},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						listCall(num, page);
					}else{
						alert("비공개 처리가 정상적으로 동작되지 않았습니다. \n다시 시도해 주세요");
					}
				},
				error:function(e){
					alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
				}
			});
		}//end if/else
	}//end if/else
}
</script>
</html>