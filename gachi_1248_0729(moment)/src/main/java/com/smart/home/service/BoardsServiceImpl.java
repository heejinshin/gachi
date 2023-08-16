package com.smart.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.smart.home.dao.BoardsDAO;
import com.smart.home.dto.BoardsDTO;
import com.smart.home.dto.BoardsFileDTO;
import com.smart.home.dto.PagingDTO;

@Service
public class BoardsServiceImpl implements BoardsService {
   @Inject
   BoardsDAO dao;
   
   @Override
   public List<BoardsDTO> getBoardsList(PagingDTO pDTO) {
      // TODO Auto-generated method stub
      return dao.getBoardsList(pDTO);
   }

   @Override
   public BoardsDTO boardsSelect(int boardsNo) {
      // TODO Auto-generated method stub
      return dao.boardsSelect(boardsNo);
   }

   @Override
   public int boardsInsert(BoardsDTO dto) {
      // TODO Auto-generated method stub
      return dao.boardsInsert(dto);
   }

   @Override
   public int boardsUpdate(BoardsDTO dto) {
      // TODO Auto-generated method stub
      return dao.boardsUpdate(dto);
   }

   @Override
   public int boardsDelete(int boardsNo, String userId) {
      // TODO Auto-generated method stub
      return dao.boardsDelete(boardsNo, userId);
   }

   @Override
   public void hitCount(int boardsNo) {
      // TODO Auto-generated method stub
      dao.hitCount(boardsNo);
   }

   @Override
   public int boardsFileInsert(List<BoardsFileDTO> fileList) {
      // TODO Auto-generated method stub
      return dao.boardsFileInsert(fileList);
   }

   @Override
   public int boardsFileDelete(int boardsNo) {
      // TODO Auto-generated method stub
      return dao.boardsFileDelete(boardsNo);
   }

   @Override
   public List<BoardsFileDTO> boardsFileSelect(int boardsNo) {
      // TODO Auto-generated method stub
      return dao.boardsFileSelect(boardsNo);
   }

   @Override
   public int totalRecord(PagingDTO pDTO) {
      // TODO Auto-generated method stub
      return dao.totalRecord(pDTO);
   }

}