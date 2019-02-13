package saas.crud.crm.au.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.ContentDao;
import saas.crud.crm.au.dto.ContentDto;
import saas.crud.crm.ce.CrudEngine;


@Service
public class ContentServiceImpl implements ContentService {
	
	@Autowired
	private CrudEngine crud;
	
	@Autowired
	private ContentDao contentDao;
	
	
	// 캠페인 양식 list
		@Override
		public ModelAndView contentList(HttpServletRequest request) {
			
			ModelAndView mView = new ModelAndView();
			
			Map<String, Object> search = crud.searchParam(request);

			int totalRows = contentDao.contentTotalRows(search);
			
			int PAGE_ROW_COUNT = 10;
			int PAGE_DISPLAY_COUNT = 5;
			
			Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
			int startRowNum = page.get("startRowNum");
			int endRowNum = page.get("endRowNum");
			
			search.put("startRowNum", startRowNum);
			search.put("endRowNum", endRowNum);
			
			List<Map<String,Object>> contentsList = contentDao.contentList(search);
			
			mView.addObject("contents",contentsList);
			mView.addObject("search",search);
			mView.addObject("page",page);
			mView.addObject("totalRows",totalRows);
			
			return mView;
		}

		// 캠페인 양식 Insert
		@Override
		public int contentInsert(HttpServletRequest request,ContentDto contentDto) {
			
			int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			
			
			contentDto.setSiteid(siteId);
			contentDto.setReguser(userNo);
			contentDto.setEdtuser(userNo);
			
			int contentNo = contentDao.contentInsert(contentDto);
			return contentNo;
		}

		// 캠페인 양식 Read
		@Override
		public ModelAndView contentRead(HttpServletRequest request, int contentNo) {
			
			
			ModelAndView mView = new ModelAndView();
			int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			ContentDto contentDto = new ContentDto();
			
			contentDto.setContentno(contentNo);
			contentDto.setSiteid(siteId);
			
			Map<String,Object> contentInfo = contentDao.contentRead(contentDto);
			mView.addObject("contentInfo",contentInfo);
			
			return mView;
		}

		//캠페인 양식 Update
		@Override
		public void contentUpdate(HttpServletRequest request, ContentDto contentDto) {
			
			int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			
			contentDto.setSiteid(siteId);
			contentDto.setEdtuser(userNo);
			
			contentDao.contentUpdate(contentDto);
			
		}

		// 캠페인 양식 삭제
		@Override
		public void contentDelete(HttpServletRequest request, int contentNo) {
			
			
			int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			
			ContentDto contentDto = new ContentDto();
			contentDto.setSiteid(siteId);
			contentDto.setEdtuser(userNo);
			contentDto.setContentno(contentNo);
			
			contentDao.contentDelete(contentDto);
			
		}

		// 캠페인 양식 멀티 삭제
		@Override
		public void contentMultiDelete(HttpServletRequest request) {
			
			int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
			int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			String sCheck[] = request.getParameterValues("no");
			
			ContentDto contentDto = new ContentDto();
			contentDto.setSiteid(siteId);
			contentDto.setEdtuser(userNo);
			
			int length = sCheck.length;
			
			for(int i = 0; i < length; i++) {
				int contentNo = Integer.parseInt(sCheck[i]);
				contentDto.setContentno(contentNo);
				contentDao.contentDelete(contentDto);
			}
		}

	

}
