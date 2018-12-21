package saas.crud.crm.au.service;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.CompanyDao;
import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.ce.EUploadDto;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private CrudEngine crud;
	
	// 회원사 List 검색
	@Override
	public ModelAndView companyList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		//int SITEID = Integer.parseInt((String)request.getSession().getAttribute("SITEID"));
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);
		
		int totalRows = companyDao.companyTotalRows(search);
		
		int PAGE_ROW_COUNT = 10;
		int PAGE_DISPLAY_COUNT = 5;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);

		List<Map<String,Object>> memCompany = companyDao.companyList(search);
		
		mView.addObject("memCompany",memCompany);	
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		mView.addObject("search",search);
		
		return mView;
	}
	
	//회원사 상세 정보
	@Override
	public ModelAndView companyRead(HttpServletRequest request, int siteId) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		CompanyDto companyDto = new CompanyDto();
		companyDto.setSiteid(siteId);
		Map<String,Object> memCompanyInfo = companyDao.companyRead(companyDto);
		companyDto.setMobile1("011");
		mView.addObject("mm", companyDto);
		System.out.println("gkgkgkgkkgkgkkgkgkkgkgkkgkgkkgkgkkgkkgkgkkgkgkkgkgkkgkgkkgkkgkgkkgkgkkgkgkkgk"+memCompanyInfo.get("MOBILE1"));
		mView.addObject("memCompany",memCompanyInfo);
		
		return mView;
	}
	
	//회원사 수정
	@Override
	public void comapnyUpdate(HttpServletRequest request, CompanyDto companyDto) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		companyDto.setEdtuser(userNo);
		companyDao.companyUpdate(companyDto);
	}
	
	// 회원사 추가
	@Override
	public int companyInsert(HttpServletResponse response, HttpServletRequest request, CompanyDto companyDto) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		companyDto.setReguser(userNo);
		companyDto.setEdtuser(userNo);
		int siteid = companyDao.companyInsert(companyDto);
		companyDto.setSiteid(siteid);
		return siteid;
	}
	
	// 회원사 단일 삭제
	@Override
	public void companyDelete(HttpServletRequest request, int siteid) {
		// TODO Auto-generated method stub
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		CompanyDto companyDto = new CompanyDto();
		companyDto.setEdtuser(userNo);
		
		companyDto.setSiteid(siteid);
		companyDao.companyDelete(companyDto);
	}
	
	// 회원사 멀티 삭제
	@Override
	public void companyMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String sCheck[] = request.getParameterValues("siteid");
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		CompanyDto companyDto = new CompanyDto();
		
		companyDto.setEdtuser(userNo);
		int length = sCheck.length;
		if(length > 0) {
			for(int i=0;i<length;i++) {
				int siteid = Integer.parseInt(sCheck[i]); 
				companyDto.setSiteid(siteid);
				companyDao.companyDelete(companyDto);
			}
		}
	}
	
	// 회원사 라이센스 추가
	@Override
	public void companyLicenseInsert(HttpServletRequest request, int siteid) {
		// TODO Auto-generated method stub

		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		
		Map<String, Object> data = crud.searchParam(request);
		
		data.put("reguser", userNo);
		data.put("edtuser", userNo);
		data.put("siteid", siteid);
		
		companyDao.companyLicenseInsert(data);
		
	}

}
