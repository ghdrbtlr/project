package my.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;


import my.dto.MyCommentDTO;
import my.dto.MyDTO;
import sqlmap.MybatisManager;

public class MyDAO {

	public List<MyDTO> list(int start, int end, String tab) {
		List<MyDTO> list=null;
		try (SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("tab", tab);
			list=session.selectList("my.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

	public void write(MyDTO dto) {
		try(SqlSession session
				=MybatisManager.getInstance().openSession()){
			session.insert("my.write", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void plusReadCount(int num, HttpSession count_session) {
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num) != null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			if(current_time-read_time > 24*60*60*1000) {//현재시간-읽은시간>5초,
				//하루에 한번만 24*60*60*1000
				session.update("my.plusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute("read_time_"+num, current_time);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public MyDTO view(int num) {
		MyDTO dto=null;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			dto=session.selectOne("my.myview",num);
			String content=dto.getContent();
			content=content.replace("\n", "<br>"); 
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void commentAdd(MyCommentDTO dto) {
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			session.insert("my.commentAdd",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<MyCommentDTO> commentList(int num1, int start1, int end1) {
		List<MyCommentDTO> list2 = null;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			Map<String,Object> map = new HashMap<>();
			map.put("start", start1);
			map.put("end", end1);
			map.put("num", num1);
			list2=session.selectList("my.commentList",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}

	public int comment_count(int num) {
		int result=0;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			result=session.selectOne("my.comment_count",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int count(String tab) {
		int result=0;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()){
			result = session.selectOne("my.count",tab);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}



	public List<MyDTO> searchList(String keyword, int start, int end) {
		List<MyDTO> list=null;
		
		try(SqlSession session
				=MybatisManager.getInstance().openSession()){
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("my.searchList", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}



	public int count1(String keyword) {
		int result=0;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()){
			String keyword1= "%"+keyword+"%";
			result = session.selectOne("my.count1",keyword1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	public void likeCount(int num) {
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			session.update("my.likecount",num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	public int count2(String writer) {
		int result=0;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()){
			result = session.selectOne("my.count2",writer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	public List<MyDTO> myWrite(String writer, int start, int end) {
		List<MyDTO> list = null;
		try(SqlSession session
				=MybatisManager.getInstance().openSession()) {
			Map<String,Object> map = new HashMap<>();
			map.put("writer", writer);
			map.put("start", start);
			map.put("end", end);
			list= session.selectList("my.myWriter",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	



	



	



}
