<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            position: relative;
        }

        .header {
            width: 100%;
            height: 400px;
            opacity: .8;
            background-color: rgb(30, 173, 255);
            background-image: url('../img/챌린지모임.png');
            background-size: contain; /* Change background-size to 'contain' */
            background-repeat: no-repeat;
            background-position: center center; /* Center the image both horizontally and vertically */
        }

        .container {
            width: 100%;
        }

        .container h1 {
            font-size: 50px
        }

        .about {
            padding: 5% 0;
            width: 100%;
            height: auto;
            background-color: #fff;
        }

        .about .left {
            padding: 2% 0;
            float: left;
            width: 50%;
            display: inline-block;
        }

        .about .right {
            width: 50%;
            display: inline-block;
        }

        .about .right img {
            width: 100%
        }

        .about .left h1 {
            text-align: center;
            color: #1EADFF;
            margin: 0 0 10px 0;
        }

        .about .left hr {
            width: 20%;
            border-top: 2px solid #000;
            border-bottom: none;
        }

        .about .left p {
            font-size: 1.4rem;
            margin: 40px auto;
            width: 80%
        }

        .mission {
            padding: 5% 0;
            width: 100%;
            height: auto;
            background-color: #fff;
        }

        .mission .right {
            padding: 2% 0;
            width: 50%;

            display: inline-block;
        }

        .mission .left {
            float: left;
            width: 50%;

            display: inline-block;
        }

        .mission .left img {
            width: 100%;
        }

        .mission .right h1 {
            text-align: center;
            color: #1EADFF;
            margin: 0 0 20px 0;
        }

        .mission .right hr {
            width: 35%;
            border-top: 2px solid #000;
            border-bottom: none;
        }

        .mission .right p {
            font-size: 1.4rem;
            margin: 40px auto;
            width: 80%
        }

        .team {
            width: 90%;
            margin: auto;
            padding: 5% 5%;
            overflow: hidden;
        }

        .team h1 {
            text-align: center;
            color: #1EADFF;
        }

        .team h1 hr {
            width: 15%;
            border-top: 2px solid #000;
            background-color: transparent;
            border-bottom: none;
            margin-bottom: 50px;
        }

        .team .card {
            padding-bottom: 20px;
            padding-top: 20px;
            position: relative;
            min-width: 20%;
            height: auto;
            background-color: #fff;
            display: inline-block;
            margin: 40px 6.5%;
            box-shadow: 0 0 20px 2px rgba(0, 0, 0, 0.5);
            text-align: center;
            font-size: 25px;
        }

        .circle-container {
            position: relative;
            background-color: #579f79;
            width: 250px;
            height: 250px;
            border: none;
            border-radius: 50%;
            margin: auto;
            overflow: hidden; /* Add overflow hidden to crop images */
        }

        .circle-container img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            height: 100%;
            object-fit: cover; /* Set the image to cover the container */
        }

        .team .card h2 {
            text-align: center;
            margin: 30px 0 0 0;
        }

        .team .card h4 {
            text-align: center;
            margin: 10px 0 0 0;
        }

        .team .card p {
            width: 250px;
            margin: 30px auto;
            text-align: center;

        }

        .clear {
            clear: both;
        }

        footer {
            width: 100%;
            height: 100px;
            background-color: #28587c;
        }

        footer p {
            text-align: center;
            padding: 0 2%;
        }

        /* media */
        @media (max-width: 1200px) {
            .mission .right p {
                font-size: .8rem;
                margin: 20px auto;
            }

            .about .left p {
                font-size: .8rem;
                margin: 20px auto;
            }
        }

        @media (max-width: 992px) {
            .about .left {
                width: 100%;
            }

            .about .right {
                width: 100%;
            }

            .mission .left {
                width: 100%;
            }

            .mission .right {
                width: 100%;
            }

            .team .card {
                width: 40%;
            }
        }

        @media (max-width: 768px) {
            .team .card {
                width: 100%;
            }

            nav {
                height: 80px;
            }
        }
    </style>
</head>
<body>
    <div class="header"></div>
    <div class="container">
        <div class="about">
            <div class="left">
                <h1>우리 가치(價値),함께는</h1>
                <hr>
                <p>현대 사회에서 우리는 이전과는 다른 각박한 생활 속에 녹아들고 있습니다. 이제는 이웃과의 소통이 줄어들고, 혼자만의 삶 속에서 흥미 없는 일상이 누적되어 가고 있습니다. 이러한 상황에서 '취미'라는 단어는 자그마하지만 강력한 동기부여를 제공합니다.취미를 통해 우리는 자아를 발견하고, 이웃과의 소통을 즐기며, 현대 사회에서도 살아가는 즐거움을 찾아갈 수 있습니다. </p>
                <p>'가치 함께’를 통해 새로운 사람들과 함께 즐기며, 취미 생활에 있어 소중한 경험을 얻을 수 있습니다. 우리의 목표는 사람들이 자신의 가치를 발견하고 행복한 일상을 만들어가는데 기여하는 것입니다. '가치 함께'와 함께라면 개개인의 삶에 보다 의미있는 즐거움을 찾아갈 수 있을 것입니다.</p>
                <p>취미는 단순히 혼자만의 즐거움에 그치지 않습니다. '가치 함께'라는 경험의 가치를 통해 보다 풍요로운 일상을 만들어나가시길 누구보다 응원합니다.</p>
            </div>
            <div class="right">
                <img src="../img/소모임.jpg">
            </div>
            <div class="clear"></div>
        </div>
        <div class="mission">
            <div class="left">
                <img src="../img/모임1.png">
            </div>
            <div class="right">
                <h1>Mission Statement</h1>
                <hr>
                <p>현대 사회에서 우리는 이전과는 다른 각박한 생활 속에 녹아들고 있습니다. 이제는 이웃과의 소통이 줄어들고, 혼자만의 삶 속에서 흥미 없는 일상이 누적되어 가고 있습니다. 이러한 상황에서 '취미'라는 단어는 자그마하지만 강력한 동기부여를 제공합니다.취미를 통해 우리는 자아를 발견하고, 이웃과의 소통을 즐기며, 현대 사회에서 즐거움을 찾아갈 수 있습니다. 우리의 일상 속에서 취미는 더 나은 삶을 위한 탈출구가 되어 줍니다. 우리가 즐겁게 할 수 있는 소소한 취미들은 생활의 지루함을 달래주며, 스트레스를 해소하고 긍정적인 기분을 선사합니다. 취미는 우리가 진정한 자아를 발견하고 개발하는데도 도움을 줍니다.</p>
                <p> 우리 서비스 ‘가치 함께’는 취미의 중요성을 이해하는 동시에, 당신이 진정한 취미를 발견하고 새로운 시도를 통해 보다 만족스러운 삶으로 나아갈 수 있도록 도와줄 것입니다. 우리의 목표는 당신의 삶에 가치를 발견하고, 사회적 연결과 소통을 도모하여 소중한 경험을 제공하는데에 있습니다. '가치 함께'와 함께라면 당신의 삶에 보다 의미있는 즐거움을 찾아갈 수 있을 것입니다. </p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="team">
            <h1> Our Team</h1>
            <div class="card">
                <div class="circle-container">
                    <img src="../img/김지현.jpg">
                </div>
                <h2>김지현</h2>
                <h4>DB 설계 API 연동</h4>
                <p>전체 총괄, DB설계 <br>카카오맵,결제api<br> 백엔드 담당</p>
            </div>
            <div class="card">
                <div class="circle-container">
                    <img src="../img/신희진.jpg">
                </div>
                <h2>신희진</h2>
                <h4>DB 설계 기획 중심</h4>
                <p>DB 설계 및 아이디어 <br> 기획서 작성 총괄<br>발표</p>
            </div>
            <div class="card">
                <div class="circle-container">
                    <img src="../img/이호준.jpg">
                </div>
                <h2>이호준</h2>
                <h4>백엔드</h4>
                <p>게시판, 로그인 <br> 회원가입 외 전체적인 <br> 백엔드 구현 담당</p>
            </div>
            <div class="card">
                <div class="circle-container">
                    <img src="../img/원도훈.jpg">
                </div>
                <h2>원도훈</h2>
                <h4>프론트엔드</h4>
                <p>전체 프론트엔드 리드 <br> UI/UX 설계 <br>구현 백엔드 보조 </p>
            </div>
            <div class="card">
                <div class="circle-container">
                    <img src="../img/윤지은2.jpg">
                </div>
                <h2>윤지은</h2>
                <h4>프론트엔드 데이터크롤링</h4>
                <p>챌린지페이지<br>회원가입, 모임게시판 <br> 데이터 크롤링</p>
            </div>
            <div class="card">
                <div class="circle-container">
                    <img src="../img/장호찬.jpg">
                </div>
                <h2>장호찬</h2>
                <h4>팀장</h4>
                <p>모임 페이지 <br>ajax<br> 백엔드 구현</p>
            </div>
        </div>
    </div>
</body>
</html>