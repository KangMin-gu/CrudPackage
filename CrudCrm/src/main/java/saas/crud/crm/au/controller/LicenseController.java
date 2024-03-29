package saas.crud.crm.au.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.LicenseDto;
import saas.crud.crm.au.service.LicenseService;

@Controller
public class LicenseController {
	
	@Autowired
	private LicenseService licenseService;
	
	private static final Logger logger = LoggerFactory.getLogger(LicenseController.class);
	//라이센스 List
	@ResponseBody
	@RequestMapping(value="/ma/license", method=RequestMethod.GET)
	public ModelAndView authLicenseList(HttpServletRequest request) {
		ModelAndView mView = licenseService.licenseList(request);
		mView.setViewName("/au/ma/li/licenseList");
		return mView;
	}
	//라이센스 List 검색
	@ResponseBody
	@RequestMapping(value="/ma/license", method=RequestMethod.POST)
	public ModelAndView authLicenseSearchList(HttpServletRequest request) {
		ModelAndView mView = licenseService.licenseList(request);
		mView.setViewName("/au/ma/li/licenseList");
		return mView;
	}
	
	//라이센스 상세
	@ResponseBody
	@RequestMapping(value="/ma/license/{licenseno}", method=RequestMethod.GET)
	public Map<String,Object> authLicenseDetail(HttpServletRequest request,@PathVariable int licenseno) {
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseno);
		return licenseInfo;
	}
	// 라이센스 추가
	@ResponseBody
	@RequestMapping(value="/ma/license/post", method=RequestMethod.POST)
	public Map<String,Object> authLicenseInsert(HttpServletRequest request, @ModelAttribute LicenseDto licenseDto) {
		int licenseNo = licenseService.licenseInsert(request, licenseDto);
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseNo);
		return licenseInfo;
	}
	// 라이센스 수정
	@ResponseBody
	@RequestMapping(value="/ma/license/post/{licenseno}", method=RequestMethod.POST)
	public Map<String,Object> authLicenseUpdateSet(HttpServletRequest request,@ModelAttribute LicenseDto licenseDto) {
		licenseService.licenseUpdate(request, licenseDto);
		int licenseNo = licenseDto.getLicenseno(); 
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseNo);
		return licenseInfo;
	}
	// 라이센스 삭제
	@ResponseBody
	@RequestMapping(value="/ma/license/{licenseno}" ,method=RequestMethod.POST)
	public Map<String,Object> authLicenseDelete(HttpServletRequest request, @PathVariable int licenseno) {
		
		licenseService.licenseDelete(request,licenseno);
		
		Map<String,Object> licenseInfo = licenseService.licenseDetail(request, licenseno);
		return licenseInfo;
	}
	// 라이센스 멀티 삭제
	@ResponseBody
	@RequestMapping(value="/ma/license/delete" ,method=RequestMethod.POST)
	public ModelAndView authLicenseMultiDelete(HttpServletRequest request) {
		
		licenseService.licenseMultiDelete(request);
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/ma/license");
		return mView;
		
	}
	// 회원사에서 라이센스 탭
	@ResponseBody
	@RequestMapping(value="/ma/license/tab/{siteid}", method=RequestMethod.GET)
	public List<Map<String,Object>> authTabLicenseList(@PathVariable int siteid){
		
		List<Map<String,Object>> TabLicenseList = licenseService.licenseTopList(siteid);
		
		return TabLicenseList;
	}
	//메뉴 생성에서 라이센스 selectbox에 나올 데이터들
		@ResponseBody
		@RequestMapping(value="/license/menu", method=RequestMethod.GET)
		public List<Map<String,Object>> authLicenseAjaxList(HttpServletRequest request) {
			List<Map<String,Object>> licenseInfo = licenseService.licenseAjaxList(request);
			return licenseInfo;
		}
	

}
