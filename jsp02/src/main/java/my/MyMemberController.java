package my;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.dao.MyMemberDAO;
import my.dto.MyMemberDTO;


@WebServlet("/my_member_servlet/*")
public class MyMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException,
	IOException {
		//사용자가 요청한 주소
		String uri=request.getRequestURI();
		//프로젝트 이름
		String context=request.getContextPath();
		MyMemberDAO dao = new MyMemberDAO();
		if(uri.indexOf("join.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd= request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			MyMemberDTO dto= new MyMemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dao.insert(dto);
			String page = "/my_servlet/list.do?tab=hot"; 
		    response.sendRedirect(context+page);
		}
		else if(uri.indexOf("login.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MyMemberDTO dto = new MyMemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.logincheck(dto);
			if(result != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("result", result);
				String page = "/my_servlet/list.do?tab=hot";
				response.sendRedirect(context+page);
			}else {
				response.sendRedirect(context+"/my/login.jsp?message=error");
			}
		}
		else if(uri.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate();
			String page= "/my_servlet/list.do?tab=hot";
			response.sendRedirect(context+page);
		}
		else if(uri.indexOf("view.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid != null) {
				MyMemberDTO dto = dao.view(userid);
				request.setAttribute("dto", dto);
				String page ="/my/view.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
		else if(uri.indexOf("updateData.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid != null) {
				MyMemberDTO dto = dao.view(userid);
				request.setAttribute("dto", dto);
				String page ="/my/update.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
		else if(uri.indexOf("update.do") != -1) {
			int result =0;
			HttpSession session = request.getSession(); 
			String userid =(String)session.getAttribute("userid");
			String passwd = request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			MyMemberDTO dto = new MyMemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			result = dao.update(dto);
			System.out.println(result);
			if(result > 0) {
				request.setAttribute("dto", dto);
				String page ="/my_member_servlet/view.do";
				response.sendRedirect(context+page);
			}else {
				String page="/my/update.jsp?message=error";
				response.sendRedirect(context+page);
				
			}
		}
		else if(uri.indexOf("deleteMember.do") != -1) {
			HttpSession session =request.getSession();
			String userid =(String) session.getAttribute("userid");
			dao.delete(userid);
			session.invalidate();
			String page="/my_servlet/list.do?tab=hot";
			response.sendRedirect(context+page);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
