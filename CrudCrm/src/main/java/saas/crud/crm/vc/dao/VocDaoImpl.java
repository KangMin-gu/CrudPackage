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
	
	//VOC 블랙 추가 
	@Override
	public int vocBlackCustInsert(Map<String,Object> blackInsMap){
		session.insert("sv.vocBlackCustInsert",blackInsMap);
		int bcustno = (int)blackInsMap.get("bcustno");
		return bcustno;
	}
	//VOC 블랙 삭제
	@Override
	public int vocBlackCustDelete(Map<String, Object> param) {
		int bcustno = session.update("sv.vocBlackCustDelete",param);
		return bcustno;
	}


	//VOC 콜백 리스트 카운터
	@Override
	public int vocCallBackListCnt(Map<String, Object> param) {
		int cnt = session.selectOne("sv.vocCallBackListCnt",param);
		return cnt;
	}
	//VOC 콜백 리스트 
	@Override
	public List<Map<String,Object>> vocCallBackList(Map<String, Object> param) {
		List<Map<String,Object>> callBackList = session.selectList("sv.vocCallBackList",param);
		return callBackList;
	}
	
	@Override
	public void vocCallBackInsert(Map<String,Object> param) {
		 session.insert("sv.vocCallBack",param);
	}
	 
	//VOC 콜백 상태 변경 (상담원)
	@Override
	public int vocCallBackUpdate(Map<String, Object> callbackPrm) {
		int res = session.update("sv.vocCallBackUpdate",callbackPrm);
		return res;
	}
	
	@Override
	public List<Map<String,Object>> vocCallBackList(Map<String,Object> param) {
		List<Map<String,Object>> callBackList = session.selectList("voc.callBackList",param);
		return callBackList;
	}
	@Override
	public int vocCallUserCnt(Map<String,Object> param) {
		int cnt = session.selectOne("voc.ctiUserCnt",param);
		return cnt;
	}
	@Override
	public void vocCallBackDiv(Map<String,Object> param) {
		session.update("voc.callBackUpdate",param);
	}

	@Override
	public int vocCallBackTotalRow(Map<String, Object> param) {
		int cnt = session.selectOne("voc.callBackTotalRow",param);
		return cnt;
	}
	
	@Override
	public int vocCallBackPassDiv(Map<String,Object> param) {
		int cnt = session.update("voc.callBackPassDiv",param);
		return cnt;
	}
}
