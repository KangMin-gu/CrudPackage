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

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.cp.dao.CampaignDao;
import saas.crud.crm.cp.dto.CampaignContentsDto;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignDao campaignDao;
	
	@Autowired
	private CrudEngine crud;
	
	//캠페인 List
	@Override
	public ModelAndView campList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);

		int totalRows = campaignDao.campTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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
		
		Map<String,Object> campForm = campaignDao.campFormRead(campaignDto);
		List<Map<String,Object>> targetList = campaignDao.campTargetRead(campaignDto);
		String name;
		String value;
		int targetListSize = targetList.size();
		for(int i = 0; i<targetListSize;i++) {
			
			name = targetList.get(i).get("NAME").toString().toUpperCase();
			value = targetList.get(i).get("VALUE").toString();
			campInfo.put(name, value);
			
		}	
		
		int targetCustCnt = campaignDao.campTargetCustCnt(campaignDto);

		mView.addObject("campInfo", campInfo);
		mView.addObject("targetCustCnt", targetCustCnt);
		mView.addObject("campForm", campForm);
		
		return mView;
	}
	//캠페인 수정
	@Override
	public void campUpdate(HttpServletRequest request, CampaignDto campaignDto) {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		campaignDao.campUpdate(campaignDto);
		
	}
	// 캠페인 단일 삭제
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
	public void campTargetInsert(HttpServletRequest request,int campNo) {
		// TODO Auto-generated method stub
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		Map<String,Object> param = new HashMap();
		
		int campStep = Integer.parseInt(request.getParameter("campstep"));
		
		CampaignDto campaignDto = new CampaignDto();
		campaignDto.setSiteid(siteId);
		campaignDto.setEdtuser(userNo);
		campaignDto.setCampno(campNo);
		campaignDto.setCampstep(campStep);
		
		Enumeration params = request.getParameterNames();
		param.put("campno", campNo);
		param.put("userno", userNo);
		param.put("siteid", siteId);
		int order = campaignDao.targetOrderMax(param);
		
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
		campaignDao.campTargetCustDelete(param);
		campaignDao.campTargetCustInsert(param);
		
		campaignDao.campStepUpdate(campaignDto);
	}

	@Override
	public int campFormInsertUpdate(HttpServletRequest request, CampaignFormDto campaignFormDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		campaignFormDto.setSiteid(siteId);
		campaignFormDto.setReguser(userNo);
		campaignFormDto.setEdtuser(userNo);
		
		int campNo = campaignFormDto.getCampno();
		int no = campaignFormDto.getNo();
		
		if(no != 0) {
			campaignDao.campFormUpdate(campaignFormDto);
		}else {
			campaignDao.campFormInsert(campaignFormDto);
		}
		CampaignDto campaignDto = new CampaignDto();
		int campStep = Integer.parseInt(request.getParameter("campstep"));
		campaignDto.setSiteid(siteId);
		campaignDto.setEdtuser(userNo);
		campaignDto.setCampno(campNo);
		campaignDto.setCampstep(campStep);
		campaignDao.campStepUpdate(campaignDto);
		return campNo;
	}

	@Override
	public void campTestSend(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Map<String, Object> search = crud.searchParam(request);
		search.put("userno",userNo);
		
		campaignDao.campTestSend(search);

	}

	@Override
	public ModelAndView campContentsList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);

		int totalRows = campaignDao.campContentsTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> campContentsList = campaignDao.campContentsList(search);
		
		mView.addObject("contents",campContentsList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	@Override
	public int campContentsInsert(HttpServletRequest request,CampaignContentsDto campaignContentsDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		
		campaignContentsDto.setSiteid(siteId);
		campaignContentsDto.setReguser(userNo);
		campaignContentsDto.setEdtuser(userNo);
		
		int no = campaignDao.campContentsInsert(campaignContentsDto);
		return no;
	}

	@Override
	public ModelAndView campContentsRead(HttpServletRequest request, int no) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		CampaignContentsDto campaignContentsDto = new CampaignContentsDto();
		
		campaignContentsDto.setNo(no);
		campaignContentsDto.setSiteid(siteId);
		
		Map<String,Object> contentsInfo = campaignDao.campContentsRead(campaignContentsDto);
		mView.addObject("contentsInfo",contentsInfo);
		
		return mView;
	}

	@Override
	public void campContentsUpdate(HttpServletRequest request, CampaignContentsDto campaignContentsDto) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		campaignContentsDto.setSiteid(siteId);
		campaignContentsDto.setEdtuser(userNo);
		
		campaignDao.campContentsUpdate(campaignContentsDto);
		
	}

	@Override
	public void campContentsDelete(HttpServletRequest request, int no) {
		// TODO Auto-generated method stub
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		CampaignContentsDto campaignContentsDto = new CampaignContentsDto();
		campaignContentsDto.setSiteid(siteId);
		campaignContentsDto.setEdtuser(userNo);
		campaignContentsDto.setNo(no);
		
		campaignDao.campContentsDelete(campaignContentsDto);
		
	}

	@Override
	public void campContentesMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String sCheck[] = request.getParameterValues("no");
		
		CampaignContentsDto campaignContentsDto = new CampaignContentsDto();
		campaignContentsDto.setSiteid(siteId);
		campaignContentsDto.setEdtuser(userNo);
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			int no = Integer.parseInt(sCheck[i]);
			campaignContentsDto.setNo(no);
			campaignDao.campContentsDelete(campaignContentsDto);
		}
	}

	@Override
	public void campSend(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("userno", userNo);
		param.put("siteid", siteId);
		param.put("campno", campNo);
		
		campaignDao.campSend(param);
		
	}

	@Override
	public List<Map<String, Object>> campTabTargetHistory(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		Map<String,Object> param = new HashMap<>();
		
		param.put("siteid", siteId);
		param.put("campno", campNo);
		
		List<Map<String,Object>> tabHistory = campaignDao.campTabTargetHistory(param);
		
		int listSize = tabHistory.size();
		
		Map<String,Object> tempMap = new HashMap<>();
		
		StringBuffer sb = new StringBuffer();
		List<Map<String,Object>> history = new ArrayList<Map<String,Object>>();
		int maxOrder = campaignDao.targetOrderMax(param);
		int campOrder;
		String name="";
		String regdate = "";
		String strHistory="";
		
		for(int j = 1; j<= maxOrder; j++) {
			for(int i = 0; i < listSize; i++) {
				tempMap = tabHistory.get(i);
				campOrder = Integer.parseInt(tempMap.get("CAMPORDER").toString());
				if(j==campOrder) {
					if(name.equals(tempMap.get("CODENAME").toString())) {
						sb.append(tempMap.get("VALUE"));
						sb.append("|");
						regdate = tempMap.get("REGDATE").toString();
					}else {
						sb.append(tempMap.get("CODENAME"));
						sb.append("-");
						sb.append(tempMap.get("VALUE"));
						sb.append("|");
						name = tempMap.get("CODENAME").toString();
						
					}
				}
			}
			Map<String,Object> input = new HashMap<>();
			strHistory = sb.toString();
			input.put("regdate", regdate);
			input.put("history", strHistory);
			history.add(j-1, input);
			sb.delete(0,sb.toString().length());
			
		}
		
		return history;
	}

	@Override
	public Map<String, Object> campTabTargetCustList(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		Map<String, Object> search = crud.searchParam(request);
		search.put("campno",campNo);
		int totalTargetCustRows = campaignDao.campTargetCustRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 20;
		
		Map<String, Integer> page = crud.paging(request, totalTargetCustRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> campaignTargetCustList = campaignDao.campTargetCustList(search);
		
		Map<String,Object> total = new HashMap<>();
		total.put("tabCust",campaignTargetCustList);
		total.put("page",page);
		total.put("search",search);
		total.put("totalRows",totalTargetCustRows);
		return total;
	}

	@Override
	public List<Map<String, Object>> campTargetRead(HttpServletRequest request, int campNo) {
		// TODO Auto-generated method stub
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setCampno(campNo);
		campaignDto.setSiteid(siteId);
		List<Map<String,Object>> targetList = campaignDao.campTargetRead(campaignDto);
		return targetList;
	}
	

}
