package saas.crud.crm.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	//내부통지 팝업 --  
	@RequestMapping(value="/popnote",method=RequestMethod.GET)
	public ModelAndView authpopNote(HttpServletRequest request) {
		ModelAndView mView = commonService.svcPopNote(request);
		mView.setViewName("cm/popnote");
		return mView;
	}
	// 문자발송팝업
	@RequestMapping(value="/popsms", method=RequestMethod.GET)
	public ModelAndView authPopSms(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("cm/popsms");
		return mView;
	}
	
	// 문자 발송
	@RequestMapping(value="/sendSms",method=RequestMethod.POST)
	public void authSendSms(HttpServletRequest request) {
		commonService.sendSms(request);
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
	
	@RequestMapping(value = "/tinyMCE", method = RequestMethod.POST)
	@ResponseBody
	public String handleTinyMCEUpload(@RequestParam("files") MultipartFile files[], HttpServletRequest request) {
	    String filePath = "/tinyMCE/" +files[0].getOriginalFilename();
	    String result = commonService.uploadFilesFromTinyMCE("tinyMCE", files, false,request);
	    return "{\"location\":\"" + result + "\"}";
	}
	// 고객팝업
	@RequestMapping(value="/popcust", method=RequestMethod.GET)
	public ModelAndView authpopCust(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetCustName(request);
		mav.setViewName("cm/popcust");
		return mav;
	}
	
	//popcust에서 tr 값 클릭했을때 데이터를 화면에 뿌려주기위해서 처리
	
	@RequestMapping(value="/popcust/{custNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authpopCustDetail(HttpServletRequest request,@PathVariable int custNo){
		
		Map<String,Object> CustDetail = commonService.svcPopGetCustDetail(request,custNo);
		return CustDetail;
		
	}
	
	//popclient에서 tr 값 클릭했을때 데이터를 화면에 뿌려주기위해서 처리
	
	@RequestMapping(value="/popclient/{cliNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authPopClientDetail(HttpServletRequest request,@PathVariable int cliNo){
		
		Map<String,Object> clientDetail = commonService.svcPopGetClientDetail(request,cliNo);
		return clientDetail;
		
	}

	// 메일 클릭여부
	@RequestMapping(value="/mail/check", method=RequestMethod.GET)
	@ResponseBody
	public void MailClick(HttpServletRequest request) {
		commonService.mailClick(request);
	}
	
	@RequestMapping(value="/mail/deny", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView MailDeny(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		
		int emaillogid = Integer.parseInt(request.getParameter("EMAILLOGID").toString());
		int custno = Integer.parseInt(request.getParameter("CUSTNO").toString());
		
		mView.addObject("emaillogid",emaillogid);
		mView.addObject("custno",custno);
		mView.setViewName("denyEmail");
		return mView;
	}
	@RequestMapping(value="/mail/deny", method=RequestMethod.POST)
	@ResponseBody
	public void MailDenySet(HttpServletRequest request) {		
		// 수신거부 html 생성 및 수신거부 dao 생성 필요
		commonService.mailDeny(request);
		
	}
	
	//영업팝업
	@RequestMapping(value="/popsales", method=RequestMethod.GET)
	public ModelAndView authpopSales(HttpServletRequest request) {			
		ModelAndView mav = commonService.svcPopGetSalesName(request);
		mav.setViewName("cm/popsales");
		return mav;
	}

}
