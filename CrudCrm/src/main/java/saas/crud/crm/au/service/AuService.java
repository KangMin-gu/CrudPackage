package saas.crud.crm.au.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;

public interface AuService {
	public ModelAndView userList(HttpServletRequest request);	
	public ModelAndView userRead(HttpServletRequest request, int userNo);	
	public int userInsert(HttpServletRequest reuqest, UserDto userDto);	
	public void userUpdate(HttpServletRequest request, UserDto userDto);	
	public void userDelete(HttpServletRequest request, int userNo);
	public void userMultiDelete(HttpServletRequest request);
	public int userIdCheck(String userId);	
	public List<Map<String,Object>> userTopList(int siteid);	
	public void userMenuInsert(HttpServletRequest request,UserMenuDto userMenuDto);
	public ModelAndView myInfoReadSet(HttpServletRequest request, UserDto userDto);
	public ModelAndView userPwdReset(HttpServletRequest request, int userNo);
	public ModelAndView useSessionList(HttpServletRequest reuqest, HttpServletResponse response);
	public ModelAndView authSession(HttpServletRequest request, String userId);
}
