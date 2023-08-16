<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/home/inc/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
 <style>
            .ck-editor__editable[role="textbox"] {
                min-height: 200px;
            }
            .ck-content .image {
                max-width: 80%;
                margin: 20px auto;
           }
           </style>
  <style>
  body {
    font-family: Arial, sans-serif;
  }

  main {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
  }

  h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #f47703; /* New color */
  }

  ul {
    list-style: none;
    padding: 0;
  }

  li {
    margin-bottom: 15px;
  }

  input[type="text"],
  textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  input[type="submit"] {
    background-color: #f47703; /* New color */
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
  }

  input[type="file"],
  input[type="button"] {
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
  }

  #filelist {
    margin-bottom: 10px;
  }

  #filelist div {
    display: flex;
    align-items: center;
  }

  .remove-file {
    background-color: #dc3545;
    color: #fff;
    border: none;
    margin-left: 10px;
  }
    input[type="submit"] {
    background-color: #f47703;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s; /* Add transition for smooth effect */
  }

  input[type="submit"]:hover {
    background-color: #ff944d; /* New color on hover */
  }
  
</style>
 <script>
   //document가 로딩이 완료되면 ready라는 이벤트에 의해서 호출 한다.
   /* 
   jQuery(){
      
   });
   $(document).ready(function(){
      
   }); */
   $(function(){ //ready이벤트 
      //$(선택자).함수(function(){
      //실행문   
      //});
      //  선택자        이벤트     선택자 
      $(document).on('click','#frm input[value=" + "]',function(){
         // 파일첨부 input을 추가 
         var tag = "<div><input type='file' name='filename'/>";
         tag += "<input type= 'button' value=' + '/></div>"
         //현재내용의 마지막에 추가 
         $("#filelist").append(tag);
         
         //방금 이벤트가 발생ㅎ나 + -> ~로 변경한다.
         $(this).val(' - ');
         $(this).parent().css("background","green");
      });
      
      $(document).on('click','#frm input[value=" - "]',function(){
         $(this).parent().remove();
      })
   });
   
</script>

<main>
   <h1>게시판 글쓰기</h1>
   <!-- 파일첨부가 있을 경우 form태그에 enctype속성을 반드시 기술하여야 한다.  -->
   <form action="/home/boards/boardsWriteOk" id="frm" method="post" enctype="multipart/form-data"> 
      <ul>
         <li>제목</li>
         <li><input type="text" name="subject" id="subject" /></li>
         <li>글내용</li>
         <li><textarea name="content" id="content" /></textarea></li>
         <li>첨부파일</li>
         <li id='filelist'>
            <div>
               <input type="file" name="filename" id="filename"/>
               <input type="button" value=" + " />
            </div>
         </li>
         <li><input type="submit" value="글등록" /></li>
      </ul>
   </form>
   
</main>
<script>CKEDITOR.ClassicEditor.create(document.getElementById("content"), option);</script>