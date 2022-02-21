package model;
import javax.servlet.http.*;
import java.util.*;

import controller.RequestMapping;
import dao.NoticeDAO;
import model.*;
import vo.NoticeVO;

public class NoticeModel {
	
    @RequestMapping("customer/notice.do")
    public String noticeList(HttpServletRequest request, HttpServletResponse response){

        String page = request.getParameter("page");
        boolean prev=true;
        boolean next=true;
        if(page==null) {
            page = "1"; // 첫 페이지 실행(default)
            prev=false;
        }
        int curpage = Integer.parseInt(page); // 현재 페이지 만들기
        int block = 5;
        int startpage=((curpage-1)/block*block)+1;
        int endpage=startpage-1+block;

        NoticeDAO dao = new NoticeDAO();
        int total=dao.totalCount();
        if(endpage>total) {
            endpage = total;
            next=false;
        }

        List<NoticeVO> list = dao.noticeList(curpage);
        
        request.setAttribute("next",next);
        request.setAttribute("prev",prev);
        request.setAttribute("startpage",startpage);
        request.setAttribute("endpage",endpage);
        request.setAttribute("total",total);
        request.setAttribute("curpage",curpage);
        request.setAttribute("notice_list",list);
        request.setAttribute("path","공지사항");
        request.setAttribute("main_jsp","../customer/notice.jsp");
        return "../main/main.jsp";
    }

    @RequestMapping("customer/notice_detail.do")
    public String noticeDetail(HttpServletRequest request, HttpServletResponse response){

        String no = request.getParameter("no");
        String page = request.getParameter("page");

        NoticeVO vo = new NoticeVO();
        NoticeDAO dao = new NoticeDAO();
        vo= dao.noticeDetailData(Integer.parseInt(no));

        request.setAttribute("notice",vo);
        request.setAttribute("page",page);
        request.setAttribute("main_jsp","../customer/notice_detail.jsp");
        return "../main/main.jsp";
    }


    @RequestMapping("customer/notice_update.do")
    public String noticeUpdateData(HttpServletRequest request, HttpServletResponse response){
        String no = request.getParameter("no");
        String page = request.getParameter("page");

        NoticeVO vo = new NoticeVO();
        NoticeDAO dao = new NoticeDAO();
        vo = dao.noticeUpdateData(Integer.parseInt(no));

        request.setAttribute("notice",vo);

        request.setAttribute("page",page);
        request.setAttribute("main_jsp", "../customer/notice_update.jsp");
        return "../main/main.jsp";
    }

    @RequestMapping("customer/notice_update_ok.do")
    public String noticeUpdate(HttpServletRequest request,HttpServletResponse response){
    	String no = request.getParameter("no");
        String page = request.getParameter("page");
    	try {
//          HttpSession session = request.getSession();
            request.setCharacterEncoding("UTF-8");
            String content = request.getParameter("content");
            String title = request.getParameter("title");
//            String adminID= (String)session.getAttribute("admin");

            NoticeVO vo = new NoticeVO();
            vo.setNo(Integer.parseInt(no));
            vo.setTitle(title);
            vo.setContent(content);
//            vo.setAdminID(adminID);

            vo.setAdminID("test1");
            NoticeDAO dao = new NoticeDAO();
            dao.noticeUpdate(vo);

//            response.sendRedirect("notice_detail.do?no="+no+"&page="+page);
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:notice_detail.do?no="+no+"&page="+page;
    }
    
    @RequestMapping("customer/notice_delete.do")
    public String noticeDelete(HttpServletRequest request, HttpServletResponse response) {

            String no = request.getParameter("no");
            String page = request.getParameter("page");

            NoticeDAO dao = new NoticeDAO();
            dao.noticeDelete(Integer.parseInt(no));
            
            
//            response.sendRedirect("notice.do?page="+page);
            
        return "redirect:notice.do?page="+page;
    }
    
    @RequestMapping("customer/notice_insert.do")
    public String noticeInsertForm(HttpServletRequest request, HttpServletResponse response){
        String page = request.getParameter("page");

        request.setAttribute("page",page);
        request.setAttribute("main_jsp", "../customer/notice_insert.jsp");
        return "../main/main.jsp";
    }
    
    @RequestMapping("customer/notice_insert_ok.do")
    public String noticeInsert(HttpServletRequest request, HttpServletResponse response) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
//            HttpSession session = request.getSession();

            // 로그인 기능 구현되면 변경 예정
//    	String adminID=(String)session.getAttribute("admin_id");
            String adminID = "test1";
            NoticeVO vo = new NoticeVO();
            vo.setTitle(title);
            vo.setContent(content);
            vo.setAdminID(adminID);
            NoticeDAO dao = new NoticeDAO();
            
            dao.noticeInsertData(vo);
//            response.sendRedirect("notice.do");
            return "redirect:notice.do";
    }
}








