package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.ReplyboardsDTO;

public interface ReplyboardsService {
   public int replyInsert(ReplyboardsDTO dto);
   public List<ReplyboardsDTO> replySelect(int boardsNo);
   public int replyUpdate(ReplyboardsDTO dto);
   public int replyDelete(int replyNo);
}