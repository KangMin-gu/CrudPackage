package saas.crud.crm.cp.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.PagingCommon;
import saas.crud.crm.ce.SearchRequest;
import saas.crud.crm.cp.dao.CampaignDao;
import saas.crud.crm.cp.dto.CampaignDto;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignDao campaignDao;
	
	//캠페인 List
	@Override
	public ModelAndView campList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		
		SearchRequest searchRequest = new SearchRequest();
		
		Map<String, Object> search = searchRequest.Search(request);

		int totalRows = campaignDao.campTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> campList = campaignDao.campList(search);
		
		mView.addObject("camp",campList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	//캠페인 Insert
	@Override
	public int campInsert(HttpServletRequest request, CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		campaignDto.setReguser(userNo);
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		
		int campNo = campaignDao.campInsert(campaignDto);
		return campNo;
	}

	// 캠페인 Read
	@Override
	public ModelAndView campRead(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setCampno(campNo);
		campaignDto.setSiteid(siteId);
		
		Map<String,Object> campInfo = campaignDao.campRead(campaignDto);
		mView.addObject("campInfo",campInfo);
		
		return mView;
	}

	@Override
	public void campUpdate(HttpServletRequest request, CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		campaignDao.campUpdate(campaignDto);
		
	}

	@Override
	public void campDelete(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		campaignDto.setCampno(campNo);
		
		campaignDao.campDelete(campaignDto);
		
	}
	// 캠페인 멀티삭제
	@Override
	public void campMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		String sCheck[] = request.getParameterValues("campno");
		
		
		
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			int campNo = Integer.parseInt(sCheck[i]);
			campaignDto.setCampno(campNo);
			campaignDao.campDelete(campaignDto);
		}
	}

	//캠페인 타겟 추출
	@Override
	public void campTargetInsert(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		int campNo = Integer.parseInt(request.getParameter("campno").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		Map<String,Object> param = new HashMap();
		
		Enumeration params = request.getParameterNames();
		param.put("campno", campNo);
		param.put("userno", userNo);
		param.put("siteid", siteId);
		int order = campaignDao.campTargetHistCount(param);
		
		param.put("order", order+1);
		
		if(order > 0) {
			campaignDao.campTargetDelete(param);
		}
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value != "") {
				if(!name.equals("campno"))
					param.put("name", name);
					param.put("value", value);
					param.put(name, value);
					campaignDao.campTargetInsert(param);
					campaignDao.campTargetHistInsert(param);
			}
		}
		campaignDao.campTargetCustInsert(param);
	}
}
