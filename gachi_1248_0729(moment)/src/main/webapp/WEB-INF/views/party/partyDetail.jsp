<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
    <title>모임 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 800px;
            margin: 0 auto;
        }
        .header {
            position: relative;
        }
        .header img {
            width: 100%;
            height: auto;
        }
        .header-text {
            position: absolute;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            width: 97.5%;
            padding: 10px;
            text-align: center;
        }
        .details {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .footer {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .join-btn {
            display: block;
            width: 100%;
            padding: 15px;
            margin-top: 20px;
            text-align: center;
            background-color: #FF8800A0; /* Blue */
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }
        .join-btn:hover {
            background-color: #ff6f00a0; /* Darker blue */
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="/img/soccer.jpg" alt="" />
            <div class="header-text">
                <h1>${dto.partyName}</h1>
            </div>
        </div>
        <div class="details">
            <h2>모임 상세 정보</h2>
            <p>${dto.partyName}</p>
        </div>
        <div class="footer">
            <h3>안내사항</h3>
            <p>${dto.partyContent}</p>
            <h3>map</h3>
            <p>${dto.partyPlace}</p>
			<h3>모집 날짜 시작</h3>
            <p>${dto.recruitStart}</p>
            <form  method="post" action="<%=request.getContextPath()%>/Party/PartyParticipationOk?partyNo=${dto.partyNo}">
	            <div class="submit">
		            <input type="submit" value="참여하기">
		            <!-- 
		            <button class="join-btn">참여하기</button>
		             -->
					<a href="${pageContext.request.contextPath}/challenge.jsp">챌린지 상세페이지</a>
				</div>
			</form>
			<c:if test="${1 == 1 }">
				<div>
					<a href="<%=request.getContextPath()%>/Party/PartyEdit?partyNo=${dto.partyNo }">수정</a>
					<a href= "javascript: dataDel()">삭제</a>
				</div>
			</c:if>
        </div>
    </div>
</body>
</html>