package saas.crud.crm.sv.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.sv.dto.SvDto;

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
	public Map<String, Object> svRead(SvDto svDto) {
		// TODO Auto-generated method stub
		return session.selectOne("sv.detail",svDto);
	}

	@Override
	public int svInsert(SvDto svDto) {
		// TODO Auto-generated method stub
		session.insert("sv.insert",svDto);
		int serviceNo = svDto.getServiceno();
		
		return serviceNo;
	}

	@Override
	public void svUpdate(SvDto svDto) {
		// TODO Auto-generated method stub
		session.update("sv.update",svDto);
		
	}

	@Override
	public void svDelete(SvDto svDto) {
		// TODO Auto-generated method stub
		session.update("sv.delete",svDto);
	}

}
