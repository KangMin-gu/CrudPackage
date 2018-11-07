package saas.crud.crm.sv.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.sv.dto.SvDto;

public interface SvDao {
	
	public List<Map<String,Object>> svList(Map<String,Object> search);
	
	public int svTotalRows(Map<String,Object> search);
	
	public Map<String,Object> svRead(SvDto svDto);
	
	public int svInsert(SvDto svDto);
	
	public void svUpdate(SvDto svDto);
	
	public void svDelete(SvDto svDto);

}
