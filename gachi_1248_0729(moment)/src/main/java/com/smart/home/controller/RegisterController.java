package com.smart.home.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.RegisterDTO;
import com.smart.home.service.RegisterService;

@Controller
@RequestMapping("/register")
public class RegisterController {
   // Service Interface를 객체로 생성해주는 방법

   @Autowired
   RegisterService service;
   
   @Autowired
   JavaMailSenderImpl mailSender;
   
   @GetMapping("/regForm")
   public String regForm() {
      return "register/registerForm";
   }
   @PostMapping("/registerOk")
   public ModelAndView regOk(RegisterDTO dto) {
      System.out.println(dto.toString());
      int result = 0;
      try {
         result = service.registerInsert(dto);
      } catch (Exception e) {
         System.out.println("회원가입실패...." + e.getMessage());
      }
      
      ModelAndView mav = new ModelAndView();
      if(result>0) {
         // 1: 성공 : 홈으로
         mav.setViewName("redirect:/");
      }else {
         // 0: 실패 : 회원가입으로 이동
         mav.setViewName("register/registerResult");
      }
      return mav;
   }
   @GetMapping("/login")
   public String login() {
      return "register/login";
   }
   
   //로그인 DB조회 목적 - 아이디, 이름
   @PostMapping("/loginOk")
   public ModelAndView loginOk(RegisterDTO dto, HttpSession session) {
	    RegisterDTO result = service.loginOk(dto);
	    ModelAndView mav = new ModelAndView();
	   if(result !=null) {//성공 
		   //세션에 아이디, 이름, 로그인상태 기록
		   session.setAttribute("logId", result.getUserId());
		   session.setAttribute("logName", result.getUserName());
		   session.setAttribute("logStatus", "Y");
		   
		   mav.setViewName("redirect:/");
	   }else{// 실패
		   // 로그인 폼으로 이동하기
		   mav.setViewName("redirect:login");
	   }
	   return mav;
   }
   //로그아웃 : session객체를 지운다. 
   //  세션영역에 보관된 변수가 지워지고 새로운 session객체가 할당된다. 
   @GetMapping("/logout")
   public ModelAndView logout(HttpSession session) {
	   
	   session.invalidate(); // session객체를 지운다. -> 새로운 session객체가 된다
	   
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("redirect:/");
	   
	   return mav;
   }
   //아이디 찾기 (폼)
   @GetMapping("/idSearch")
   public String idSearchForm() {
	   return "register/idSearch";
   }
   @PostMapping("/idSearchOk")
   @ResponseBody
   public String idSearchOk(RegisterDTO dto) {
	   //이름, 연락처가 일치하는 아이디와 이메일을 구한다. 
	   RegisterDTO registerDTO = service.idSearch(dto);
	   String resultTxt = "N";
	   if(registerDTO!=null) { //일치하는 정보가 있을때
		   //이메일 보내기 
	try {   
		   String subject = "아이디 찾기 결과";
		   String content = "<div style='background:pink; border:1px solid #ddd; padding:50px; text-align:center'>";
		 
		   content += "검색한 아이디는 :"+ registerDTO.getUserId();
		   content += "</div>";
		
		   MimeMessage message = mailSender.createMimeMessage();
		   MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		   messageHelper.setFrom("dlghwns100234@naver.com");
		   messageHelper.setTo("dlghwns100234@naver.com");
		   messageHelper.setSubject(subject);
		   messageHelper.setText("text/html; charset=UTF-8",content);
		   mailSender.send(message);
		   resultTxt = "Y";
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		   
	   }else { //일치하는 정보가 없을때
		   resultTxt = "N";
	   }
	   
	   return resultTxt;
   }
   
}
