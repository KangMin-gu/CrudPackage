package saas.crud.crm.au.service;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.AuDao;
import saas.crud.crm.au.dao.CompanyDao;
import saas.crud.crm.au.dao.UserDao;
import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.ce.EUploadDto;
import saas.crud.crm.ce.EmailTemplate;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private CrudEngine crud;
	
	@Autowired
	private UserDao urDao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	// 회원사 List 검색
	@Override
	public ModelAndView companyList(HttpServletRequest request) {
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
		ModelAndView mView = new ModelAndView();
		CompanyDto companyDto = new CompanyDto();
		companyDto.setSiteid(siteId);
		Map<String,Object> memCompanyInfo = companyDao.companyRead(companyDto);
		mView.addObject("memCompany",memCompanyInfo);
		
		return mView;
	}
	
	//회원사 수정
	@Override
	public void comapnyUpdate(HttpServletRequest request, HttpServletResponse response, CompanyDto companyDto, MultipartFile file) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		if(file != null) {
			MultipartFile sFile = file;	
			String fileSearchKey =  crud.singleUpload(response, request, sFile);
			companyDto.setSitelogo(fileSearchKey);
		}
		companyDto.setEdtuser(userNo);				
		companyDao.companyUpdate(companyDto);
	}
	
	// 회원사 추가
	@Override
	public int companyInsert(HttpServletResponse response, HttpServletRequest request, CompanyDto companyDto,MultipartFile file) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		if(file != null) {
			MultipartFile sFile = file;	
			String fileSearchKey =  crud.singleUpload(response, request, sFile);
			companyDto.setSitelogo(fileSearchKey);
		}
		
		companyDto.setReguser(userNo);
		companyDto.setEdtuser(userNo);
		int siteid = companyDao.companyInsert(companyDto);
		
		companyDto.setSiteid(siteid);
		String hash = encoder.encode(companyDto.getAdminpassword());		
		
		companyDto.setAdminpassword(hash);
		companyDao.companyAdminInsert(companyDto);
		
		return siteid;
	}
	
	// 회원사 단일 삭제
	@Override
	public void companyDelete(HttpServletRequest request, int siteid) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		CompanyDto companyDto = new CompanyDto();
		companyDto.setEdtuser(userNo);
		
		companyDto.setSiteid(siteid);
		companyDao.companyDelete(companyDto);
	}
	
	// 회원사 멀티 삭제
	@Override
	public void companyMultiDelete(HttpServletRequest request) {
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
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Map<String, Object> data = crud.searchParam(request);
		
		data.put("reguser", userNo);
		data.put("edtuser", userNo);
		data.put("siteid", siteid);
		
		companyDao.companyLicenseInsert(data);
		
	}

	@Override
	public ModelAndView adminPwdReset(HttpServletRequest request, int siteId) {
		
		//StringBuffer type의 temp에 랜덤 숫자와 문자열을 담는다.
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 10; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}	
		
		//String 타입으로 읽을수 있게 형변환한다.
		String newPwd = temp.toString();
		String hash = encoder.encode(newPwd);
		String adminId = request.getParameter("adid"); //관리계정
		String managerNo = request.getParameter("mano"); //담당자번호 
		
		//admin 계정정보가져오기
		Map<String, Object> adminInfo = urDao.getData(adminId); //접속자 정보 //크루드테스트 생성시 메일생성안됨.
		Map<String, Object> sendPwdInfo = new HashMap<>();
		int adminSiteid = Integer.parseInt(adminInfo.get("SITEID").toString());
		//리셋시킬 admin 계정정보
		UserDto resetUserDto = new UserDto();
		resetUserDto.setUserpassword(hash);
		resetUserDto.setSiteid(adminSiteid);
		resetUserDto.setUserno(Integer.parseInt(adminInfo.get("USERNO").toString()));
		//담당자한테 mano 값으로 메일정보가져오기
		//비밀번호 정보 업데이트
		companyDao.adminPwdReset(resetUserDto);
		String siteName = adminInfo.get("SITENAME").toString();
		
		EmailTemplate eTemp = new EmailTemplate();		
		StringBuffer buf = eTemp.sitePwdRestTemle(newPwd, siteName);
		
		//초기화된 비밀번호 이메일테이블 인서트
		sendPwdInfo.put("managerno", managerNo);
		sendPwdInfo.put("userno", Integer.parseInt(adminInfo.get("USERNO").toString()));
		sendPwdInfo.put("userid",adminInfo.get("USERID"));
		sendPwdInfo.put("siteid",siteId);
		sendPwdInfo.put("toemail",adminInfo.get("EMAIL"));
		sendPwdInfo.put("username",adminInfo.get("USERNAME"));
		sendPwdInfo.put("content", buf.toString());
		sendPwdInfo.put("subject", "IDEA CRM 회원사 비밀번호가 초기화 되었습니다.");
		sendPwdInfo.put("cstname",adminInfo.get("USERNAME"));
		sendPwdInfo.put("fromemail","crudsystem@crudsystem.co.kr");
		
		companyDao.adminPwdResetsend(sendPwdInfo);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("msg","비밀번호 초기화 되었습니다. 사용자의 메일로 초기화된 비밀번호가 발송됩니다.");
		mView.addObject("url","ma/company/"+adminSiteid);
		return mView;
	}

	@Override
	public int licenseCnt(HttpServletRequest request) {
		
		int licenseNo = Integer.parseInt(request.getParameter("licenseno").toString());
		int siteId = Integer.parseInt(request.getParameter("siteid").toString());
		Map<String,Object> param = new HashMap<>();
		param.put("siteid", siteId);
		param.put("licenseno", licenseNo);
		
		Map<String,Object> map =  companyDao.licenseCnt(param);
		int buyCnt = Integer.parseInt(map.get("BUYCNT").toString());

		return buyCnt;
	}
	
}
