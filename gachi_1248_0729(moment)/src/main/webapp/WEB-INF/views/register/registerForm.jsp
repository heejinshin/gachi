<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<head>
<head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background: #fff;
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
            width: 400px;
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

        .glass .user-box input,
        .glass .user-box select {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #ffffff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

        .glass .user-box select {
            color: #000;
        }

        .glass .user-box label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }

        .glass .user-box input:focus ~ label,
        .glass .user-box input:valid ~ label,
        .glass .user-box select:focus ~ label,
        .glass .user-box select:valid ~ label {
            top: -20px;
            left: 0;
            color: #fff;
            font-size: 12px;
        }

        .glass .submit {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: -20px;
        }

        .glass .submit input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            text-transform: uppercase;
            background: transparent;
            border: solid 2px;
            border-radius: 10px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
        }

        .glass .submit input[type="submit"]:hover {
            background-color: #fff;
            color: #FF6A00;
            transform: scale(1.1);
        }

        .user-box {
            position: relative;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .user-box input[type="text"],
        .user-box select {
            flex-grow: 1;
        }

        /* 로그인 버튼과 동일한 스타일 적용 */
        .glass a.submit {
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
            border: 2px solid #fff;
            box-sizing: border-box;
            cursor: pointer;
        }

        .glass a.submit:before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.2);
            transition: left 0.5s;
        }

        .glass a.submit:hover:before {
            left: 100%;
        }

        /* 취미 선택 버튼 스타일 */
        .hobby-button {
            margin: 5px;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #fff;
            color: #FF6A00;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .hobby-button.selected {
            background-color: #FF6A00;
            color: #fff;
        }

    </style>
</head>
<body  id="glass">
<div class="glass">
    <h2>회원가입</h2>
    <form>
        <div class="user-box">
            <input type="text" name="username">
            <label>아이디</label>
        </div>
        <div class="user-box">
            <input type="password" name="password" >
            <label>비밀번호</label>
        </div>
        <div class="user-box">
            <input type="password" name="confirm_password">
            <label>비밀번호 확인</label>
        </div>
        <div class="user-box">
            <input type="text" name="name" >
            <label>이름</label>
        </div>
        <div class="user-box">
            <input type="number" name="age">
            <label>나이</label>
        </div>
        <div class="user-box">
            <input type="tel" id="phone1" name="phone" maxlength="3">-
            <input type="tel" id="phone2" name="phone" maxlength="4">-
            <input type="tel" id="phone3" name="phone" maxlength="4">
            <label>연락처</label>
        </div>
        <div class="user-box">
            <input type="text" name="email-local">
            <label>이메일</label>
            <select name="email-domain">
                <option value="">도메인 선택</option>
                <option value="google.com">google.com</option>
                <option value="naver.com">naver.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="nate.com">nate.com</option>
                <option value="yahoo.com">yahoo.com</option>
                <option value="kakao.com">kakao.com</option>
            </select>
        </div>
<label>좋아하는 취미(3가지 선택)</label>
		<div class="user-box">
		    
		    <div class="panel-body" id="selectedHobby" >
		        <div class="form-inline" style="display: flex; flex-wrap: wrap; justify-content: center;">
		            <input type="hidden" name="hobby" id="hobby" value="" />
		            <button type="button" class="hobby-button" value="아웃도어" onclick="toggleSelection(this)">아웃도어</button>
		            <button type="button" class="hobby-button" value="스포츠" onclick="toggleSelection(this)">스포츠</button>
		            <button type="button" class="hobby-button" value="공예DIY" onclick="toggleSelection(this)">공예DIY</button>
		            <button type="button" class="hobby-button" value="자기계발" onclick="toggleSelection(this)">자기계발</button>
		            <button type="button" class="hobby-button" value="베이킹" onclick="toggleSelection(this)">베이킹</button>
		            <button type="button" class="hobby-button" value="피트니스" onclick="toggleSelection(this)">피트니스</button>
		            <button type="button" class="hobby-button" value="문화예술" onclick="toggleSelection(this)">문화예술</button>
		        </div>
		        <br><br>
		    </div>
		</div>

        <div class="user-box">
            <select name="region">
                <option value="">거주하는 지역을 선택하세요</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                <option value="강원">강원</option>
                <option value="충북">충북</option>
                <option value="충남">충남</option>
                <option value="경북">경북</option>
                <option value="경남">경남</option>
                <option value="전북">전북</option>
                <option value="전남">전남</option>
                <option value="제주">제주</option>
            </select>
        </div>
        <div class="submit">
            <a class="submit" href="#">회원가입</a>
        </div>
    </form>
</div>
<script>
    window.onload = function() {
        var phone1 = document.getElementById('phone1');
        var phone2 = document.getElementById('phone2');
        var phone3 = document.getElementById('phone3');

        phone1.addEventListener('keyup', function() {
            if (phone1.value.length >= 3) {
                phone2.focus();
            }
        });

        phone2.addEventListener('keyup', function() {
            if (phone2.value.length >= 4) {
                phone3.focus();
            }
        });
    };

    function toggleSelection(button) {
        button.classList.toggle('selected');
        var selectedHobbies = document.querySelectorAll('.hobby-button.selected');
        if (selectedHobbies.length > 3) {
            button.classList.remove('selected');
            alert('최대 3개의 취미만 선택할 수 있습니다.');
        } else {
            document.getElementById('hobby').value = Array.from(selectedHobbies).map(button => button.value).join(',');
        }
    }
</script>
</body>
</html>
