package memo;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.dao.MemoDAO;
import memo.dao.MemoDAOH;
import memo.dto.MemoDTOH;


@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		//사용자가 요청한 주소
		String uri=request.getRequestURI();
		MemoDAO dao=new MemoDAO();
		MemoDAOH daoh=new MemoDAOH();
		
		if(uri.indexOf("list.do") != -1) {
			//검색옵션+검색키워드
			String searchkey=request.getParameter("searchkey");
			String search=request.getParameter("search");
			
			//List<MemoDTO> list=dao.listMemo(searchkey, search);//메모 목록 리턴
			List<MemoDTOH> list=daoh.listMemo(searchkey, search);
			//request 영역에 저장
			request.setAttribute("list", list);
			//포워딩
			String page="/memo/memo_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insert.do") != -1) {
			//사용자가 입력한 내용을 dto에 저장
			String writer=request.getParameter("writer");
			String memo=request.getParameter("memo");
			//MemoDTO dto=new MemoDTO();
			MemoDTOH dto=new MemoDTOH();
			dto.setWriter(writer);
			dto.setMemo(memo);
			//dao에 레코드 저장 요청
			//dao.insertMemo(dto);
			daoh.insertMemo(dto);
		}else if(uri.indexOf("view.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			System.out.println("글번호:"+idx);
			//MemoDTO dto=dao.viewMemo(idx);
			MemoDTOH dto=daoh.viewMemo(idx);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			String page="/memo/memo_view.jsp";
			RequestDispatcher rd=
					request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			//글번호는 hidden으로 넘어옴
			int idx=Integer.parseInt(request.getParameter("idx"));
			String writer=request.getParameter("writer");
			String memo=request.getParameter("memo");
			//MemoDTO dto=new MemoDTO();
			MemoDTOH dto=new MemoDTOH();
			dto.setIdx(idx);
			dto.setWriter(writer);
			dto.setMemo(memo);
			//dao.updateMemo(dto);//레코드 수정
			daoh.updateMemo(dto);
			//페이지 이동
			response.sendRedirect(
					request.getContextPath()+"/memo/memo.jsp");
		}else if(uri.indexOf("delete.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			//dao.deleteMemo(idx);//레코드 삭제
			daoh.deleteMemo(idx);
		//페이지 이동
			response.sendRedirect(
					request.getContextPath()+"/memo/memo.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		doGet(request, response);
	}

}
