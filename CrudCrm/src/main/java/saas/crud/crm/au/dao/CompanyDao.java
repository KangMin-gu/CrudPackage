package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.UserDto;

public interface CompanyDao {
	
	public List<Map<String,Object>> companyList (Map<String,Object> search); 
	public Map<String,Object> companyRead(CompanyDto CompanyDto);
	public void companyUpdate(CompanyDto CompanyDto);
	public int companyInsert(CompanyDto CompanyDto);
	public int companyTotalRows(Map<String,Object> search);
	public void companyDelete(CompanyDto CompanyDto);
	public void companyLicenseInsert(Map<String,Object> data);
	public void companyAdminInsert(CompanyDto companyDto);
	public void adminPwdReset(Map<String, Object> sendPwdInfo);
}
