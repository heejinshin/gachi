package com.smart.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//interceptor ó���� �� Ŭ������ �ݵ�� HandlerInterceptorAdapter�� ��ӹ޴´�. 
public class LoginInterceptor extends HandlerInterceptorAdapter {
   
   // mapping �Ǳ� ���� ȣ��Ǵ� interceptor
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      
      //���� �α��� ������ Ȯ���ؼ� �α��� �� ��� ���� �����ּҷ� �̵��ϰ� 
      //�α����� �ȵ� ��� �α��������� ���εǵ��� �����ּҸ� �����Ѵ�. 
      
      HttpSession session = request.getSession();
      String userid = (String)session.getAttribute("logId");
      String logStatus = (String)session.getAttribute("logStatus");
      
      if(userid==null || logStatus==null || userid.equals("") || !logStatus.equals("Y")) {
         //�α��� �ȵ� ��� 
         response.sendRedirect("/home/register/login");
         return false; // ���� �������� �����ʰ� �α��� �������� �̵��Ѵ�. 
      }
      //�α����� �� ��� 
      
      return true; //������������ �̵��Ѵ�. 
   }
   
   // View�������� �̵����� interceptor 
   
   // Controller ������ ����� �� interceptor 
}