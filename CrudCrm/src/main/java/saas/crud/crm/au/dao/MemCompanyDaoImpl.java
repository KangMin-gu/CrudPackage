package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.MemCompanyDto;

@Repository
public class MemCompanyDaoImpl implements MemCompanyDao{

	@Autowired
	
	SqlSession session;
	@Override
	public List<Map<String, Object>> memCompanyList(Map<String,Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("memCompany.list", search);
	}
	@Override
	public Map<String, Object> memCompanyRead(MemCompanyDto memCompanyDto) {
		// TODO Auto-generated method stub
		return session.selectOne("memCompany.detail",memCompanyDto);
	}
	@Override
	public void memCompanyUpdate(MemCompanyDto memCompanyDto) {
		// TODO Auto-generated method stub
		session.update("memCompany.update",memCompanyDto);
	}
	@Override
	public int memCompanyInsert(MemCompanyDto memCompanyDto) {
		// TODO Auto-generated method stub
		session.insert("memCompany.insert",memCompanyDto);
		int siteid = memCompanyDto.getSiteid();
		return siteid;
	}
	@Override
	public int memCompanyTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("memCompany.totalRow",search);
	}
	@Override
	public void memCompanyDelete(MemCompanyDto memCompanyDto) {
		// TODO Auto-generated method stub
		session.update("memCompany.delete",memCompanyDto);
		
	}
	
	

}
