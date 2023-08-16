package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.PartyDAO;
import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.PartyDTO;
import com.smart.home.dto.PartyFileDTO;

@Service
public class PartyServiceImpl implements PartyService {
	  @Autowired
	   PartyDAO dao;
	 

	@Override
	public int totalRecord(PagingDTO pDTO) {
		// TODO Auto-generated method stub
		return dao.totalRecord(pDTO);
	}

	@Override
	public void hitCount(int partyNo) {
		// TODO Auto-generated method stub
		dao.hitCount(partyNo);
	}


/////changees
	
	@Override
	public List<PartyDTO> partyList(PagingDTO pDTO) {
		// TODO Auto-generated method stub
		return dao.partyList(pDTO);
	}

	@Override
	public PartyDTO getParty(int partyNo) {
		// TODO Auto-generated method stub
		return dao.getParty(partyNo);
	}

	@Override
	public List<PartyDTO> CategoryList(PagingDTO pDTO) {
		// TODO Auto-generated method stub
		return dao.CategoryList(pDTO);
	}

	@Override
	public int PartyFormOk(PartyDTO dto) {
		// TODO Auto-generated method stub
		return dao.PartyFormOk(dto);
	}

	@Override
	public int PartyDel(int partyNo, String userId) {
		// TODO Auto-generated method stub
		return dao.PartyDel(partyNo, userId);
	}

	@Override
	public int PartyFileDelete(int partyNo) {
		// TODO Auto-generated method stub
		return dao.PartyFileDelete(partyNo);
	}
	
	@Override
	public int PartyFileInsert(List<PartyFileDTO> upFileList) {
		return dao.PartyFileInsert(upFileList);
	}

	@Override
	public int PartyParticipationForm(PartyDTO dto) {
		// TODO Auto-generated method stub
		return dao.PartyParticipationFormOk(dto);
	}






}
