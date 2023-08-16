package com.smart.home.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//lombok�� 
// ������̼� @Data�� ǥ�⸦ �ϸ� @setter, @getter, toString�� ������� �ʾƵ� �ȴ�

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
   //������ ���ϸ�  
   private List<String> delFile;
   
}
