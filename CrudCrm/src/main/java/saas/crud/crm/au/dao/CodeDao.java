package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.CodeDto;

public interface CodeDao {
	
	public List<Map<String,Object>> codeList(Map<String,Object > search);
	
	public int codeTotalRow(Map<String,Object> search);
	
	public Map<String,Object> codeRead(int codeNo);
	
	public int codeInsert(CodeDto codeDto);
	
	public void codeUpdate(CodeDto codeDto);
	
	public void codeDelete(int codeNo);

}
