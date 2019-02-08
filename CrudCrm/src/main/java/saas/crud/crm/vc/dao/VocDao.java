package saas.crud.crm.vc.dao;

import java.util.Map;
import java.util.List;

public interface VocDao {
	
	public int vocInsert(Map<String,Object> param);
	
	public void vocGoodsInsert(Map<String,Object> param);
	
	public int emailListCnt(Map<String,Object> param);
	public List<Map<String,Object>> emailList(Map<String,Object> param);
	public Map<String,Object> vocEmailDetail(Map<String,Object> param);
	public int vocBlackCustInsert(Map<String,Object> blackInsMap);
	public int vocBlackCustDelete(Map<String,Object> param);
	
	public int vocCallBackInsert(Map<String,Object> calbackMap);
	
}
