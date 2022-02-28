package sqlmap;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
	//SqlSession 객체 생성기
	private static SqlSessionFactory instance;
	//생성자는 보통 public인데 여기선 private처리 했다. 따라서 외부에서는 접근이 안된다.
	//new해서 접근 안되기 때문에 getInstance()우회 접근한다.
	//웹은 사용자들이 많기 때문에 접속할 때마다 MybatisManager m=new MybatisManager();
	//을 실해아면 메모리가 담당이 안되기 때문에 다수의 인스턴스 생성을 막고 하나의 인스턴스만 생성시켜
	//처리한다. 즉, 싱글톤패턴기법이라고 한다.
	private MybatisManager() {
		
	}
	
	public static SqlSessionFactory getInstance() {
		Reader reader = null;//Reader는 InputStreamReader의 상위객체
		try {
			reader = Resources.getResourceAsReader("sqlmap/sqlMapConfig.xml");
			instance = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (reader != null)
					reader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//finally
		return instance;
	}

}
