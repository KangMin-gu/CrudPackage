package saas.crud.crm.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.EUploadDto;

@Controller
public class CommonController {

	@Autowired
	CommonService commonService;
	
	//담당자팝업
	@RequestMapping(value="/popowner", method=RequestMethod.GET)
	public ModelAndView authpopUser(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetUserName(request);
		mav.setViewName("cm/popowner");
		return mav;
	}
		
	//거래처팝업
	@RequestMapping(value="/popclient", method=RequestMethod.GET)
	public ModelAndView authpopClient(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetClientName(request);
		mav.setViewName("cm/popclient");
		return mav;
	}
	
	//로고팝업
	@RequestMapping(value="/poplogo", method=RequestMethod.GET)
	public String authpopLogoForm(HttpServletRequest request) {
		return "common/logo/logoUpload";
	}
	
	//로고등록
	@RequestMapping(value="/poplogo", method=RequestMethod.POST)
	@ResponseBody
	public EUploadDto authpopLogo(HttpServletResponse response, HttpServletRequest request, MultipartRequest multipartRequest) {
		EUploadDto fileInfo = commonService.logoUplaod(response, request, multipartRequest);
		return fileInfo;
	}
}
