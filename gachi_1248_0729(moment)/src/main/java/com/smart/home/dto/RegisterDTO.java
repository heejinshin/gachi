package com.smart.home.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterDTO {

   private String tel1;
   private String tel2;
   private String tel3;
   private String tel;

   private String email;
   private String userId;
	private String userPwd;
	private String userName;
	private String userAge;
	private String userGender;
	
	private String hostState;
	private String hiredate;
	private String hobby;
	private String local;



   public String getTel() {
      return tel1+"-"+tel2+"-"+tel3;
   }

   public void setTel(String tel) {
      this.tel = tel;
      // - 기준으로 연락처를 자른다.
      String t[]= tel.split("-");
      tel1 = t[0];
      tel2 = t[1];
      tel3 = t[2];
   }

   
}