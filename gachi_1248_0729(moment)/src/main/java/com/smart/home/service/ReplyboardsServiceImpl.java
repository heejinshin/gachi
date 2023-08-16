package com.smart.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.smart.home.dao.ReplyboardsDAO;
import com.smart.home.dto.ReplyboardsDTO;

@Service
public class ReplyboardsServiceImpl implements ReplyboardsService {
   @Inject
   ReplyboardsDAO dao;

   @Override
   public int replyInsert(ReplyboardsDTO dto) {
      // TODO Auto-generated method stub
      return dao.replyInsert(dto);
   }

   @Override
   public List<ReplyboardsDTO> replySelect(int boardsNo) {
      // TODO Auto-generated method stub
      return dao.replySelect(boardsNo);
   }

   @Override
   public int replyUpdate(ReplyboardsDTO dto) {
      // TODO Auto-generated method stub
      return dao.replyUpdate(dto);
   }

   @Override
   public int replyDelete(int replyNo) {
      // TODO Auto-generated method stub
      return dao.replyDelete(replyNo);
   }
}