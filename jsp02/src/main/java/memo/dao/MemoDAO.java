package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	
	public List<MemoDTO> listMemo(String searchkey, String search){
		SqlSession session=
				MybatisManager.getInstance().openSession();
		
		List<MemoDTO> list=null;
		try {
			if(searchkey.equals("writer_memo")) {//이름+메모로 검색
				list=session.selectList("memo.listAll", search);
			}else {
				Map<String,String> map=new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
				//마이바티스에서는 입력매개변수는 1개만 전달 가능
				list=session.selectList("memo.list", map);
			}
			//태그,공백문자를 insert때보다 select때 처리가 더 좋다.
			for(MemoDTO dto : list) {//for문으로 처리해야 한다.
				String memo=dto.getMemo();
			  memo=memo.replace("  ", "&nbsp;&nbsp;");//공백문자처리
				memo=memo.replace("<", "&lt"); //Less Than ~보다 작다
				memo=memo.replace(">", "&gt"); //Greater Than
				//키워드에 색상 처리
				if(searchkey.equals("memo")) {
					if(memo.indexOf(search) != -1) {
						memo=memo.replace(search, 
								"<font color='red'>"+search+"</font>");
					}
				}
				dto.setMemo(memo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null)
				session.close();//mybatis 객체 닫기
		}
		return list;
	}

	public void insertMemo(MemoDTO dto) {
		// mybatis 실행 객체 생성
		SqlSession session=
				MybatisManager.getInstance().openSession();
		//태그 문자 처리
		//String memo=dto.getMemo();
		//memo=memo.replace("  ", "&nbsp;&nbsp;");//공백문자처리
		//memo=memo.replace("<", "&lt"); //Less Than ~보다 작다
		//memo=memo.replace(">", "&gt"); //Greater Than 
		//dto.setMemo(memo);
		session.insert("memo.insert", dto);
		//insert 메소드는 파라미터가 1개밖에 허용안한다.
		session.commit();//mybatis는 수동커밋을 해야한다.(자동커밋을 막았다.)
		session.close();//mybatis 세션 닫기
	}//end insertMemo()
	
	
	public MemoDTO viewMemo(int idx) {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		MemoDTO dto=session.selectOne("memo.view", idx);
				//selectOne() 레코드 1개만 가져올때
				//selectList() 레코드 2개 이상 가져올때(목록을 가져올때)
		session.close();
		return dto;
	}

	public void updateMemo(MemoDTO dto) {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		session.update("memo.update",dto);
		session.commit();
		session.close();
		
		
	}

	public void deleteMemo(int idx) {
		SqlSession session=
				MybatisManager.getInstance().openSession();
		session.delete("memo.delete",idx);
		session.commit();
		session.close();
		
	}

}
