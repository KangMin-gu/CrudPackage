package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.CompanyDto;

@Repository
public class CompanyDaoImpl implements CompanyDao{

	@Autowired
	
	SqlSession session;
	@Override
	public List<Map<String, Object>> companyList(Map<String,Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("company.list", search);
	}
	
	@Override
	public Map<String, Object> companyRead(CompanyDto CompanyDto) {
		// TODO Auto-generated method stub
		return session.selectOne("company.detail",CompanyDto);
	}
	@Override
	public void companyUpdate(CompanyDto CompanyDto) {
		// TODO Auto-generated method stub
		session.update("company.update",CompanyDto);
	}
	@Override
	public int companyInsert(CompanyDto CompanyDto) {
		// TODO Auto-generated method stub
		session.insert("company.insert",CompanyDto);
		int siteid = CompanyDto.getSiteid();
		return siteid;
	}
	@Override
	public int companyTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("company.totalRow",search);
	}
	@Override
	public void companyDelete(CompanyDto CompanyDto) {
		// TODO Auto-generated method stub
		session.update("company.delete",CompanyDto);
		
	}
	@Override
	public void companyLicenseInsert(Map<String, Object> data) {
		// TODO Auto-generated method stub
		session.insert("company.siteLicenseInsert",data);
		
	}
	
	

}
