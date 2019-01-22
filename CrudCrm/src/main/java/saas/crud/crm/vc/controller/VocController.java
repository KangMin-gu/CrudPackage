package saas.crud.crm.vc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.common.CommonService;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;
import saas.crud.crm.cu.service.CustService;
import saas.crud.crm.vc.service.VocService;

@Controller
public class VocController {
	
	private static final Logger logger = LoggerFactory.getLogger(VocController.class);
	
	@Autowired
	private VocService vcService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private CustService custService;
	@Autowired
	private CrudEngine crud;

	@RequestMapping(value="vc/voc", method=RequestMethod.GET)
	public String authvocPage() {
		
		return "vc/voc";
	}
	
	@RequestMapping(value="vc/satis", method=RequestMethod.GET)
	public String authvocSatis() {
		
		return "vc/satis";
	}
	
	//번호 입력시 고객 팝업창
	@RequestMapping(value="/vc/pop/cust", method=RequestMethod.GET)
	public ModelAndView authvocPopCust(HttpServletRequest request) {
		ModelAndView mav = commonService.svcPopGetCustName(request);
		mav.setViewName("vc/pop/popcustvoc");
		return mav;
	}
	
	//voc 고객 팝업창 tr 클릭 시 해당 고객 데이터 바인딩.
	@RequestMapping(value="/vc/pop/cust/{custno}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authvocPopCustSelect(HttpServletRequest request,@PathVariable int custno) {
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		Map<String,Object> prmMap = new HashMap<String,Object>();
		prmMap.put("siteid", siteid);
		prmMap.put("custno", custno);
		Map<String,Object> custMap = vcService.svcVocPopCustSelect(prmMap);
		return custMap;
	}
	
	//voc 고객 추가
	@RequestMapping(value="/vc/cust/post", method=RequestMethod.POST)
	@ResponseBody
	public int authvocPopCustInsert(HttpServletRequest request) {		
		//System.out.println("@@@@@@@@@@@@@@@"+request.getParameter("custname"));
		
		Map<String, Object> search = crud.searchParam(request);
		
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		CustDto custDto = new CustDto();
		CustDenyDto custDenyDto = new CustDenyDto();
		
		//필수 값 설정. 등록/수정자는 로그인한 유저로 설정
		custDto.setReguser(userno);
		custDto.setEdituser(userno);
		custDto.setSiteid(siteid);
				
		custDenyDto.setReguser(userno);
		custDenyDto.setEdituser(userno);
				
	//	int custno = custService.svcCustformInsert(custDto,custDenyDto);
		int custno = 0;	
		return custno;
	}
	
	//voc 고객 수정
	@RequestMapping(value="/vc/cust/post/{custno}", method=RequestMethod.POST)
	@ResponseBody
	public int authvocPopCustUpdate(HttpServletRequest request,@PathVariable int custno) {		
		System.out.println("@@@@@@@@@@@@@@@"+request.getParameter("custname"));
		
		Map<String, Object> search = crud.searchParam(request);
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		CustDto custDto = new CustDto();
		CustDenyDto custDenyDto = new CustDenyDto();
			
		//필수 값 설정. 등록/수정자는 로그인한 유저로 설정
		custDto.setCustno(custno);
		custDto.setReguser(userno);
		custDto.setEdituser(userno);
		custDto.setSiteid(siteid);
							
		custDenyDto.setReguser(userno);
		custDenyDto.setEdituser(userno);
					
	//	int custno = custService.svcCustformUpdate(custDto,custDenyDto);
			
		return custno;
	}
	

}
