package memo.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import config.HibernateManager;
import memo.dto.MemoDTOH;

public class MemoDAOH {
	public List<MemoDTOH> listMemo(String searchkey, String search){
		//hibernate를 실행할 수 있는 세션 객체
		Session session=HibernateManager.getSessionFactory().openSession();
		//검색 처리(이름+내용, 이름, 내용)
		String sql="select idx,writer,memo,post_date from memo ";
		if(searchkey.equals("writer_memo")) {
			sql += " where writer like :search "
					+ "or memo like :search ";
		}else {
			sql += " where "+searchkey+" like :search ";
		}
		sql += " order by idx desc ";
		//createNativeQuery(sql, 매핑클래스) SQL을 직접 작성
		//setParameter("변수명",값)
		List<MemoDTOH> list=session.createNativeQuery(sql, 
				MemoDTOH.class).setParameter("search", "%"+search+"%")
				.getResultList();
		//세션종료
		session.close();
		return list;
	}
	
	//지우기
	public void deleteMemo(int idx) {
		Session session
		=HibernateManager.getSessionFactory().openSession();
		//트랜잭션 시작
		session.beginTransaction();
		//삭제할 레코드 조회(select * from memo where idx=5)
		MemoDTOH dto=(MemoDTOH)session.get(MemoDTOH.class, idx);
		//삭제(delete from memo where idx=5)
		session.delete(dto);
		//커밋
		session.getTransaction().commit();
		session.close();
	}
	
	//insert기능
	public void insertMemo(MemoDTOH dto) {
		Session session
		=HibernateManager.getSessionFactory().openSession();
		//트랜잭션 시작
		session.beginTransaction();
		session.save(dto);//insert query 자동 생성
		session.getTransaction().commit();
		session.close();
	}
	
	//update기능
	public void updateMemo(MemoDTOH dto) {
		Session session
		=HibernateManager.getSessionFactory().openSession();
		//트랜잭션 시작
		session.beginTransaction();
		dto.setPost_date(new Date());
		session.update(dto);//insert query 자동 생성
		session.getTransaction().commit();
		session.close();
	}
	
	public MemoDTOH viewMemo(int idx) {
		Session session
		=HibernateManager.getSessionFactory().openSession();
		MemoDTOH dto=(MemoDTOH)session.get(MemoDTOH.class, idx);
		session.close();
		return dto;
	}

}
