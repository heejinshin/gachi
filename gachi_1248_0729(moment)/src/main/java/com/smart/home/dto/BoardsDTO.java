package com.smart.home.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//lombok은 
// 어노테이션 @Data를 표기를 하면 @setter, @getter, toString을 기술하지 않아도 된다

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardsDTO {
   private int boardsNo;
   private String userId;
   private String subject;
   private String content;
   private int hit;
   private String writedate;
   //삭제된 파일명  
   private List<String> delFile;
   
}
