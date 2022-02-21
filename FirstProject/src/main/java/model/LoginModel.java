package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.RequestMapping;
import dao.BookDAO;
import dao.LoginDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;

public class LoginModel {
	
	@RequestMapping("login/login.do")
	public String login_main(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId=(String)session.getAttribute("userId");
//		if(userId!=null)
//			return "redirect:../main/main.do";
		request.setAttribute("main_jsp", "../login/login.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("login/login_ok.do")
	public String login_check(HttpServletRequest request,HttpServletResponse response){
		try {
			HttpSession session= request.getSession();
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String check = request.getParameter("check");
			LoginDAO dao = new LoginDAO();
			String result = dao.isLogin(id, pwd);
			if (result.equals("NOID")) {
				// js 추가해야 함
				return "redirect:../login/login.do";
			}else if(result.equals("NOPWD")){
				// js 추가해야 함
				return "redirect:../login/login.do";
			}else {
				StringTokenizer st = new StringTokenizer(result, "|");
				String name=st.nextToken();
				String admin_check=st.nextToken();
				
				
				if(admin_check.equals("N")){
					session.setAttribute("admin",0);
				}else {
					session.setAttribute("admin",1);
				}
				session.setAttribute("login", 1);
				session.setAttribute("userId",id);
				session.setAttribute("userName",name);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return "redirect:../main/main.do";
	}

	@RequestMapping("login/logout.do")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		LoginDAO dao = new LoginDAO();
		dao.logout(id);
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
