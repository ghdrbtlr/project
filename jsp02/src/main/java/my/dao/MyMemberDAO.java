package my.dao;

import org.apache.ibatis.session.SqlSession;

import my.dto.MyMemberDTO;
import sqlmap.MybatisManager;

public class MyMemberDAO {

	public void insert(MyMemberDTO dto) {
		try (SqlSession session=
				MybatisManager.getInstance().openSession()){
			session.insert("my.memberInsert",dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public String logincheck(MyMemberDTO dto) {
		String result="";
		try(SqlSession session=
				MybatisManager.getInstance().openSession()){
			  result=session.selectOne("my.logincheck",dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public MyMemberDTO view(String userid) {
		MyMemberDTO dto=null;
		try(SqlSession session=
				MybatisManager.getInstance().openSession()) {
			dto=session.selectOne("my.view",userid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	public int update(MyMemberDTO dto) {
		int result=0;
		try(SqlSession session=
				MybatisManager.getInstance().openSession()) {
			result=session.update("my.update",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public void delete(String userid) {
		try(SqlSession session=
				MybatisManager.getInstance().openSession()) {
			session.delete("my.memberDelete",userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

	

}
