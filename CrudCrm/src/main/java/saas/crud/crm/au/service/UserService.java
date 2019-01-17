package saas.crud.crm.au.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.UserDto;

public interface UserService {
	
	public ModelAndView login(HttpServletResponse response, HttpServletRequest request, UserDto urDto);
	public ModelAndView crudNotice(HttpServletRequest request);
	
}
