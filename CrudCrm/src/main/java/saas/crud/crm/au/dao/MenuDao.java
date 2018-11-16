package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import saas.crud.crm.au.dto.MenuDto;

public interface MenuDao {
	
	public List<Map<String, Object>> menuList (Map<String,Object> search);
	public int menuTotalRows(Map<String,Object> search);
	public Map<String,Object> menuRead(int menuno);
	public int menuInsert(MenuDto menuDto);
	public void menuUpdate(MenuDto menuDto);
	public void menuDelete(MenuDto menuDto);

}
