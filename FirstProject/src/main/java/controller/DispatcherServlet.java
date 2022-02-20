package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.*;
import model.*;

@WebServlet("*.do") // url주소는 사용자 정의
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 모델을 등록
	List<String> modelList=new ArrayList<>();
	public void init(ServletConfig config) throws ServletException {
		modelList.add("model.IndexModel");
		modelList.add("model.NoticeModel");
//		modelList.add("model.CartModel");
//		modelList.add("model.ListModel");
//		modelList.add("model.UserModel");
		
	}



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			String uri=request.getRequestURI();
			uri=uri.substring(request.getContextPath().length()+1);
			for(String cls:modelList){
				// 1. 메모리 할당
				Class clsName = Class.forName(cls);
				Object obj = clsName.getConstructor().newInstance();
				// 2. 메소드 찾기
				// clsName에 클래스의 모든 정보를 가지고 있다
				// clsName(클래스 정보) => 메소드 전체를 가지고온다.
				
				Method[] methods = clsName.getDeclaredMethods();
				for(Method m:methods){
			
					RequestMapping rm =
							m.getDeclaredAnnotation(RequestMapping.class);
					// 어노테이션이 없는 경우에는 에러발생
					if(rm.value().equals(uri)){
						//메소드 실행

						String jsp=(String)m.invoke(obj, request,response);
						// 메소드 호출(invoke) => 메소드 이름을 몰라도 호출이 가능
						// return "redirect:list.do" => send
						// _ok.jsp
						// return "../board/list.jsp"
						if(jsp.startsWith("redirect:")) {
							// request를 초기화한 다음 => 화면 이동
							String s = jsp.substring(jsp.indexOf(":")+1);
							response.sendRedirect(s);
						}else {
							// request를 전송 => 사용이 가능 (request의 값을 유지)
							RequestDispatcher rd =
									request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}

			}
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
