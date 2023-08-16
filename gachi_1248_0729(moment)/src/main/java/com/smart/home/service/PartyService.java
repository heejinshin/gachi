package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.PartyDTO;
import com.smart.home.dto.PartyFileDTO;

public interface PartyService {
	
	

	public int totalRecord(PagingDTO pDTO); 
	public void hitCount(int partyNo);

	
	//�̰� ��� �ϴ�
	public List<PartyDTO> partyList(PagingDTO pDTO);
	public PartyDTO getParty(int partyNo);
	//�۸�ϼ��� (paging, search)
	public List<PartyDTO> CategoryList(PagingDTO pDTO);
	public int PartyFormOk(PartyDTO dto);
	public int PartyFileInsert(List<PartyFileDTO> upFileList);
	public int PartyDel(int partyNo, String userId);
	public int PartyParticipationForm(PartyDTO dto);
	
	
	//÷�����ϸ�� ����
	public int PartyFileDelete(int partyNo);
	
}




