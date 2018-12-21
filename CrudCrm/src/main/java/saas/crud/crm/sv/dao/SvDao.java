package saas.crud.crm.sv.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RcvDto;

public interface SvDao {
	
	public List<Map<String,Object>> svList(Map<String,Object> search);
	
	public int svTotalRows(Map<String,Object> search);
	
	public Map<String,Object> svRead(RcvDto svDto);
	
	public int svInsert(RcvDto rcvDto);
	
	public void svRactInsert(Map<String,Object> data);
	
	public void svUpdate(Map<String,Object> data);
	
	public void svPrcState(Map<String,Object> data);
	
	public void svTotalUpdate(Map<String,Object> data);
	
	public void svDelete(RcvDto svDto);
	
	public List<Map<String, Object>> svTabRact(RactDto ractDto);

	public List<Map<String, Object>> conveyTabList(ConveyDto conveyDto);
	
	public void conveyInsert(ConveyDto conveyDto);
}
