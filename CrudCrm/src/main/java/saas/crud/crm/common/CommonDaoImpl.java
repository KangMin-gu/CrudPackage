package saas.crud.crm.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.ce.EUploadDto;
import saas.crud.crm.vc.dao.VocDaoImpl;

@Repository
public class CommonDaoImpl implements CommonDao{
	
	private static final Logger logger = LoggerFactory.getLogger(VocDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	//파일등록
	@Override
	public void fileUpload(EUploadDto fileInfo) {
		session.insert("common.noteFile", fileInfo);					
	}
	
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
	
	//다운로드
	@Override
	public EUploadDto noteDownload(EUploadDto fileRequest) {
		EUploadDto fileInfo = session.selectOne("common.noteDownload", fileRequest);
		return fileInfo;
	}

	@Override
	public int totalCntCust(Map<String, Object> searchVal) {
		int totalCnt = session.selectOne("common.totalCntCust", searchVal);
		return totalCnt;
	}

	@Override
	public List<Map<String, Object>> popCustList(Map<String, Object> searchVal) {
		List<Map<String, Object>> custList = session.selectList("common.popCustList",searchVal);
		return custList;
	}
	//영업 팝업-카운터
	@Override
	public int totalcntSales(Map<String, Object> searchVal) {
		int totalCnt = session.selectOne("common.totalcntSales", searchVal);
		return totalCnt;
	}
	//영업팝업-리스트
	@Override
	public List<Map<String, Object>> popSalesList(Map<String, Object> searchVal) {
		List<Map<String, Object>> salesList = new ArrayList<Map<String, Object>>();
		salesList = session.selectList("common.popSalesList",searchVal);
		return salesList;
	}

	@Override
	public void DirectSendSms(Map<String, Object> param) {
		session.insert("common.directSmsSend",param);
	}

	@Override
	public void DelaySendSms(Map<String, Object> param) {
		session.insert("common.delaySmsSend",param);
	}

	@Override
	public void DirectSendLms(Map<String, Object> param) {
		session.insert("common.directLmsSend",param);
	}

	@Override
	public void DelaySendLms(Map<String, Object> param) {
		session.insert("common.delayLmsSend",param);
	}
	
	@Override
	public void mailSend(Map<String,Object> param) {
		session.insert("common.mailSend",param);
	}

}
