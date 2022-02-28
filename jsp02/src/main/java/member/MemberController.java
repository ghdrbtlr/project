package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		//사용자가 요청한 주소
		//String url=request.getRequestURL().toString();
		String uri=request.getRequestURI();
		//컨택스트 패스(웹프로젝트의 이름(식별자))
		String context=request.getContextPath();
		MemberDAO dao=new MemberDAO();
	//member_servlet/list.do이면
		if(uri.indexOf("list.do") != -1) {
			Map<String,Object> map=new HashMap<>();
			List<MemberDTO> list=dao.memberList();//리스트 리턴
			map.put("list", list);//맵에 자료 저장
			map.put("count", list.size());//회원수
			request.setAttribute("map", map);
			//String page="/ch06/member_list.jsp";
			String page="/ch06/member_list2.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		}else if(uri.indexOf("join.do") != -1) {//회원등록
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insert(dto);
		}else if(uri.indexOf("view.do") != -1) {
			String userid=request.getParameter("userid");
			System.out.println("클릭한 아이디 : "+userid);
			MemberDTO dto=dao.memberDetail(userid);
			request.setAttribute("dto", dto);
			String page="/ch06/member_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			//레코드 수정 처리
			dao.update(dto);
			//페이지 이동
			response.sendRedirect(context+"/ch06/member.jsp");
		}else if(uri.indexOf("delete.do") != -1) {
			String userid=request.getParameter("userid");
			//레코드 삭제 처리
			dao.delete(userid);
		//페이지 이동
			response.sendRedirect(context+"/ch06/member.jsp");
		}else if(uri.indexOf("login.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디 : "+userid);
			System.out.println("패스워드 : "+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/ch06/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("join_oracle_secret.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insertCrypt(dto);
		}else if(uri.indexOf("login_oracle_secret.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디 : "+userid);
			System.out.println("패스워드 : "+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckOracle(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/ch06/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("join_sha.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insertSha256(dto);
		}else if(uri.indexOf("login_sha.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디 : "+userid);
			System.out.println("패스워드 : "+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckSha256(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/ch06/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("join_bcrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			MemberDTO dto=new MemberDTO();//MemberDTO 생성
			dto.setUserid(userid);//dto의 setter를 통한 자료저장
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insertBcrypt(dto);
		}else if(uri.indexOf("login_bcrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디 : "+userid);
			System.out.println("패스워드 : "+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckBcrypt(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/ch06/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		doGet(request, response);
	}

}
