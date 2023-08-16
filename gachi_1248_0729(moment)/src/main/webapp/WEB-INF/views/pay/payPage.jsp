<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
@import url('https://fonts.googleapis.com/css?family=Roboto:300&display=swap');

* {
	box-sizing: border-box;
}

body {
	background-color: #fafafa;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	font-family: 'Roboto', sans-serif;
	margin-bottom: 60px;
}

h1 {
	letter-spacing: 1px;
}

.pricing-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.pricing {
    justify-content: center;
    align-items: center;
    background-color: #fff;
    border: 1px solid #eee;
    margin: 10px;
    text-align: center;
    width: 300px;  /* 박스의 너비를 조정하세요 */
    height: 400px; /* 박스의 높이를 조정하세요 */
}

.pricing.highlight {
	border-top: 2px solid #FF6A00;
	box-shadow: 0 0 30px 10px rgba(0, 0, 0, 0.1);
}

.pricing h1 {
	color: #FF6A00;
	margin: 30px 0 0;
}

.pricing h4 {
	margin: 20px 0 0;
}

.pricing small.green {
	color: #FF6A00;
	margin: 0;
}

.pricing small.green + h1 {
	margin-top: 10px;
}

.pricing small {
	color: #777;
}

.pricing ul {
	list-style-type: none;
	padding: 0;
	margin: 40px 0;
}

.pricing ul li {
	margin: 20px 30px;
	max-width: 250px;
}

.pricing button {
	background-color: #FF6A00;
	border: 0;
	border-radius: 2px;
	color: #fff;
	padding: 12px 20px;
	margin-bottom: 30px;
}


/* SOCIAL PANEL CSS */
.social-panel-container {
	position: fixed;
	right: 0;
	bottom: 80px;
	transform: translateX(100%);
	transition: transform 0.4s ease-in-out;
}

.social-panel-container.visible {
	transform: translateX(-10px);
}

.social-panel {	
	background-color: #fff;
	border-radius: 16px;
	box-shadow: 0 16px 31px -17px rgba(0,31,97,0.6);
	border: 5px solid #FF6A00;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-family: 'Muli';
	position: relative;
	height: 169px;	
	width: 370px;
	max-width: calc(100% - 10px);
}

.social-panel button.close-btn {
	border: 0;
	color: #97A5CE;
	cursor: pointer;
	font-size: 20px;
	position: absolute;
	top: 5px;
	right: 5px;
}

.social-panel button.close-btn:focus {
	outline: none;
}

.social-panel p {
	background-color: #FF6A00;
	border-radius: 0 0 10px 10px;
	color: #fff;
	font-size: 14px;
	line-height: 18px;
	padding: 2px 17px 6px;
	position: absolute;
	top: 0;
	left: 50%;
	margin: 0;
	transform: translateX(-50%);
	text-align: center;
	width: 235px;
}

.social-panel p i {
	margin: 0 5px;
}

.social-panel p a {
	color: #FF7500;
	text-decoration: none;
}

.social-panel h4 {
	margin: 20px 0;
	color: #97A5CE;	
	font-family: 'Muli';	
	font-size: 14px;	
	line-height: 18px;
	text-transform: uppercase;
}

.social-panel ul {
	display: flex;
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.social-panel ul li {
	margin: 0 10px;
}

.social-panel ul li a {
	border: 1px solid #DCE1F2;
	border-radius: 50%;
	color: #FF6A00;
	font-size: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50px;
	width: 50px;
	text-decoration: none;
}

.social-panel ul li a:hover {
	border-color: #FF6A00;
	box-shadow: 0 9px 12px -9px #FF6A00;
}

.floating-btn {
	border-radius: 26.5px;
	background-color: #FF6A00;
	border: 1px solid #FF6A00;
	box-shadow: 0 16px 22px -17px #FF6A00;
	color: #fff;
	cursor: pointer;
	font-size: 16px;
	line-height: 20px;
	padding: 12px 20px;
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 999;
}

.floating-btn:hover {
	background-color: #ffffff;
	color: #FF6A00;
}

.floating-btn:focus {
	outline: none;
}

.floating-text {
	background-color: #FF6A00;
	border-radius: 10px 10px 0 0;
	color: #fff;
	font-family: 'Muli';
	padding: 7px 15px;
	position: fixed;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	text-align: center;
	z-index: 998;
}

.floating-text a {
	color: #FF7500;
	text-decoration: none;
}

@media screen and (max-width: 480px) {

	.social-panel-container.visible {
		transform: translateX(0px);
	}
	
	.floating-btn {
		right: 10px;
	}
}
        .pricing button {
            background-color: #FF6A00;
            border: none;
            border-radius: 2px;
            color: #fff;
            padding: 12px 20px;
            margin-bottom: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .pricing button:hover {
            background-color: #F0A067; /* Change color on hover */
        }

        /* Hover effect for floating button */
        .floating-btn:hover {
            background-color: #FF7500;
            color: #fff;
        }

        /* Hover effect for social panel icons */
        .social-panel ul li a:hover {
            border-color: #FF7500;
            box-shadow: 0 9px 12px -9px #FF7500;
        }
    </style> 
<body>
       <h1>모임개설권 결제 페이지</h1>
    <div class="pricing-container">
        <div class="pricing">
            <h4>1개월 모임개설권</h4>
            <h1>3만원</h1>
            <small>정기 결제</small>
            <ul>
                <li>프리미엄 월 정기구독(30일)</li>
            </ul>
            <button onclick="requestPay()">1개월 결제하기</button>
        </div>
        <div class="pricing highlight">
            <h4>3개월 모임개설권</h4>
            <small class="green">Most Popular</small>
            <h1>6만원</h1>
            <small>per month</small>
            <ul>
                <li>프리미엄 월 정기구독(90일)</li>
            </ul>
            <button onclick="requestPay()">3개월 결제하기</button>
        </div>
        <div class="pricing">
            <h4>6개월 모임개설권</h4>
            <h1>9만원</h1>
            <small>per month</small>
            <ul>
                <li>프리미엄 월 정기구독(180일)</li>
            </ul>
            <button onclick="requestPay()">6개월 결제하기</button>
        </div>
        <div class="pricing">
            <h4>12개월 모임개설권</h4>
            <h1>12만원</h1>
            <small>per month</small>
            <ul>
                <li>프리미엄 월 정기구독(365일)</li>
            </ul>
            <button onclick="requestPay()">12개월 결제하기</button>
        </div>
    </div>
    
    <!-- SOCIAL PANEL HTML -->
    <div class="social-panel-container">
        <div class="social-panel">
            <p>Created with <i class="fa fa-heart"></i> by
                <a target="_blank" href="https://florin-pop.com">Florin Pop</a></p>
            <button class="close-btn"><i class="fas fa-times"></i></button>
            <h4>Get in touch on</h4>
            <ul>
                <li>
                    <a href="https://www.patreon.com/florinpop17" target="_blank">
                        <i class="fab fa-discord"></i>
                    </a>
                </li>
                <li>
                    <a href="https://twitter.com/florinpop1705" target="_blank">
                        <i class="fab fa-twitter"></i>
                    </a>
                </li>
                <li>
                    <a href="https://linkedin.com/in/florinpop17" target="_blank">
                        <i class="fab fa-linkedin"></i>
                    </a>
                </li>
                <li>
                    <a href="https://facebook.com/florinpop17" target="_blank">
                        <i class="fab fa-facebook"></i>
                    </a>
                </li>
                <li>
                    <a href="https://instagram.com/florinpop17" target="_blank">
                        <i class="fab fa-instagram"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
   <script>
      var IMP = window.IMP;
      IMP.init("imp15846883"); // 예: imp00000000
      
       function requestPay() {
         // IMP.request_pay(param, callback) 결제창 호출
         IMP.request_pay({ // param
             pg: "html5_inicis",
             pay_method: "card",
             merchant_uid: 'merchant_' + new Date().getTime(),
             name: "모임 개설 1개월권",
             amount: 100,
             buyer_email: "gildong@gmail.com",
             buyer_name: "원도훈",
             buyer_tel: "010-4242-4242",
             buyer_addr: "서울특별시 강남구 신사동",
             buyer_postcode: "01181"
         }, function (rsp) { // callback
             if (rsp.success) {
                 // 결제 성공 시 로직
                 alert("결제 성공!");
             } else {
                 // 결제 실패 시 로직
                alert("결제 실패!" + rsp.error_msg);
             }
         });
       }
     </script>
         <script>
        const floating_btn = document.querySelector('.floating-btn');
        const close_btn = document.querySelector('.close-btn');
        const social_panel_container = document.querySelector('.social-panel-container');

        floating_btn.addEventListener('click', () => {
            social_panel_container.classList.toggle('visible')
        });

        close_btn.addEventListener('click', () => {
            social_panel_container.classList.remove('visible')
        });
    </script>
</body>
</html>