package saas.crud.crm.au.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.CodeDao;
import saas.crud.crm.au.dto.CodeDto;
import saas.crud.crm.ce.PagingCommon;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao codeDao;
	
	@Override
	public ModelAndView codeList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		String codeName = request.getParameter("codename");
		String codeGrp = request.getParameter("codegrp");
		
		Map<String,Object> search = new HashMap<>();
		
		if(codeName =="") {
			codeName = null;
		}
		if(codeGrp =="") {
			codeGrp = null;
		}
		search.put("codename", codeName);
		search.put("codegrp", codeGrp);
		search.put("siteid", SITEID);
		
		int totalRows = codeDao.codeTotalRow(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		search.put("SITEID", SITEID);
		
		ModelAndView mView = new ModelAndView();
		List<Map<String,Object>> CodeList = codeDao.codeList(search);
		mView.addObject("codeList",CodeList);
		mView.addObject("page",page);
		mView.addObject("search",search);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	@Override
	public Map<String, Object> codeRead(HttpServletRequest request, int codeNo) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CodeDto codeDto = new CodeDto();
		codeDto.setSiteid(SITEID);
		codeDto.setCodeno(codeNo);
		
		Map<String,Object> codeInfo = codeDao.codeRead(codeDto);
		
		
		return codeInfo;
	}

	@Override
	public void codeUpdate(HttpServletRequest request, CodeDto codeDto) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		codeDto.setEdtuser(USERNO);
		codeDto.setSiteid(SITEID);
		
		codeDao.codeUpdate(codeDto);
	}

	@Override
	public void codeDelete(HttpServletRequest request, int codeNo) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CodeDto codeDto = new CodeDto();
		codeDto.setEdtuser(USERNO);
		codeDto.setSiteid(SITEID);
		codeDto.setCodeno(codeNo);
		
		codeDao.codeDelete(codeDto);
	}

	@Override
	public int codeInsert(HttpServletRequest request, CodeDto codeDto) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		codeDto.setReguser(USERNO);
		codeDto.setEdtuser(USERNO);
		codeDto.setSiteid(SITEID);
		
		int codeNo = codeDao.codeInsert(codeDto);
		return codeNo;
	}

	@Override
	public ModelAndView codeUpperList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		String codeName = request.getParameter("codename");
		String codeGrp = request.getParameter("codegrp");
		
		Map<String,Object> search = new HashMap<>();
		
		if(codeName =="") {
			codeName = null;
		}
		if(codeGrp =="") {
			codeGrp = null;
		}
		search.put("codename", codeName);
		search.put("codegrp", codeGrp);
		search.put("siteid", SITEID);
		
		int totalRows = codeDao.codeTotalRow(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		search.put("SITEID", SITEID);
		
		ModelAndView mView = new ModelAndView();
		List<Map<String,Object>> CodeList = codeDao.upperCodeList(search);
		mView.addObject("codeList",CodeList);
		mView.addObject("page",page);
		mView.addObject("search",search);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

}
