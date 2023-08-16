<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

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

    /* Custom styling for the reply section */
    #replyboards {
        margin-top: 30px;
    }

    #replyboards textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }

    #replyboards input[type="submit"] {
        margin-top: 10px;
        padding: 8px 15px;
        background-color: #F47703;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #replyboards input[type="submit"]:hover {
        background-color: #FFD700;
    }

    #replyList {
        list-style: none;
        padding: 0;
        margin: 0;
        margin-top: 20px;
    }

    #replyList li {
        padding: 10px;
        background-color: #F9F9F9;
        border-radius: 5px;
        margin-bottom: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    #replyList li b {
        font-weight: bold;
    }

    #replyList li input[type="button"] {
        background-color: #F47703;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    #replyList li input[type="button"]:hover {
        background-color: #FFD700;
    }

    #replyList li textarea {
        width: 400px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }
</style>
<script>
    function boardsDel() {
        if (confirm("자료실 글을 삭제하시겠습니까")) {
            location.href = "/home/boards/boardsDel?boardsNo=${dto.boardsNo}";
        }
    }

    function replyAllList() {
        $.ajax({
            url: '/home/reply/replyList',
            data: {
                boardsNo: ${dto.boardsNo}
            },
            success: function(replyResult) {
                $("#replyList").html("");
                console.log(replyResult);
                $(replyResult).each(function(i, reply) {
                    var tag = "<li>";
                    tag += "<b>" + reply.userId + "(" + reply.writedate + ")</b>";
                    if (reply.userId == '${logId}') {
                        tag += "<div><input type='button' value='Edit' />";
                        tag += "<input type='button' value='Del' title='" + reply.replyNo + "'/></div>";
                        tag += "<div><p>" + reply.reply + "</p>";
                        tag += "<div style='display:none'>";
                        tag += "<form>";
                        tag += "<textarea style='width:100%' name='reply' cols='50' rows='3'>";
                        tag += reply.reply;
                        tag += "</textarea>";
                        tag += "<input type='hidden' name='replyNo' value='" + reply.replyNo + "'/>";
                        tag += "<input type='button' value='수정하기'/>";
                        tag += "</form>";
                        tag += "</div></div>";
                    } else {
                        tag += "<div><p>" + reply.reply + "</p></div>";
                    }
                    tag += "</li>";
                    $("#replyList").append(tag);
                });
            },
            error: function(e) {
                console.log(e.responseText);
            }
        });
    }

    $(function() {
        // Submit the reply form via AJAX
        $("#replyFrm").submit(function() {
            event.preventDefault();
            if ($("#reply").val() == "") {
                alert("댓글을 입력하세요");
                return false;
            }
            var params = $("#replyFrm").serialize();
            $.ajax({
                url: '/home/reply/replyWrite',
                type: 'POST',
                data: params,
                success: function(result) {
                    console.log(result);
                    $("#reply").val("");
                    replyAllList();
                },
                error: function(e) {
                    console.log(e.responseText);
                }
            });
        });

        // ... The rest of the JavaScript code (As provided earlier) ...

        // Fetch and display the initial list of replies
        replyAllList();
    });
</script>

<main>
    <div class="container">
        <h1>게시판 글 내용 보기</h1>
        <ul class="board-list">
            <li><strong>번호 :</strong> ${dto.boardsNo}</li>
            <li><strong>글쓴이 :</strong> ${dto.userId}</li>
            <li><strong>조회수 :</strong> ${dto.hit}</li>
            <li><strong>등록일 :</strong> ${dto.writedate}</li>
            <li><strong>제목 :</strong> ${dto.subject}</li>
            <li><strong>글내용</strong><br/> ${dto.content}</li>
            <li><strong>첨부파일 :</strong>
                <c:forEach var="fDTO" items="${fileList}">
                    <a href="<%=request.getContextPath()%>/upload/${fDTO.filename}" download>${fDTO.filename}</a>
                </c:forEach>
            </li>
        </ul>
        <hr/>
        <!-- 본인이 쓴글일때 수정,삭제 -->
        <c:if test="${logId==dto.userId}">
            <div>
                <a href="/home/boards/boardsEdit?boardsNo=${dto.boardsNo }">수정</a>
                <a href="javascript:boardsDel()">삭제</a>
            </div>
        </c:if>
        <div id="replyboards">
            <c:if test="${logStatus=='Y' }">
                <form method="post" id="replyFrm">
                    <input type="hidden" name="boardsNo" value="${dto.boardsNo }" />
                    <textarea name="reply" id="reply" cols="100" rows="5" placeholder="댓글을 입력하세요..."></textarea>
                    <input type="submit" value="댓글 등록" />
                </form>
            </c:if>
            <hr />
            <ul id="replyList">
                <!-- Reply list will be populated dynamically using AJAX -->
            </ul>
        </div>
    </div>
</main>
