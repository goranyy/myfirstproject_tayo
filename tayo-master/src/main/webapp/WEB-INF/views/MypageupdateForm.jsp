<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  var _$ = jQuery.noConflict();
</script>
<style>
.apa{

   position:absolute;
   text-align:center;
   border: 1px solid black;
   height: 670px;
   width:600px;
   left:25%;
   padding: 20px;
}
table {

    margin-left:auto; 
    margin-right:auto;
    border: 1px solid #444444;
    border-color : balck;
}

td{
   padding:5px;
}
#mem_id,#mem_name,#mem_age{
   background-color:gray;
}


</style>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div>
   <p>마이페이지 수정하기</p>
</div>
<div class="apa">
   <p>회원정보</p>
   <form action="MypageUpdateForm" method="post">
   <table>
   <tr>
      <th> </th>
      <th> </th>
   </tr>
   
   <tr>
      <td>
         ID 
      </td>
      <td>
         <input type="text" id="mem_id" name="mem_id" value="${info.mem_id}" readonly/>
            </td>
   </tr>
   
   <tr>
      <td>
         비밀번호
      </td>
      <td>
         <input type="text"  name="mem_pw" value="${info.mem_pw }" readonly/> <button type="submit" formmethod="POST" onclick="location.href='./changePw'">비밀번호 변경</button>
      </td>
   </tr>
      

   <tr>      
      <td>
          email 
      </td>
      <td>
         <input type="text" name="mem_email" style="width:300px; height:20px;" value="${info.mem_email }" placeholder="이메일을 입력해 주세요"/>
      </td>
   </tr>
   
   <tr>      
      <td>
          핸드폰 번호 
      </td>
      <td>
         <input type="text" name="mem_pnum" onkeyup="phonChk()" style="width:300px; height:20px;" value="${info.mem_pnum }" placeholder="핸드폰 번호를 입력해 주세요">
         <div id="phonChk" style="color: gray;">핸드폰 번호에 하이픈(`-`)을 넣어 주세요</div>
      </td>
   </tr>   
   
   <tr>
      <td>
         주소 
      </td>
      <td>
         <input type="text"   id="mem_add"   name="mem_add" value="${info.mem_add }"/>
         <button  type="button"  id="findAdd"    onclick="addr()" style="cursor: pointer;" value="주소찾기">주소찾기</button>
      </td>
   </tr>
   
   <tr>
      <td>
         상세주소
      </td>
      <td>
         <input type="text"  id="mem_detailAdd" name="mem_detailAdd" value="${info.mem_detailAdd }"/>
      </td>
   </tr>
   
   <tr>
      <td>
         이름
      </td>
      <td>
         <input type="text" id="mem_name" name="mem_name" value="${info.mem_name }"  readonly/>
      </td>
   </tr>
   
   <tr>
      <td>
         나이
      </td>
      <td>
         <input type="text" id="mem_age" name="mem_age" value="${info.mem_age }"  readonly/>
      </td>
   </tr>
   
   <tr>
      <td>
         결혼유무
      </td>
      <td>
      <c:set var="name" value="기혼"/>
      <c:choose>
      <c:when test="${info.mem_mar eq null}">
       <input type="radio" id="marry" name="marry" value="기혼" />기혼
       <input type="radio" id="marry" name="marry" value="미혼"/>미혼       
      </c:when>
      <c:when test="${name eq info.mem_mar}" >
       <input type="radio" id="marry"  name="marry" value="기혼" checked />기혼
       <input type="radio" id="marry"  name="marry" value="미혼"/>미혼 
      </c:when>
      <c:otherwise>
      <input type="radio" id="marry" name="marry" value="기혼" />기혼
       <input type="radio" id="marry" name="marry" value="미혼" checked/>미혼 
      </c:otherwise>   
      </c:choose>   
      </td>   
   </tr>
   
   <tr>
      <td>
         자녀유무
      </td>
      <td>
      <c:set var="name" value="유"/>
      <c:choose>
      <c:when test="${info.mem_child eq null}">
       <input type="radio" id="children" name="children" value="유" />유
       <input type="radio" id="children" name="children" value="무" />무      
      </c:when>      
      <c:when test="${name eq info.mem_child}" >
       <input type="radio" id="children" name="children" value="유" checked />유
       <input type="radio" id="children" name="children" value="무" />무       
      </c:when>
      <c:otherwise>
       <input type="radio" id="children" name="children" value="유" />유
       <input type="radio" id="children" name="children" value="무"checked />무         
      </c:otherwise>
      </c:choose>
      </td>
   </tr>
   
   <tr>
      <td>
         가족 구성원 수 
      </td>
      <td>
         <input type="text" name="mem_fam"  value="${info.mem_fam }" />
      </td>
   </tr>
   
   <tr>
      <td>
         mbti 
      </td>
      <td>
         <input type="text" name="mem_mbti"  value="${info.mem_mbti }" />
      </td>
   </tr>
   
   <tr>
         <th colspan="2"><button type="submit">수정하기</button>
   </tr>      
   
</table>
</form>
      <button onclick="location.href='./mypage'">취소</button>
</div>


</body>
<script>
//숫자 정규식
var reg = /^[0-9]+/g;
//폰 번호 정규식
var phonRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/
// 이메일 정규식
var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;



//폰 번호 실시간 검증
function phonChk(){
   var pnum = document.getElementById('mem_pnum').value;
   
   if(pnum.match(phonRule) == null || pnum =='010-0000-0000'){
      document.getElementById('phonChk').style.color = 'red';
      document.getElementById('phonChk').innerHTML = "! 핸드폰 번호에 하이픈(`-`)을 넣어 주세요"+"<br>"+"예)010-0000-0000";
   }else{
      document.getElementById('phonChk').style.color = "green";
      document.getElementById('phonChk').innerHTML = "핸드폰 번호를 정상적으로 입력하셨습니다."; 
   }
}

function addr() {
   console.log('동작');
    new daum.Postcode({
        oncomplete: function(data) {
           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R' || data.userSelectedType === 'J') { // 사용자가 주소를 선택했을 경우
                addr = data.roadAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } 
            
            var zoneCode = '(' + data.zonecode + ') ';
            
            addr = zoneCode + addr + extraAddr;
            document.getElementById("mem_add").value = addr;
            document.getElementById("mem_detailAdd").focus();
        }
    }).open();

}



</script>
</html>