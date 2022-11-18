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
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="resources/common.css" type="text/css">
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

#replyW {
width: 300px;
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
<input type="hidden" id="num" value="${Qnadto.num}">
		<table class="table table-striped" id="detail">
			<c:if test="${sessionScope.power > 0}">
					<tr>
						<c:choose>
							<c:when test="${Qnadto.se_secret eq '무' || Qnadto.se_secret eq null}">
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
				<td>${Qnadto.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td class="writer">${Qnadto.mem_id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${Qnadto.to_date}</td>
			</tr>			
			<tr>
				<th>내용</th>
				<td class="content_area">${Qnadto.content}</td>
			</tr>
		<c:if test="${fileList.size()>0}">
			<tr>
				<th>이미지</th>
				<td>
					<c:forEach items="${fileList}" var="file">
						<img src="/photo/${file.newFileName}"><br /><br />
					</c:forEach></td>
			</tr>
		</c:if>
		<tr>
				<td colspan="2" class="btn_area">
					<c:if test="${sessionScope.loginId eq total.mem_id}" >
					<button type="button" onclick="location.href='./QnaupdateForm?num=${Qnadto.num}'">수정하기</button>
					</c:if>
					<button type="button" onclick="location.href='./Qnalist'">목록</button>
					 <c:if test="${(sessionScope.loginId eq total.mem_id) || sessionScope.power>0}">
					<button type="button"  class="deleteQ" onclick="location.href='./Qnadelete?num=${Qnadto.num}'">삭제</button>
					</c:if>
				</td>
			</tr>		
		</table>
		
			<!-- 답변  -->
	<div class="outer-div">
		<br>
			<h3 style="text-align: left;" >답변</h3>
		<br>
		<div class="inner-div">
			<!-- 답변 목록 -->
	       	<div class="repleList">
	       		<!-- 답변 리스트가 들어가는 공간 -->
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
	        
	        <!-- 관리자만 입력 창 나옴 -->
	        <c:choose>
	            <c:when test="${sessionScope.power >= 1}">
			        <div class="row reply_write">
						<div class="col-8" class="input_reply_div">
							<input id="replyW" type="text" placeholder="답변을 입력해 주세요">
							<button type="button" id="replySubmit" class="btn btn-success mb-1 write_reply">등록</button>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<h4>&lt;&lt; 답변은 관리자만 할 수 있습니다. &gt;&gt;</h4>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
<script>
	$(".deleteQ").click(function() {
		if(confirm("삭제하시겠습니까?")){
			alert("삭제되었습니다.")
		}
	})
	
	var num = document.getElementById("num").value; //게시물 번호
	var loginId='${sessionScope.loginId}';
	var memPower='${sessionScope.power}';
	
	if('${Qnadto.se_secret}' == '유' && (memPower == 0 || memPower == null)){
		alert("비공개 처리 된 글입니다. \n접근 할 수 없습니다.")
		location.href="./";
	}
	
	var page = 1;
	
	listCall(num, page);
	
	function listCall(num, page) {
		$('#list').empty();
		$.ajax({
			type:'POST',
			url:'replyListCallQ',
			data:{num:num, page:page},
			datatype:'JSON',
			success:function(data){
				drawList(data.list, data.total);
			},
			error:function(e){
				alert("답변 불러오기 실패. \n페이지를 새로고침 해주세요.")
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
				if(list[i].se_secret==null){
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
		            content += 				'<input type="hidden" style="width=150px"" value="'+list[i].re_coment+'" >';			
		            content += 		"</p>";
				}
	           	if(loginId==list[i].mem_id && list[i].se_secret==null){
			        content += 		"<span>";
			        content += 			"&emsp;";
			        content+=			'<button onclick="replyModify(this)">'+'수정'+'</button>';
			        content += 			"&emsp;";
			        content+=			'<button class="reDel" onclick="replyDel('+list[i].re_num+')">'+'삭제'+'</button>';
			        content += 		"</span>";
		        }
	           	content += 		"&emsp;";
	            content += 		"<br>";
	            content += 		"<br>";      
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
	    $('#pagination').twbsPagination({
			startPage:1, //시작페이지
			totalPages:total, //총 페이지 수
			visiblePages: 5, //기본으로 보여줄 페이지 수
			onPageClick:function(e, page){ // 클릭했을 때 실행 내용
				listCall(num, page);
			}
		});
	}
	
	function secret(secretBtn){
		console.log("secret 함수 실행됨 : "+secretBtn)
		var comment = $(secretBtn).closest("label").parent().find("p.comment").find("span");
		var inputComment = $(secretBtn).closest("label").parent().find("p.comment").find("input");
		console.log($(secretBtn).attr('checked'));
		var check = $(secretBtn).attr('checked');
		if(check == 'checked'){
			console.log("켜져있었던 것")
		}else{
			console.log("안 켜져있었던 것")
		}
		
	}
	
	$("#replySubmit").click(function(){
		var reply = document.getElementById("replyW").value;
		if(reply=='null'||reply==''){
			alert('내용을 입력해 주세요');
		}else{
			$.ajax({
				type:'POST',
				url:'replyWriteQ',
				data:{reply:reply, num:num},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						document.getElementById("replyW").value="";
						listCall(num, page);
					}else{
						alert("답변 등록 실패");
					}
				},
				error:function(e){
					alert("답변 등록 실패 \n서버와 연결을 할 수 없습니다.");
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
		$(modifyBtn).next().html("취소");
		$(modifyBtn).next().attr("onclick","reCancel()")
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
				url:'replyUpdateQ',
				data:{reNumVal:reNumVal, recom:recom},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						listCall(num, page);
					}else{
						alert("답변 수정 실패");				
					}
				},
				error:function(e){
					alert("답변 수정 실패 \n서버와 연결을 할 수 없습니다.");
				}
			});
		}
	}
	
	function replyDel(re_num){
		if(confirm("삭제 하시겠습니까?")){
			$.ajax({
				type:'POST',
				url:'replyDeleteQ',
				data:{re_num:re_num},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						listCall(num, page);
					}else{
						alert("답변 삭제 실패");				
					}
				},
				error:function(e){
					alert("답변 삭제 실패 \n서버와 연결을 할 수 없습니다.");
				}
			});
		}
	}
	
	function reCancel(){ //수정 취소
		listCall(num, page);
	}
	
	/* 게시글 비공개 */
	function detailSecret(dtSecretBtn){
		var check = $(dtSecretBtn).attr('checked');
		var writer = $('#detail').find('.writer').text();
		var secret = '${Qnadto.se_secret}';
		console.log(secret);
		if(check == 'checked'){
			$(dtSecretBtn).removeAttr('checked');
			$.ajax({
				type:'POST',
				url:'detailSecretCancelQ',
				data:{num:num, writer:writer},
				datatype:'JSON',
				success:function(data){
					if(data.success>0){
						alert("비공개 취소 완료 \n페이지가 새로고침 될 때 까지 기다려 주세요.")
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
					url:'detailSecretUpdateQ',
					data:{num:num, writer:writer},
					datatype:'JSON',
					success:function(data){
						if(data.success>0){
							alert("비공개 처리 완료 \n페이지가 새로고침 될 때 까지 기다려 주세요.")
							location.reload(true);
						}else{
							alert("비공개 처리가 정상적으로 동작되지 않았습니다. \n다시 시도해 주세요.");
						}
					},
					error:function(e){
						alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
					}
				});
			}else{
				$.ajax({
					type:'POST',
					url:'detailSecretInsertQ',
					data:{num:num, writer:writer},
					datatype:'JSON',
					success:function(data){
						if(data.success>0){
							alert("비공개 처리 완료 \n페이지가 새로고침 될 때 까지 기다려 주세요.")
							location.reload(true);
						}else{
							alert("비공개 처리가 정상적으로 동작되지 않았습니다. \n다시 시도해 주세요.");
						}
					},
					error:function(e){
						alert("비공개 처리 실패 \n서버와 연결을 할 수 없습니다.");
					}
				});
			}//end else-if
		}//end else-if
	}
</script>
</html>







