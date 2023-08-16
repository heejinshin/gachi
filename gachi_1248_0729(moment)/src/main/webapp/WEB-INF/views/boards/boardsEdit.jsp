<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/home/inc/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: sans-serif;
        background-color: #f4f4f4;
    }

    .container {
        width: 1000px;
        height: 1000px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .container h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .container ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .container li {
        margin-bottom: 15px;
    }

    .container li label {
        display: block;
        font-weight: bold;
        color: #333;
    }

    .container input[type="text"],
    .container textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }

    .container input[type="file"] {
        margin-top: 10px;
    }

    .container input[type="submit"],
    .container input[type="button"],
    .container a.delete-button {
        padding: 10px 20px;
        background-color: #f47703;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .container input[type="button"].delete-button {
        background-color: #f44336;
        margin-right: 10px;
    }

    .container form .delete-button:hover,
    .container input[type="button"]:hover,
    .container a.delete-button:hover {
        background-color: #d32f2f;
    }

    .container input[type="submit"]:hover,
    .container input[type="button"].delete-button:hover {
        background-color: #ff9800;
    }

    .container textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
        min-height: 500px; /* 최소 높이를 500px로 설정 */
    }

</style>

<main>
    <div class="container">
        <h1>자료실 글수정</h1>
        <!-- 파일첨부가 있을 경우 form태그에 enctype속성을 반드시 기술하여야 합니다.  -->
        <form action="/home/boards/boardsEditOk" id="frm" method="post" enctype="multipart/form-data"> 
            <!-- 현재 수정 글의 글번호를 폼에 보관... 수정 기준이 되는 레코드 번호로 사용 -->
            <input type="hidden" name="boardsNo" value="${dto.boardsNo }"/>
            <ul>
                <li>
                    <label for="subject">제목</label>
                    <input type="text" name="subject" id="subject" value="${dto.subject}"/>
                </li>
                <li>
                    <label for="content">글내용</label>
                    <textarea name="content" id="content" >${dto.content}</textarea>
                </li>
                <li>
                    <label for="attachment">첨부파일</label>
                    <ul id="filelist">
                        <!-- 이미 첨부된 파일을 다시 수정할 수 있도록 해줍니다.  -->
                        <c:forEach var="fileDTO" items="${fileList}">
                            <li>
                                <div>${fileDTO.filename} <input type="button" class="delete-button" value="X"/></div>
                                <input type="hidden" name="attachedFile" value="${fileDTO.filename}"/>
                            </li>
                        </c:forEach>
                    </ul>
                    <input type="file" name="filename" id="filename"/>
                    <input type="button" value=" + "/>
                </li>
                <li>
                    <input type="submit" value="자료실 수정하기"/>
                    <a href="#" class="delete-button" onclick="boardsDel()">글 삭제</a>
                </li>
            </ul>
        </form>
    </div>
</main>


<script>
    CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);

    function boardsDel() {
        if (confirm("자료실 글을 삭제하시겠습니까")) {
            location.href = "/home/boards/boardsDel?boardsNo=${dto.boardsNo}";
        }
    }

    // ... The rest of the JavaScript code (As provided earlier) ...
</script>
