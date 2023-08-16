package com.smart.home.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smart.home.dto.ReplyboardsDTO;
import com.smart.home.service.ReplyboardsService;

@RestController
public class ReplyboardsController {
   @Autowired
   ReplyboardsService service;
   
   @PostMapping("/reply/replyWrite")
   public String replyWrite(ReplyboardsDTO dto, HttpSession session) {
      //session�۾��� ���ϱ� 
      dto.setUserId((String)session.getAttribute("logId"));
      
      int result = service.replyInsert(dto);
      ////
      return result+"";
   }
   //��� ��� ���ϱ�
   @GetMapping("/reply/replyList")
   public List<ReplyboardsDTO> replyList(int boardsNo) { //���� �۹�ȣ
      return service.replySelect(boardsNo);
   }
   //��� ����(DB:update)
   @PostMapping("/reply/replyEditOk")
   public String replyEditOk(ReplyboardsDTO dto) {
      return String.valueOf(service.replyUpdate(dto));
   }
   @GetMapping("/reply/replyDel")
   public String replyDelete(int replyNo) {
      return String.valueOf(service.replyDelete(replyNo));
   }
}