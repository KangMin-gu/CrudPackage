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
	SqlSession session;
	
	@Override
	public List<Map<String, Object>> svList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("sv.list",search);
	}

	@Override
	public int svTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("sv.totalRows",search);
	}

	@Override
	public Map<String, Object> svRead(RcvDto svDto) {
		// TODO Auto-generated method stub
		return session.selectOne("sv.detail",svDto);
	}

	@Override
	public int svInsert(RcvDto rcvDto) {
		// TODO Auto-generated method stub
		
		session.insert("sv.rcvinsert",rcvDto);
		int rcvNo = rcvDto.getRcvno();
		return rcvNo;
	}
	
	@Override
	public void svTotalUpdate(Map<String, Object> data) {
		// TODO Auto-generated method stub
		session.update("sv.totalUpdate",data);
	}

	@Override
	public void svUpdate(Map<String,Object> data) {
		// TODO Auto-generated method stub
		session.update("sv.update",data);
	}

	@Override
	public void svDelete(RcvDto svDto) {
		// TODO Auto-generated method stub
		session.update("sv.delete",svDto);
	}

	@Override
	public void svRactInsert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		
		session.insert("sv.ractinsert",data);
	}

	@Override
	public List<Map<String, Object>> svTabRact(RactDto ractDto) {
		// TODO Auto-generated method stub
		
		return session.selectList("sv.tabRact",ractDto);
	}

	@Override
	public List<Map<String, Object>> conveyTabList(ConveyDto conveyDto) {
		// TODO Auto-generated method stub
		return session.selectList("sv.tabConvey",conveyDto);
	}

	@Override
	public void conveyInsert(ConveyDto conveyDto) {
		// TODO Auto-generated method stub
		session.insert("sv.conveyInsert",conveyDto);
	}



}
