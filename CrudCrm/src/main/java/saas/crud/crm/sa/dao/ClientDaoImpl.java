package saas.crud.crm.sa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.sa.dto.ClientDto;

@Repository
public class ClientDaoImpl implements ClientDao{
	
	@Autowired 
	private SqlSession session;
	//거래처목록 카운팅
		@Override
		public int cliListCount(Map<String,Object> searchVal) {
			int totalCnt = session.selectOne("client.cliListCount",searchVal);
			return totalCnt;
		}
		//거래처목록
		@Override
		public List<Map<String, Object>> clientList(Map<String,Object> searchVal) {
			List<Map<String,Object>> cliList = session.selectList("client.clientList",searchVal);
			return cliList;
		}
		//거래처 상세
		@Override
		public Map<String, Object> clientDetail(Map<String, Object> prm) {
			Map<String,Object> cliDetail = session.selectOne("client.clientDetail",prm);
			return cliDetail;
		}
		
		
		
		
		
		//거래처 추가
		@Override
		public int clientInsert(ClientDto clientDto) {
			session.insert("client.clientInsert",clientDto);
			int cliNo = clientDto.getClino();
			return cliNo;
		}

		//거래처 수정
		@Override
		public int clientUpdate(ClientDto clientDto) {
			session.update("client.clientUpdate",clientDto);
			int cliNo = clientDto.getClino();
			return cliNo;
		}
		@Override
		public int cliDelete(ClientDto clientDto) {
			int res = session.update("client.cliDelete",clientDto);
			return res;
		}
		@Override
		public int cliCustListCnt(Map<String, Object> searchVal) {
			int res = session.selectOne("client.cliCustListCnt",searchVal);
			return res;
		}
		//거래처 상세 - 관련고객 리스트
		@Override
		public List<Map<String, Object>> cliCustList(Map<String, Object> prm) {
			List<Map<String, Object>> cliCustList = session.selectList("client.cliCustList",prm);
			return cliCustList;
		}
	
		
}
