package com.smart.home.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.PartyDTO;
import com.smart.home.dto.PartyFileDTO;

@Repository
public interface PartyDAO {
	public int totalRecord(PagingDTO pDTO); 
	public void hitCount(int partyNo);
	public List<PartyDTO> partyList(PagingDTO pDTO);   // 모임 리스트
	public PartyDTO getParty(int partyNo);    // 모임 신청하기 
	public List<PartyDTO> CategoryList(PagingDTO pDTO);   // 카테고리 리스트? 
	public int PartyFormOk(PartyDTO dto);    // 모임 양식 OK
	public int PartyParticipationFormOk(PartyDTO dto);
	public int PartyFileInsert(List<PartyFileDTO> upFileList);   // 모임 파일 삽입  ??
	public int PartyDel(int partyNo, String userId);    // 모임 삭제 
	public int PartyFileDelete(int partyNo);   // 모임파일 삭제 
	
}	
