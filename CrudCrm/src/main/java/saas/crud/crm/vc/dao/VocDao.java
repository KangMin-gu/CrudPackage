package saas.crud.crm.vc.dao;

import java.util.Map;
import java.util.List;

public interface VocDao {
	
	public int vocInsert(Map<String,Object> param);
	public void vocGoodsInsert(Map<String,Object> param);
	public int emailListCnt(Map<String,Object> param);
	public List<Map<String,Object>> emailList(Map<String,Object> param);
	public Map<String,Object> vocEmailDetail(Map<String,Object> param);
	public int vocBlackCustInsert(Map<String,Object> blackMap);
	public int vocBlackCustDelete(Map<String,Object> param);
	public void vocCallBackInsert(Map<String,Object> calbackMap);
	public int vocCallBackListCnt(Map<String,Object> param);
	public List<Map<String,Object>> vocCallBackList(Map<String,Object> param);	
	public int vocCallBackUpdate(Map<String,Object> callbackPrm);
	public int vocCallBackHistoryInsert(Map<String,Object> param);
	public int vocCallBackHistListCnt(Map<String,Object> param);
	public List<Map<String,Object>> vocCallBackHistList(Map<String,Object> param);
	public int vocBlackHistListCnt(Map<String,Object> param);
	public List<Map<String,Object>> vocBlackHistList(Map<String,Object> param);
}
