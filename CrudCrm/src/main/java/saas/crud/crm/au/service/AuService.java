package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.UserDto;

public interface AuService {
	
	public ModelAndView userList(HttpServletRequest request);
	
	public ModelAndView userRead(HttpServletRequest request, int userNo);
	
	public int userInsert(HttpServletRequest reuqest, UserDto userDto);
	
	public void userUpdate(HttpServletRequest request, UserDto userDto);
	
	public void userDelete(HttpServletRequest request, int userNo);
	
	public void userMultiDelete(HttpServletRequest request);

	public int userIdCheck(String userId);
}
