package com.smart.home.dto;

import lombok.Data;

@Data
public class PartyDTO {
	private int partyNo;  // ���ӹ�ȣ 
	private String userId;  // ȸ�� ���̵� 
	private String hobby;  // ���� ���� ��� ī�װ�
	private String local;  // ���� ���� ���� ī�װ�
	private String partyName;   // ���Ӹ�
	private String partyContent;  // ���� �� ����
	private String partyPlace;  // ���� ���
	private String partyDay;  // ������
	private String recruitStart;  // ���� ������
	private String recruitEnd; // ���� ������
}
