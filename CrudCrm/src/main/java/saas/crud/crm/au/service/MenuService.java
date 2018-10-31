package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.MenuDto;

public interface MenuService {
	
	public ModelAndView menuList(HttpServletRequest request);
	public ModelAndView menuRead(HttpServletRequest request, int menuno);
	public int menuInsert(HttpServletRequest request, MenuDto menuDto); 
	public void menuUpdate(HttpServletRequest request, MenuDto menuDto);
	public void menuDelete(HttpServletRequest request, int menuno);
	public void menuMultiDelete(HttpServletRequest request);
}
