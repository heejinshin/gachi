package com.smart.home.dao;

import com.smart.home.dto.RegisterDTO;

public interface RegisterDAO {
	public int registerInsert(RegisterDTO dto);
	//�α��� userid, userpwd -> userid, username
	public RegisterDTO loginOk(RegisterDTO dto);
	public RegisterDTO idSearch(RegisterDTO dto);
	
}
