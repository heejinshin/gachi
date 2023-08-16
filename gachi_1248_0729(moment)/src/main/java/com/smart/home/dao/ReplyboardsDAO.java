package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.ReplyboardsDTO;

public interface ReplyboardsDAO {
   public int replyInsert(ReplyboardsDTO dto);
   public List<ReplyboardsDTO> replySelect(int boardsNo);
   public int replyUpdate(ReplyboardsDTO dto);
   public int replyDelete(int replyNo);
}