package saas.crud.crm.au.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.ContentDto;

public interface ContentService {
	
	public ModelAndView contentList(HttpServletRequest request);
	
	public int contentInsert(HttpServletRequest request, ContentDto contentDto);
	
	public ModelAndView contentRead(HttpServletRequest request, int contentNo);
	
	public void contentUpdate(HttpServletRequest request, ContentDto contentDto);
	
	public void contentDelete(HttpServletRequest request, int contentNo);
	
	public void contentMultiDelete(HttpServletRequest request);

}
