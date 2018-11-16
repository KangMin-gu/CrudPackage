package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.CompanyDto;

public interface CompanyDao {
	
	public List<Map<String,Object>> companyList (Map<String,Object> search); 
	public Map<String,Object> companyRead(CompanyDto CompanyDto);
	public void companyUpdate(CompanyDto CompanyDto);
	public int companyInsert(CompanyDto CompanyDto);
	public int companyTotalRows(Map<String,Object> search);
	public void companyDelete(CompanyDto CompanyDto);
	
	public void companyLicenseInsert(Map<String,Object> data);

}
