package saas.crud.crm.sv.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RcvDto;

@Repository
public class SvDaoImpl implements SvDao{

	@Autowired
	private SqlSession session;
	
	// 서비스 List 검색
	@Override
	public List<Map<String, Object>> svList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("sv.list",search);
	}

	// 서비스 통합 숫자
	@Override
	public int svTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("sv.totalRows",search);
	}

	// 서비스 상세 정보
	@Override
	public Map<String, Object> svRead(RcvDto svDto) {
		// TODO Auto-generated method stub
		return session.selectOne("sv.detail",svDto);
	}

	// 서비스 추가
	@Override
	public int svInsert(RcvDto rcvDto) {
		// TODO Auto-generated method stub
		
		session.insert("sv.rcvinsert",rcvDto);
		int rcvNo = rcvDto.getRcvno();
		return rcvNo;
	}
	
	// 서비스 전체 Update( 서비스 + 처리)
	@Override
	public void svTotalUpdate(Map<String, Object> data) {
		// TODO Auto-generated method stub
		session.update("sv.totalUpdate",data);
	}

	// 서비스 Update ( 서비스만)
	@Override
	public void svUpdate(Map<String,Object> data) {
		// TODO Auto-generated method stub
		session.update("sv.update",data);
	}
	// 상태값 처리 접수 -> 처리 -> 이관 등등
	@Override
	public void svPrcState(Map<String, Object> data) {
		// TODO Auto-generated method stub
		session.update("sv.prcUpdate",data);
	}

	// 서비스 단일 삭제
	@Override
	public void svDelete(RcvDto svDto) {
		// TODO Auto-generated method stub
		session.update("sv.delete",svDto);
	}

	// 서비스 처리내역 추가
	@Override
	public void svRactInsert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		
		session.insert("sv.ractinsert",data);
	}

	// 서비스 처리이력 탭
	@Override
	public List<Map<String, Object>> svTabRact(RactDto ractDto) {
		// TODO Auto-generated method stub
		
		return session.selectList("sv.tabRact",ractDto);
	}

	// 서비스 이관 이력
	@Override
	public List<Map<String, Object>> conveyTabList(ConveyDto conveyDto) {
		// TODO Auto-generated method stub
		return session.selectList("sv.tabConvey",conveyDto);
	}

	// 이관 추가
	@Override
	public void conveyInsert(ConveyDto conveyDto) {
		// TODO Auto-generated method stub
		session.insert("sv.conveyInsert",conveyDto);
	}

	



}
