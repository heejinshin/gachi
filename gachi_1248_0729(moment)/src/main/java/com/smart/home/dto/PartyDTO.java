package com.smart.home.dto;

import lombok.Data;

@Data
public class PartyDTO {
	private int partyNo;  // 모임번호 
	private String userId;  // 회원 아이디 
	private String hobby;  // 모임 관련 취미 카테고리
	private String local;  // 모임 관련 지역 카테고리
	private String partyName;   // 모임명
	private String partyContent;  // 모임 상세 설명
	private String partyPlace;  // 모임 장소
	private String partyDay;  // 모임일
	private String recruitStart;  // 모임 시작일
	private String recruitEnd; // 모임 종료일
}
