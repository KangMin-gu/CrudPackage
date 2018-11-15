package saas.crud.crm.cm.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDaoImpl implements CommonDao {
	
	@Autowired
	private SqlSession session;

	// 회원명 팝업 총자료수(페이징용)
	@Override
	public int totalcntUser(Map<String, Object> searchVal) {
		int totalCnt = session.selectOne("common.totalcntUser", searchVal);
		return totalCnt;
	}	
	//회원명 팝업 리스트 
	@Override
	public List<Map<String, Object>> popUserList(Map<String, Object> searchVal) {
		List<Map<String, Object>> userList = new ArrayList<Map<String, Object>>();
		userList = session.selectList("common.popUserList",searchVal);
		return userList;
	}

	//거래처 팝업 총자료수(페이징용)
	@Override
	public int totalcntClient(Map<String, Object> searchVal) {
		int totalCnt = session.selectOne("common.totalcntClient", searchVal);
		return totalCnt;
	}
	//거래처명 팝업 리스트 
	@Override
	public List<Map<String, Object>> popClientList(Map<String, Object> searchVal) {
		List<Map<String, Object>> clientList = new ArrayList<Map<String, Object>>();
		clientList = session.selectList("common.popClientList",searchVal);
		return clientList;
	}

}
