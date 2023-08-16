package com.smart.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.smart.home.dao.RegisterDAO;
import com.smart.home.dto.RegisterDTO;

@Service
public class RegisterServiceImpl implements RegisterService{

	@Inject
	RegisterDAO dao;
	
	@Override
	public int registerInsert(RegisterDTO dto) {
		return dao.registerInsert(dto);
	}
	@Override
	public RegisterDTO loginOk(RegisterDTO dto) {
		return dao.loginOk(dto);
	}
	@Override
	public RegisterDTO idSearch(RegisterDTO dto) {
		// TODO Auto-generated method stub
		return dao.idSearch(dto);
	}
	
}
