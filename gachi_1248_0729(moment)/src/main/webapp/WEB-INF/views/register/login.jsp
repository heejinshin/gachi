<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function logChk(){
		//아이디 존재유무
		if(document.getElementById("userid").value==""){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(document.getElementById("userpwd").value==""){
			alert("비밀번호를 입력하세요");
			return false;	
		}
		return true;
	}
</script>
    <style>
    body {
        margin:0;
        padding:0;
        font-family: sans-serif;
        background: white;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }

    .glass {
        background: #FF6A00;
        position: absolute;
        top: 50%;
        left: 50%;
        width: 500px;
        padding: 40px;
        transform: translate(-50%, -50%);
        background-position: center;
        background-size: cover;
        box-sizing: border-box;
        box-shadow: 0 20px 25px rgba(0,0,0,.6);
        border-radius: 10px;
    }

    .glass h2 {
        margin: 0 0 30px;
        padding: 0;
        color: #fff;
        text-align: center;
    }

    .glass .user-box {
        position: relative;
    }

    .glass .user-box input {
        width: 100%;
        padding: 10px 0;
        font-size: 16px;
        color: #fff;
        margin-bottom: 30px;
        border: none;
        border-bottom: 1px solid #fff;
        outline: none;
        background: transparent;
    }

    .glass .user-box label {
        position: absolute;
        top:0;
        left: 0;
        padding: 10px 0;
        font-size: 20px;
        color: #fff;
        pointer-events: none;
        transition: .5s;
    }

    .glass .user-box input:focus ~ label,
    .glass .user-box input:valid ~ label {
        top: -20px;
        left: 0;
        color: #fff;
        font-size: 12px;
    }

    .glass a {
        position: relative;
        display: inline-block;
        padding: 10px 20px;
        color: #fff;
        font-size: 16px;
        text-decoration: none;
        text-transform: uppercase;
        overflow: hidden;
        transition: .5s;
        margin-top: 40px;
        letter-spacing: 4px;
        border-radius: 5px;
    }

    .glass a:hover {
        color: #fff;
    }

    .glass a span {
        position: absolute;
        display: block;
    }

    .link-group {
        text-align: center;
        padding-top: 20px;
        display: flex;
        justify-content: space-between;
    }
    .link-group a {
        flex: 1;
        text-align: center;
        margin: 0 -15px;
        font-size: 10px; 
    }
    #submit-button {
        margin-top: auto;
        font-size: 25px;
        text-align: center;
        display: flex;
        align-content: center;
        justify-content: center;
    }


    



    .btn-1 {
        
  background-image: linear-gradient(to right, #f6d365 0%, #fda085 51%, #f6d365 100%);
}

    .glass input[type="submit"] {
        position: relative;
        display: inline-block;
        padding: 10px 20px;
        color: #fff;
        font-size: 16px;
        text-decoration: none;
        text-transform: uppercase;
        overflow: hidden;
        transition: .5s;
        margin-top: 40px;
        letter-spacing: 4px;
        border-radius: 5px;
        border: 2px solid #fff; /* Submit 버튼에 테두리 추가 */
        box-sizing: border-box; /* 테두리 너비를 요소의 총 너비와 높이에 포함시킴 */
        background: transparent; /* 배경을 투명하게 설정 */
        cursor: pointer;
    }

    /* 호버 시의 CSS 규칙을 추가합니다. */
    .glass input[type="submit"]:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }

    .glass input[type="submit"] {
    position: relative;
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    font-size: 16px;
    text-decoration: none;
    text-transform: uppercase;
    overflow: hidden;
    transition: .5s;
    margin-top: 40px;
    letter-spacing: 4px;
    border-radius: 5px;
    border: 2px solid #fff; /* Submit 버튼에 테두리 추가 */
    box-sizing: border-box; /* 테두리 너비를 요소의 총 너비와 높이에 포함시킴 */
    cursor: pointer;
    background: linear-gradient(to right, #f6d365 0%, #fda085 51%, #f6d365 100%);
    background-size: 200% auto;
    background-position: left center;
}


    .glass input[type="submit"]:hover {
        background-position: right center; /* change the direction of the change here */
    }
    .btn {
        
  flex: 1 1 auto;
  margin: 10px;
  padding: 30px;
  text-align: center;
  text-transform: uppercase;
  transition: 0.5s;
  background-size: 200% auto;
  color: white;
 /* text-shadow: 0px 0px 10px rgba(0,0,0,0.2);*/
  box-shadow: 0 0 20px #eee;
  border-radius: 10px;
 }

/* Demo Stuff End -> */

/* <- Magic Stuff Start */

.btn:hover {
  background-position: right center; /* change the direction of the change here */
}
#glass{
    height: 100%;
    width: 100%;
}
    </style>
<main>
<%@ include file="../navibar.jspf" %>
	<form method="post" action="/home/register/loginOk" onsubmit="return logChk()">
	<div class="glass">
		<h2>Login</h2>
			<div class="user-box">
				<input type="text" name="userId" id="userId" />
				<label>아이디 입력</label>
			</div>
			<div class="user-box">
			<input type="password" name="userPwd" id="userPwd" />
				<label>비밀번호 입력</label>
			</div>
			<div class="user-box">
				<input type="submit" value="로그인" id="submit-button" class="btn btn-1">
			</div>
				<!-- 이름과 연락처를 입력받아 DB에서 아이디, 이메일을 조회 후 아이디를 이메일로 보낸다. -->
				<div class="link-group">
				<a href="/home/register/idSearch">아이디찾기</a>
				<a href="#">비밀번호찾기</a>
				<a href="/home/register/regForm">회원가입</a>
				</div>		
		</div>		
	</form>

</main>
