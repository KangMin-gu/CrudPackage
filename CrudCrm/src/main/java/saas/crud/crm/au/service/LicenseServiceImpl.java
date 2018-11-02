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
import saas.crud.crm.common.PagingCommon;

@Service
public class LicenseServiceImpl implements LicenseService{

	@Autowired
	LicenseDao licenseDao;
	
	@Override
	public ModelAndView licenseList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		
		String licenseName = request.getParameter("licensename");
		
		Map<String,Object> search = new HashMap<>();
		
		if(licenseName =="") {
			licenseName = null;
		}

		search.put("licensename", licenseName);
		
		int totalRows = licenseDao.licenseTotalRow(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
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

	@Override
	public Map<String,Object> licenseDetail(HttpServletRequest request, int licenseno) {
		// TODO Auto-generated method stub
		Map<String,Object> licenseInfo = licenseDao.licenseDetail(licenseno);
		return licenseInfo;
	}

	@Override
	public int licenseInsert(HttpServletRequest request, LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		licenseDto.setEdtuser(USERNO);
		licenseDto.setReguser(USERNO);
		int licenseNo = licenseDao.licenseInsert(licenseDto);
		return licenseNo;
		
	}

	@Override
	public void licenseUpdate(HttpServletRequest request, LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		licenseDto.setEdtuser(USERNO);
		licenseDao.licenseUpdate(licenseDto);
	}

	@Override
	public void licenseDelete(HttpServletRequest request, int licenseno) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		LicenseDto licenseDto = new LicenseDto();
		licenseDto.setEdtuser(USERNO);
		licenseDto.setLicenseno(licenseno);
		
		licenseDao.licenseDelete(licenseDto);
	}

	@Override
	public void licenseMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		LicenseDto licenseDto = new LicenseDto();
		licenseDto.setEdtuser(USERNO);
		
		String sCheck[] = request.getParameterValues("licenseno");
		
		if(sCheck.length >0) {
			for(int i=0; i<sCheck.length; i++) {
				int licenseNo = Integer.parseInt(sCheck[i]);
				
				licenseDto.setLicenseno(licenseNo);
				
				licenseDao.licenseDelete(licenseDto);
			}
			
		}
		
	}

	@Override
	public List<Map<String, Object>> licenseAjaxList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Map<String,Object> search = new HashMap<>();
		List<Map<String,Object>> licenseInfo = licenseDao.licenseList(search);
		return licenseInfo;
	}

}
