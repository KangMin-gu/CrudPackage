package saas.crud.crm.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.ce.EUploadDto;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CrudEngine crud;
	
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
		return "common/file/logoUpload";
	}
	//싱글팝업
	@RequestMapping(value="/singlefile", method=RequestMethod.GET)
	public String authpopSingleForm(HttpServletRequest request) {
		return "common/file/singlefile";
	}
	//멀티팝업
	@RequestMapping(value="/multifile", method=RequestMethod.GET)
	public String authpopMultiForm(HttpServletRequest request) {
		return "common/file/multifile";
	}
	//로고 파일등록
	@RequestMapping(value="/logo/fileupload", method=RequestMethod.POST)
	public void logofileupload(HttpServletResponse response, HttpServletRequest request, @RequestParam List<MultipartFile> mFile, 
			@RequestParam MultipartFile sFile, @RequestParam String fileSearchKey) {
		crud.fileUpload(response, request, mFile, sFile, fileSearchKey);
	}
	//파일등록
	@RequestMapping(value="/file/fileupload", method=RequestMethod.POST)
	public void fileupload(HttpServletResponse response, HttpServletRequest request, @RequestParam List<MultipartFile> mFile, 
			@RequestParam MultipartFile sFile, @RequestParam String fileSearchKey) {
		crud.fileUpload(response, request, mFile, sFile, fileSearchKey);
	}
	// 고객팝업
	@RequestMapping(value="/popcust", method=RequestMethod.GET)
	public ModelAndView authpopCust(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetCustName(request);
		mav.setViewName("cm/popcust");
		return mav;
	}
	
	//popcust에서 tr 값 클릭했을때 데이터를 화면에 뿌려주기위해서 처리
	@ResponseBody
	@RequestMapping(value="/popcust/{custNo}", method=RequestMethod.GET)
	public Map<String,Object> authpopCustDetail(HttpServletRequest request,@PathVariable int custNo){
		
		Map<String,Object> CustDetail = commonService.svcPopGetCustDetail(request,custNo);
		return CustDetail;
		
	}
	
	



}
