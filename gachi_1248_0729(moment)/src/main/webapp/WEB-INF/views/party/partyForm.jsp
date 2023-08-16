<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        header {
            background-color: #17152D; /* Navy blue color */
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .content {
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 5px;
        }

        .footer {
            background-color: #17152D; /* Orange color */
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .content {
                padding: 10px;
            }

            label {
                display: block;
                margin-bottom: 5px;
            }

            input[type="text"],
            textarea {
                width: 100%;
                box-sizing: border-box;
            }
        }

        /* Additional Styles */
        label {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .img-preview {
            max-width: 100%;
            height: auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: block;
            margin-top: 10px;
        }

        .btn-primary {
            background-color: rgba(255, 136, 0, 0.627); /* Orange color */
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #ff8800; /* Lighter orange color */
        }

        textarea {
            resize: vertical;
        }

        /* Custom select styles */
        select {
            display: block;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        
        @media (max-width: 576px) {
            .form-group {
                margin-bottom: 20px;
            }
        }
        button[type="submit"] {
            background-color: rgba(255, 136, 0, 0.627);
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        
        button[type="submit"]:hover {
            background-color: rgba(255, 136, 0, 1); 
        }
    </style>
</head>
<body>
    <header>
        <h1>모임 작성 게시판</h1>
    </header>
    <div class="container">
        <div class="content">
        
        
            <form method="post" action="${pageContext.request.contextPath}/Party/PartyFormOk" enctype="multipart/form-data">
                <div>
                    <label for="partyName">모임명</label>
                    <input type="text" id="partyName" name="partyName" required>
                </div>
                
                <!-- <label>안내사항</label> -->
                <div>
                  <!--  <textarea id="content" name="content" rows="1" placeholder="ex 7월 29일 (토) 18:00 홍대  "required></textarea>    --> 
                    <div>
                        <label for="partyPlace"> 모임 장소 </label>
                        <input id="partyPlace" name="partyPlace" required>
             
                        </input>
                    </div>
                    
                      <div>
                        <label for="recruitStart">모집 시작일</label>
                        <input id="recruitStart" name="recruitStart" required>
             
                        </input>
                    </div>
                    
                     <div>
                        <label for="recruitEnd">모집 마감일</label>
                        <input id="recruitEnd" name="recruitEnd" required>
             
                        </input>
                    </div>
                    
                   
                    
                    <div>
                        <label for="PartyDay"> 모임일 </label>
                        <input id="PartyDay" name="PartyDay" required>
             				
                        </input>
                    </div>
                    
                    <select id="hobby" name="hobby" required>
                                <optgroup label="취미 카테고리 선택">
                                <option value="outdoor">아웃도어</option>
                                <option value="fitness">피트니스</option>
                                <option value="crafts">공예DIY</option>
                                <option value="sports">스포츠</option>
                                <option value="baking">베이킹</option>
                                <option value="culture">자기계발</option>
                                <option value="self_development">문화예술</option>
                                
                            </optgroup>
                            
                        </select>
                    <div>
                        <label for="local">지역</label>
                        <select id="local" name="local" required>
                                <optgroup label="지역선택">
                                <option value="서울">서울시</option>
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
                            </optgroup>
                            
                        </select>
                    </div>
                </div>
                
                        <label for="filename" style="font-weight: bold; margin-bottom: 10px;">이미지 선택</label>
                        <div style="display: flex; align-items: center;">
                            <input type="file" id="filename" name="filename" accept="image/*" required style="flex: 1; padding: 10px; border: 1px solid #ccc; border-radius: 5px; margin-right: 10px; display: none;">
                            <label for="filename" class="btn-primary" style="cursor: pointer; padding: 10px; border-radius: 5px; margin-bottom: 0;">파일 선택</label>
                        </div>
              
                    
                    
                    <div style="margin-top: 10px;">
                        <img src="" alt="미리보기 이미지" id="imagePreview" style="max-width: 100%; height: auto; border: 1px solid #ccc; border-radius: 5px;">
                    </div>
           
                
                    <label>내용</label>
                <div>
                    <textarea id="partyContent" name="partyContent" rows="20" required></textarea>
                </div>
                
                
                <div>
                    <button type="submit">작성하기</button>
                    
                </div>
            </form>
        </div>
    </div>
    <footer class="footer">
        <p>© 2023 gachi. All rights reserved.</p>
        </footer>
    <script>
        // 이미지 미리보기 기능을 위한 JavaScript 코드
        const party_image = document.getElementById('filename');
        const imagePreview = document.getElementById('imagePreview');

        party_image.addEventListener('change', function () {
            const file = party_image.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    imagePreview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            } else {
                imagePreview.src = '';
            }
        });
        const numberDropdown = document.getElementById('number');
        for (let i = 1; i <= 30; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.textContent = i + '명';
            numberDropdown.appendChild(option);
        }
        
        </script>
</body>
</html>
