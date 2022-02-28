package my;

import java.io.File;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dto.BoardDTO;
import common.Constants;
import my.dao.MyDAO;
import my.dto.MyCommentDTO;
import my.dto.MyDTO;
import page.Pager;

@WebServlet("/my_servlet/*")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자가 요청한 주소
		String uri = request.getRequestURI();
		// 프로젝트 이름
		String context = request.getContextPath();
		MyDAO dao = new MyDAO();
		if (uri.indexOf("list.do") != -1) {
			String tab = request.getParameter("tab");
			String page = "";
			String cate = "";
			int count;
			if (tab.equals("hot")) {
				page = "/my/list.jsp";
			} else if (tab.equals("funny")) {
				page = "/my/fun.jsp";
				cate = "funny";
				
			} else if(tab.equals("common")) {
				page = "/my/common.jsp";
				cate = "common";
				
			} else if(tab.equals("sports")) {
				page = "/my/sports.jsp";
				cate = "sports";
				
			}else if(tab.equals("game")) {
				page = "/my/game.jsp";
				cate = "game";
				
			}else if(tab.equals("community")) {
				page = "/my/community.jsp";
				cate = "community";
			
			}
			count = dao.count(cate);
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<MyDTO> list = dao.list(start, end, cate);
			
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			return;

		} else if (uri.indexOf("join.do") != -1) {
			String page = "/my/join.jsp";
			response.sendRedirect(context + page);
		} else if (uri.indexOf("login.do") != -1) {
			String page = "/my/login.jsp";
			response.sendRedirect(context + page);
		}

		else if (uri.indexOf("write.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("userid");

			// 파일업로드 처리
			File uploadDir = new File(
					"C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\jsp02\\images");
			if (!uploadDir.exists()) {// 업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();// 디렉토리를 만듦
			}
			String path = "C:\\work_java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\jsp02\\images";
			MultipartRequest multi = new MultipartRequest(request, path, Constants.MAX_UPLOAD, "utf-8",
					new DefaultFileRenamePolicy());
			String writer = (String) session.getAttribute("result");
			String filename = multi.getFilesystemName("filename");
			String tab = multi.getParameter("tab");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");

			MyDTO dto = new MyDTO();
			dto.setWriter(writer);
			dto.setTab(tab);
			dto.setSubject(subject);
			dto.setContent(content);
			if (filename == null) {
				filename = "-";
			}
			dto.setFilename(filename);
			System.out.println(tab);
			System.out.println(writer);
			System.out.println(subject);
			System.out.println(content);
			System.out.println(filename);
			dao.write(dto);
			String page = "/my_servlet/list.do?tab=hot";
			response.sendRedirect(context + page);
		} else if (uri.indexOf("myview.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			HttpSession session = request.getSession();
			// 조회수 증가 처리
			dao.plusReadCount(num, session);
			MyDTO dto = dao.view(num);
			// request영역에 저장
			request.setAttribute("dto", dto);
			// 화면전환
			String page = "/my/myview.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (uri.indexOf("my_comment_add.do") != -1) {
			HttpSession session = request.getSession();
			int my_num = Integer.parseInt(request.getParameter("my_num"));
			String writer = (String) session.getAttribute("result");
			String content = request.getParameter("content");
			MyCommentDTO dto = new MyCommentDTO();
			dto.setMy_num(my_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);

		} else if (uri.indexOf("my_comment.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			int comment_count = dao.comment_count(num);
			// 페이지 나누기를 위한 처리
			int curPage = 1;
			// 숫자 처리는 null 포인트 익셉션이 잘 나기때문에 if문처리해줌
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(comment_count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();

			List<MyCommentDTO> list2 = dao.commentList(num, start, end);
			request.setAttribute("page", pager);
			request.setAttribute("list2", list2);
			String page = "/my/comment_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		else if(uri.indexOf("search.do") != -1) {
			
			String keyword=request.getParameter("keyword");
			int count1 = dao.count1(keyword);
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count1, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<MyDTO> list=dao.searchList(keyword, start, end);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);
			String page="/my/search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
		else if(uri.indexOf("like.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			System.out.println(num);
			dao.likeCount(num);
			String page="/my_servlet/myview.do?num="+num;
			response.sendRedirect(context+page);
		}
		else if(uri.indexOf("mywriting.do") != -1) {
			HttpSession session = request.getSession();
			String writer =(String) session.getAttribute("result");
			int count2 = dao.count2(writer);
			int curPage = 1;
			if (request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count2, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<MyDTO> list=dao.myWrite(writer, start, end);
			request.setAttribute("page", pager);
			request.setAttribute("list", list);
			
			String page="/my/my_write.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
