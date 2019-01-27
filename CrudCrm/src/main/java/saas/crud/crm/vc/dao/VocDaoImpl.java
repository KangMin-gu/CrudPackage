package saas.crud.crm.vc.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.home.controller.HomeController;

@Repository
public class VocDaoImpl implements VocDao{
	
	private static final Logger logger = LoggerFactory.getLogger(VocDaoImpl.class);
	
	@Autowired
	private SqlSession session;

	@Override
	public int vocInsert(Map<String, Object> param) {
		int cnt = session.insert("vc.insert",param);
		return cnt;
	}

	@Override
	public void vocGoodsInsert(Map<String, Object> param) {
		session.insert("vc.goodsInsert",param);
	}
	
	//VOC 좌측 탭 - email 리스트 카운트 
	@Override
	public int emailListCnt(Map<String, Object> param) {
		int res = session.selectOne("sv.emailListCnt",param);
		return res;
	}
	//VOC 좌측 탭 - email 리스트 
	@Override
	public List<Map<String, Object>> emailList(Map<String, Object> param) {
		List<Map<String,Object>> emailList = session.selectList("sv.emailList",param);		
		return emailList;
	}

	//VOC 좌측 탭 - email 상세
	@Override
	public Map<String, Object> vocEmailDetail(Map<String, Object> param) {
		Map<String,Object> emailMap = session.selectOne("sv.vocEmailDetail",param);
		return emailMap;
	}
	
}
