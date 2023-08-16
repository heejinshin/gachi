package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.BoardsDTO;
import com.smart.home.dto.BoardsFileDTO;
import com.smart.home.dto.PagingDTO;

public interface BoardsDAO {
   //�ڷ�� ��� 
   public List<BoardsDTO> getBoardsList(PagingDTO pDTO);
   //�ۼ���(1��)
   public BoardsDTO boardsSelect(int boardsNo);
   //�۵��
   public int boardsInsert(BoardsDTO dto);
   //���ϸ���
   public int boardsFileInsert(List<BoardsFileDTO> fileList);
   //�ۼ���
   public int boardsUpdate(BoardsDTO dto);
   //�ۻ���
   public int boardsDelete(int boardsNo, String userId);
   //��ȸ�� ����
   public void hitCount(int boardsNo);
   //÷���Ҹ�� ����
   public int boardsFileDelete(int boardsNo);
   //�ش���� ÷������ ����
   public List<BoardsFileDTO> boardsFileSelect(int boardsNo);
   
   public int totalRecord(PagingDTO pDTO); 
   
}