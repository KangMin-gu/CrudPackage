package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.UserDto;

public interface UserService {
	
	public ModelAndView login(HttpServletRequest request, UserDto urDto);
	
}
