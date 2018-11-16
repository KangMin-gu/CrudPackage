package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.LicenseDto;

public interface LicenseDao {
	
	public List<Map<String,Object>> licenseList(Map<String,Object> search);
	public int licenseTotalRow(Map<String,Object> search);
	public Map<String,Object> licenseDetail(int licenseno);
	public int licenseInsert(LicenseDto licenseDto);
	public void licenseUpdate(LicenseDto licenseDto);
	public void licenseDelete(LicenseDto licenseDto);
	
	public List<Map<String,Object>> licenseTopList(int siteid);
	public List<Map<String,Object>> licenseMenuList();

}
