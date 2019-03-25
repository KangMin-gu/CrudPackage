package saas.crud.crm.rp.dao;

import java.util.List;
import java.util.Map;

public interface ReportDao {
	
	public List<Map<String,Object>> vcReportList(Map<String,Object> param);

}
