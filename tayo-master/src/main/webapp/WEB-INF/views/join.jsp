<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api -->
<style>
table {
margin : auto;
}

table, td, tr {
	height: 50px;
}

td {
	padding: 5px;
/* 	text-align: center; */
}

th{
	color : #2d467b;
}

#thbody {
	text-align: left;
}

#checkPwd, #pwr, #phonChk, #idChk1, #idChk2{
  color : red;
  font-size: 12px;
}
#outterDiv {
	border: 1px solid;
    width: 800px;
    margin: auto;
    border-color: #2d467b;
}

#mem_id, #mem_pw, #mem_pwCheck, #mem_pnum, #mem_email, #mem_add, #mem_detailAdd, #mem_name, #mem_age {
	width:400px; 
	height:30px;
}

#id_check, #findAdd{
	cursor: pointer;
	height: 34px;
	background-color: #2d467b;
	color: white;
	border-radius: 10px;
	border: 0;
	outline: 0;
}

#join{
	width: 150px; height: 50px; border: 0; outline: 0; cursor: pointer; 
	border-radius: 10px; background-color: #2d467b; color: white; font-size: 18px; margin-bottom: 20px;
}

</style>
</head>
<body>
	<div id="outterDiv">
	<h2 style="text-align: center; color:#2d467b;">회원가입</h2>
		<table>
			<tr>
				<th id="thbody">ID</th>
				<td>
					<input type="text" id="mem_id" onkeyup="idChk()" value="" placeholder="아이디를 입력해 주세요" >
					<input type="button" id="id_check" value="중복확인">
					<div id="idChk1" style="color: #B1B1B1;">영문, 숫자만 사용 가능합니다.</div>
					<div id="idChk2" style="color: #B1B1B1;">ID 중복 확인을 해 주세요</div>
				</td>
			</tr>
			<tr>
				<th id="thbody">비밀번호</th>
				<td>
					<input type="password" id="mem_pw" onkeyup="pwr()" value="" placeholder="비밀번호를 입력해 주세요">
					<div id="pwr" style="color: #B1B1B1;">6자 이상 영문, 숫자를 사용하세요</div>
				</td>
			</tr>
			<tr>
				<th id="thbody">비밀번호 확인</th>
				<td>
					<input type="password" id="mem_pwCheck" onkeyup="checkPwd()" value="" placeholder="비밀번호 확인을 입력해 주세요" ><br>
					<div id="checkPwd"></div>
				</td>
			</tr>
			<tr>
				<th id="thbody">핸드폰 번호</th>
				<td>
					<input type="text" id="mem_pnum" onkeyup="phonChk()" value="" placeholder="핸드폰 번호를 입력해 주세요">
					<div id="phonChk" style="color: #B1B1B1;">핸드폰 번호에 하이픈(`-`)을 넣어 주세요</div>
				</td>
			</tr>
			<tr>
				<th id="thbody">이메일</th>
				<td><input type="text" id="mem_email" value="" placeholder="이메일을 입력해 주세요"></td>
			</tr>
			<tr>
				<th id="thbody">주소</th>
				<td><input type="text" id="mem_add" value="" readonly placeholder="주소찾기를 해주세요">
				<input type="button" id="findAdd" onclick="addr()" style="cursor: pointer; height: 34px;" value="주소찾기">
				</td>
			</tr>
			<tr>
				<th id="thbody">상세주소</th>
				<td>
				<input type="text" id="mem_detailAdd" value="" placeholder="상세주소를 입력해 주세요">
				</td>
			</tr>
			<tr>
				<th id="thbody">이름</th>
				<td><input type="text" id="mem_name" value="" placeholder="이름을 입력해 주세요"></td>
			</tr>
			<tr>
				<th id="thbody">나이</th>
				<td><input type="text" id="mem_age" value="" placeholder="나이를 입력해 주세요"></td>
			</tr>
		</table>
		<br>
		<div style="text-align: center;">
			<button id="join">회원가입</button>
		</div>
	</div>
</body>
<script>
var idCheck = false;

//숫자 정규식
var reg = /^[0-9]+/g;
//폰 번호 정규식
var phonRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/
//아이디 정규식
var idRule = /^[a-zA-Z0-9]{5,10}$/
// 이메일 정규식
var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 비밀번호 정규식
var pwRule = /^(?=.*?[A-Za-z])(?=.*?\d)[A-Za-z\d]{6,}$/
// 이름 정규식
const nameRule = /^[가-힣]{2,}$/

$("#id_check").click(function(){
	var id = $("#mem_id").val();
	
	if(id==''){
		alert("아이디를 입력해 주세요");
		id.focus();
	}else if(id.match(idRule) == null){
		alert("아이디는 5~20자 이하 영어&숫자만 입력해 주세요");
		id.focus();
	}else{
		$.ajax({
			type:'GET',
			url:'idCheck',
			data:{'id':id},//id값 전송
			dataType:'JSON',
			success:function(data){
				if(data.idCheck){ //true
					alert('이미 사용 중인 아이디 입니다.')
					$('#mem_id').val('');
					$('#mem_id').focus();
				}else{//없는 아이디라면
					idCheck=true;
					alert('사용 가능한 아이디 입니다.')
					document.getElementById('idChk2').style.color = "green";
					document.getElementById('idChk2').innerHTML = "중복되지 않은 ID입니다."; 
					$('#mem_id').focus();
				}
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
});

//아이디 실시간 검증
function idChk(){
	var id = document.getElementById('mem_id').value;
	
	if(id.match(idRule) == null){
		document.getElementById('idChk1').style.color = 'red';
		document.getElementById('idChk1').innerHTML = "! 영문, 숫자만 사용 가능합니다."+"&nbsp"+"예) abc123";
	}else{
		document.getElementById('idChk1').style.color = "green";
		document.getElementById('idChk1').innerHTML = "아이디 조건에 충족하였습니다."; 
	}
	if(idCheck==false){
		document.getElementById('idChk2').style.color = 'red';
		document.getElementById('idChk2').innerHTML = "! ID 중복 확인을 해 주세요";
	}
}

//비밀번호 실시간 검증
function pwr(){
	var pw = document.getElementById('mem_pw').value;
	
	if(pw.match(pwRule) == null){
		document.getElementById('pwr').style.color = 'red';
		document.getElementById('pwr').innerHTML = "! 6자 이상 영문, 숫자를 사용하세요"+"<br>"+"예)abc123";
	}else{
		document.getElementById('pwr').style.color = "green";
		document.getElementById('pwr').innerHTML = "비밀번호 조건에 충족하였습니다."; 
	}
}

//비밀번호 확인 실시간 검증
function checkPwd(){
	var pw = document.getElementById('mem_pw').value;
	var pwChk = document.getElementById('mem_pwCheck').value;
	
	if(pw!=pwChk){
		document.getElementById('checkPwd').style.color = 'red';
		document.getElementById('checkPwd').innerHTML = "! 동일한 암호를 입력하세요.";
	}else{
		document.getElementById('checkPwd').style.color = "green";
		document.getElementById('checkPwd').innerHTML = "암호가 일치합니다."; 
	}
}

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

//아이디 유효성 검사
$("#join").click(function(){
	
	$id = $("#mem_id");
	
	if(idCheck == true){ //아이디가 중복이 아닌 경우
		
		$pw = $("#mem_pw");
		$pwChk = $("#mem_pwCheck");
		$pnum = $("#mem_pnum");
		$email = $("#mem_email");
		$add = $("#mem_add");
		$detailAdd = $("#mem_detailAdd");
		$name = $("#mem_name");
		$age = $("#mem_age");
		
		if($id.val()==''){
			alert("아이디를 입력해 주세요");
			$id.focus();
		}else if($id.val().match(idRule) == null){
			alert("아이디는 5~20자 이하 영어&숫자만 입력해 주세요");
			$id.focus();
		}else if($pw.val()==''){
			alert("비밀번호를 입력해 주세요");
			$pw.focus();
		}else if($pw.val().match(pwRule) == null){
			alert("비밀번호를 조건에 맞게 입력해 주세요");
			$pw.focus();
		}else if($pwChk.val()==''){
			alert("비밀번호 확인을 입력해 주세요");
			$pwChk.focus();
		}else if($pw.val()!=$pwChk.val()){ // 비밀번호 확인
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("mem_pwCheck").value ='';
			$pwChk.focus();
		}else if($pnum.val()==''){
			alert("핸드폰 번호를 입력해 주세요");
			$pnum.focus();
		}else if($pnum.val().match(phonRule) == null){
			alert("핸드폰 번호에 하이픈(`-`을 넣어주세요\n ex) 010-0000-0000");
			$pnum.focus();
		}else if($pnum.val()=='010-0000-0000'){
			alert("핸드폰 번호를 제대로 입력해 주세요!!");
			document.getElementById("mem_pnum").value ='';
			$pnum.focus();
		}else if($email.val()==''){
			alert("email을 입력해 주세요");
			$email.focus();
		}else if($email.val().match(emailRule) == null){
			alert("email형식을 확인해 주세요");
			$email.focus();
		}else if($add.val()==''){
			alert("주소를 입력해 주세요");
			$add.focus();
		}else if($detailAdd.val()==''){
			alert("상세주소를 입력해 주세요");
			$detailAdd.focus();
		}else if($name.val()==''){
			alert("이름을 입력해 주세요");
			$name.focus();
		}else if($name.val().match(nameRule) == null){
			alert("이름은 한글로 2자 이상 입력해 주세요");
			$name.focus();
		}else if($age.val()==''){
			alert("나이를 입력해 주세요");
			$age.focus();
		}else if($age.val().match(reg) == null){
			alert("나이는 숫자만 입력해 주세요");
			$age.focus();
		}else{
			var param ={}; // json으로 전달하기 위한 object
			param.id = $id.val();
			param.pw = $pw.val();
			param.pnum = $pnum.val();
			param.email = $email.val();
			param.add = $add.val();
			param.detailAdd = $detailAdd.val();
			param.name = $name.val();
			param.age = $age.val();
			
			$.ajax({
				type:'POST',
				url:'Join',
				data:param,
				success:function(data){
					console.log(data);
					if(data.success>0){
						alert("회원 가입에 성공했습니다.");
						location.href="./";
					}else{
						alert("회원 가입에 실패했습니다.");					
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	}else{
		alert('중복 아이디 체크를 진행해 주세요!');
		$id.focus();
	}
});

function addr() {
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