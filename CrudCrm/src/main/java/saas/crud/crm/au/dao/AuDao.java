package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.dto.NoticeDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;

public interface AuDao {
	
	
	public List<Map<String,Object>> urList(Map<String,Object> search);
	public int urTotalRows(Map<String,Object> search);
	public Map<String,Object> urRead(UserDto userDto);
	public int urInsert(UserDto userDto);
	public void urUpdate(UserDto userDto);
	public void urDelete(UserDto userDto);	
	public int urIdCheck(String userId);
	public List<Map<String,Object>> urTopList(int siteid);
	public List<Map<String,Object>> urMenuList(int siteid);
	public void urMenuInsert(UserMenuDto userMenuDto);
	public void urMenuDelete(UserMenuDto userMenuDto);
	public List<Map<String,Object>> urUserMenuList(UserDto userDto);
	public void userPwdResetsend(Map<String, Object> sendPwdInfo);
	public void userPwdReset(UserDto userDto);
	public List<Map<String,Object>> urAsOwner(int siteId);
	public int noticeTotalRows(Map<String, Object> noticeVal);
	public List<Map<String,Object>> notice(Map<String, Object> noticeVal);
	public Map<String,Object> noticeDetail(Map<String, Object> noticeVal);
	public int noticeInsert(NoticeDto noticeDto);
	public void noticeDelete(NoticeDto noticeDto);
	public void noticeUpdate(NoticeDto noticeDto);
}
