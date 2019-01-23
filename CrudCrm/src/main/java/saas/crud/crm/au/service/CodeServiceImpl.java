package saas.crud.crm.au.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.CodeDao;
import saas.crud.crm.au.dto.CodeDto;
import saas.crud.crm.ce.CrudEngine;


@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	private CodeDao codeDao;
	@Autowired
	private CrudEngine crud;
	
	// 코드 List 검색
	@Override
	public ModelAndView codeList(HttpServletRequest request) {
		Map<String, Object> search = crud.searchParam(request);
		
		int totalRows = codeDao.codeTotalRow(search);
		
		int PAGE_ROW_COUNT = 10;
		int PAGE_DISPLAY_COUNT = 5;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		ModelAndView mView = new ModelAndView();
		List<Map<String,Object>> CodeList = codeDao.codeList(search);
		mView.addObject("codeList",CodeList);
		mView.addObject("page",page);
		mView.addObject("search",search);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	// 코드 상제 정보
	@Override
	public Map<String, Object> codeRead(HttpServletRequest request, int codeNo) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CodeDto codeDto = new CodeDto();
		codeDto.setSiteid(siteId);
		codeDto.setCodeno(codeNo);
		
		Map<String,Object> codeInfo = codeDao.codeRead(codeDto);
		
		
		return codeInfo;
	}

	// 코드 수정
	@Override
	public void codeUpdate(HttpServletRequest request, CodeDto codeDto) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		codeDto.setEdtuser(userNo);
		codeDto.setSiteid(siteId);
		
		codeDao.codeUpdate(codeDto);
	}

	// 코드 단일 삭제
	@Override
	public void codeDelete(HttpServletRequest request, int codeNo) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CodeDto codeDto = new CodeDto();
		codeDto.setEdtuser(userNo);
		codeDto.setSiteid(siteId);
		codeDto.setCodeno(codeNo);
		
		codeDao.codeDelete(codeDto);
	}

	// 코드 추가
	@Override
	public int codeInsert(HttpServletRequest request, CodeDto codeDto) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		codeDto.setReguser(userNo);
		codeDto.setEdtuser(userNo);
		codeDto.setSiteid(siteId);
		
		int codeNo = codeDao.codeInsert(codeDto);
		return codeNo;
	}

	// 상위 코드 검색
	@Override
	public ModelAndView codeUpperList(HttpServletRequest request) {
		Map<String, Object> search = crud.searchParam(request);
		
		int totalRows = codeDao.codeTotalRow(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);		
		ModelAndView mView = new ModelAndView();
		List<Map<String,Object>> CodeList = codeDao.upperCodeList(search);
		mView.addObject("codeList",CodeList);
		mView.addObject("page",page);
		mView.addObject("search",search);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}
	

	@Cacheable("code")
	@Override
	public Map<String, Object> getCode() {
		Map<String,Object> map = new HashMap<String,Object>(); 
		List<CodeDto> grpCodeList = codeDao.grpCodeList();
		
		int grpCodeSize = grpCodeList.size();
		String grpCode ="";
		for(int i = 0; i <grpCodeSize ; i++) {
			grpCode = grpCodeList.get(i).getCodegrp();
			map.put(grpCode,codeDao.getCodeList(grpCode));
		}
		return map;
	}

	@Override
	public List<CodeDto> getUpperCodeGrp(HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		String codeVal = request.getParameter("codeval").toString();
		String codeGrp = request.getParameter("codegrp").toString().toUpperCase();
		
		
		CodeDto codeDto = new CodeDto();
		codeDto.setSiteid(siteId);
		codeDto.setCodeval(codeVal);
		codeDto.setCodegrp(codeGrp);
		
		int getCodeNo = codeDao.getCodeNo(codeDto);
		
		codeDto.setUppercodegrp(getCodeNo);
		
		List<CodeDto> getUpperCodeGrp = codeDao.getUpperCodeGrp(codeDto);
		return getUpperCodeGrp;
	}
}
