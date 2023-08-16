<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #F4F4F4;
    }

    .container {
        width: 800px;
        margin: 0 auto;
        padding: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .board-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .board-list li {
        display: flex;
        align-items: center;
        padding: 15px;
        background-color: #FFF;
        border-radius: 10px;
        margin-bottom: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s ease;
    }

    .board-list li:hover {
        background-color: #F9F9F9;
    }

    .board-list li:first-child {
        background-color: #F4F4F4;
        font-weight: bold;
    }

    .board-list li span {
        flex: 1;
    }

    .board-list li a {
        color: #333;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .board-list li a:hover {
        color: #FFD700;
    }

    .page {
        text-align: center;
        margin-top: 20px;
    }

    .page ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: inline-block;
    }

    .page ul li {
        display: inline-block;
        margin-right: 5px;
    }

    .page ul li a {
        display: inline-block;
        padding: 5px 10px;
        background-color: #F47703;
        color: #FFF;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .page ul li a:hover {
        background-color: #F47703;
    }

    .search {
        justify-content: center;
        display: flex;
        align-items: center;
        margin-top: 20px;
    }

    .search form {
        display: flex;
        align-items: center;
    }

    .search select,
    .search input[type="text"],
    .search input[type="submit"] {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .search select {
        margin-right: 5px;
    }

    .search input[type="submit"] {
        background-color: #F47703;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    .search input[type="submit"]:hover {
        background-color: #FFD700;
    }
    .board-list {
        margin: 0;
        padding: 0;
    }

    .board-list li {
        display: flex;
        align-items: center;
        padding: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s ease;
        background-color: #fff;
    }

    .board-list li:hover {
        background-color: #f4f4f4;
    }

    .board-list li:first-child {
        background-color: #f47703;
        font-weight: bold;
        color: #fff;
    }

    .board-list li span {
        flex: 1;
    }

    .board-list li a {
        color: #333;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .board-list li a:hover {
        color: #f47703;
    }

    .page {
        text-align: center;
        margin-top: 20px;
    }

    .page ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: inline-block;
    }

    .page ul li {
        display: inline-block;
        margin-right: 5px;
    }

    .page ul li a {
        display: inline-block;
        padding: 5px 10px;
        background-color: #f47703;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .page ul li a:hover {
        background-color: #FFD700;
    }

    .search {
        justify-content: center;
        display: flex;
        align-items: center;
        margin-top: 20px;
    }

    .search form {
        display: flex;
        align-items: center;
    }

    .search select,
    .search input[type="text"],
    .search input[type="submit"] {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .search select {
        margin-right: 5px;
    }

    .search input[type="submit"] {
        background-color: #f47703;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    .search input[type="submit"]:hover {
        background-color: #FFD700;
    }
    .write-button {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

.write-button a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #F47703;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.write-button a:hover {
    background-color: #FFD700;
    color: #F47703;
}
    
</style>

<main>
<div class="container">
        <h1>게시판 글 목록</h1>
<div class="write-button">
    <a href="${pageContext.request.contextPath}/boards/boardsWrite">게시판 글쓰기</a>
    <div>총 레코드 수: ${pDTO.totalRecord}개</div>
</div>


        
        <ul class="board-list">
            <li>
                <span>번호</span>
                <span>제목</span>
                <span>글쓴이</span>
                <span>조회수</span>
                <span>등록일</span>
            </li>
            <c:forEach var="dto" items="${list}">
                <li>
                    <span>${dto.boardsNo }</span>
                    <span><a href="/home/boards/boardsView/${dto.boardsNo }">${dto.subject }</a></span>
                    <span>${dto.userId }</span>
                    <span>${dto.hit }</span>
                    <span>${dto.writedate }</span>
                </li>
            </c:forEach>
        </ul>

        <div class="page">
		      <ul>
         <!-- 이전 페이지 -->
         <!-- 현재페이지가 1이면 prev를 눌러도 페이지이동이 없도록, 2이상이면 prev를 누르면 이전페이지로 이동-->
         <c:if test="${pDTO.nowPage == 1}">
            <li>prev</li>
         </c:if>
         <c:if test="${pDTO.nowPage > 1}">
            <li><a href='/home/boards/boardsList?nowPage=${pDTO.nowPage-1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>prev</a></li>
         </c:if>
         
         <!-- 페이지 번호 -->
         <!-- var:변수, begin:시작값, end:끝값, step:증감값 -->
         <c:forEach var="p" begin="${pDTO.startPageNum}" end="${pDTO.startPageNum+pDTO.onePageNumCount-1}" step="1">
            <c:if test="${p <= pDTO.totalPage}">
               <c:if test="${p == pDTO.nowPage}">
                  <li style="background:yellow"><a href='/home/boards/boardsList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
               </c:if>
               <c:if test="${p != pDTO.nowPage}">
                  <li><a href='/home/boards/boardsList?nowPage=${p}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>${p}</a></li>
               </c:if>
            </c:if>
         </c:forEach>

         <!-- 다음 페이지 -->
         <c:if test="${pDTO.nowPage >= pDTO.totalPage}">
            <li>next</li>
         </c:if>
         <c:if test="${pDTO.nowPage < pDTO.totalPage}">
            <li><a href='/home/boards/boardsList?nowPage=${pDTO.nowPage+1}<c:if test="${pDTO.searchWord!=null}">&searchKey=${pDTO.searchKey}&searchWord=${pDTO.searchWord}</c:if>'>next</a></li>
         </c:if>
      </ul>
   </div>
		
        </div>

        <div class="search">
            <form action="/home/boards/boardsList">
                <select name="searchKey" id="">
                    <option value="subject">제목</option>
                    <option value="content">글내용</option>
                    <option value="userid">글쓴이</option>
                </select>
                <input type="text" name="searchWord" id="searchWord" />
                <input type="submit" value="Search" />
            </form>
        </div>
   
</main>
