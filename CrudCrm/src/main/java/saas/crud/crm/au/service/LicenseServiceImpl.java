package saas.crud.crm.au.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.LicenseDao;
import saas.crud.crm.au.dto.LicenseDto;
import saas.crud.crm.ce.CrudEngine;


@Service
public class LicenseServiceImpl implements LicenseService{

	@Autowired
	private LicenseDao licenseDao;
	
	@Autowired
	private CrudEngine crudEngine;
	
	//라이센스 List 검색
	@Override
	public ModelAndView licenseList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crudEngine.searchParam(request);
		
		int totalRows = licenseDao.licenseTotalRow(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		Map<String, Integer> page = crudEngine.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> licenseList = licenseDao.licenseList(search);
		
		mView.addObject("license",licenseList);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		mView.addObject("search",search);
		
		
		return mView;
	}

	// 라이센스 상세 정보
	@Override
	public Map<String,Object> licenseDetail(HttpServletRequest request, int licenseno) {
		// TODO Auto-generated method stub
		Map<String,Object> licenseInfo = licenseDao.licenseDetail(licenseno);
		return licenseInfo;
	}

	@Override
	public int licenseInsert(HttpServletRequest request, LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		licenseDto.setEdtuser(userNo);
		licenseDto.setReguser(userNo);
		int licenseNo = licenseDao.licenseInsert(licenseDto);
		return licenseNo;
		
	}

	// 라이센스 수정
	@Override
	public void licenseUpdate(HttpServletRequest request, LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		licenseDto.setEdtuser(userNo);
		licenseDao.licenseUpdate(licenseDto);
	}

	// 라이센스 단일 삭제
	@Override
	public void licenseDelete(HttpServletRequest request, int licenseno) {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		LicenseDto licenseDto = new LicenseDto();
		licenseDto.setEdtuser(userNo);
		licenseDto.setLicenseno(licenseno);
		
		licenseDao.licenseDelete(licenseDto);
	}

	// 라이센스 멀티 삭제
	@Override
	public void licenseMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		LicenseDto licenseDto = new LicenseDto();
		licenseDto.setEdtuser(userNo);
		
		String sCheck[] = request.getParameterValues("licenseno");
		
		if(sCheck.length >0) {
			for(int i=0; i<sCheck.length; i++) {
				int licenseNo = Integer.parseInt(sCheck[i]);
				
				licenseDto.setLicenseno(licenseNo);
				
				licenseDao.licenseDelete(licenseDto);
			}
			
		}
		
	}

	// 메뉴 입력할 때 라이센스 Selectbox 부분
	@Override
	public List<Map<String, Object>> licenseAjaxList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> licenseInfo = licenseDao.licenseMenuList();
		return licenseInfo;
	}
	
	// 회원사 라이센스 탭
	@Override
	public List<Map<String, Object>> licenseTopList(int siteid) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> licenseList = licenseDao.licenseTopList(siteid);
		return licenseList;
	}

}
