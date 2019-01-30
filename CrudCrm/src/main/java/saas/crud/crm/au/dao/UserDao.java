package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;


public interface UserDao {
	public Map<String, Object> getData(String userId);
	public List<Map<String,String>> getMenu(String userId); 
	public void userHistory(Map<String,Object> param);
	public List<Map<String, Object>> crudNotice();
	public Map<String, Object> useInfo(String userId);
	public Map<String, Object> userInfo(int userNo);
}
