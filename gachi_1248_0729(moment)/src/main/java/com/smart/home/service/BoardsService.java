package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.BoardsDTO;
import com.smart.home.dto.BoardsFileDTO;
import com.smart.home.dto.PagingDTO;

public interface BoardsService {
   //자료실 목록 
   public List<BoardsDTO> getBoardsList(PagingDTO pDTO);
   //글선택(1개)
   public BoardsDTO boardsSelect(int boardsNo);
   //글등록
   public int boardsInsert(BoardsDTO dto);
   //파일명등록
   public int boardsFileInsert(List<BoardsFileDTO> fileList);
   //글수정
   public int boardsUpdate(BoardsDTO dto);
   //글삭제
   public int boardsDelete(int boardsNo, String userId);
   //조회수 증가
   public void hitCount(int boardsNo);
   //첨부할목록 삭제
   public int boardsFileDelete(int boardsNo);
   //해당글의 첨부파일 선택
   public List<BoardsFileDTO> boardsFileSelect(int boardsNo);
   
   public int totalRecord(PagingDTO pDTO); 
   
}