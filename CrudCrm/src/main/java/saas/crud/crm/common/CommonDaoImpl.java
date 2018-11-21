package saas.crud.crm.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.ce.FileDto;
import saas.crud.crm.vc.dao.VocDaoImpl;

@Repository
public class CommonDaoImpl implements CommonDao{
	
	private static final Logger logger = LoggerFactory.getLogger(VocDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	//파일등록
	@Override
	public void fileUpload(FileDto fileInfo) {
		String sub = fileInfo.getSub();
		int fileSearchKey = 0;
		
		if(sub.equals("logo")) {
			
		}else if(sub.equals("note")){
			session.insert("common.noteFile", fileInfo);			
		}else if(sub.equals("campaign")){
			
		}		
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
	public FileDto noteDownload(FileDto fileRequest) {
		FileDto fileInfo = session.selectOne("common.noteDownload", fileRequest);
		return fileInfo;
	}

	@Override
	public int totalCntCust(Map<String, Object> searchVal) {
		// TODO Auto-generated method stub
		int totalCnt = session.selectOne("common.totalCntCust", searchVal);
		return totalCnt;
	}

	@Override
	public List<Map<String, Object>> popCustList(Map<String, Object> searchVal) {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> custList = session.selectList("common.popCustList",searchVal);
		return custList;
	}

}
