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

import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.common.CommonService;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;
import saas.crud.crm.cu.service.CustService;
import saas.crud.crm.sv.dto.ServiceDto;
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
	@Autowired
	private CodeService codeService;

	@RequestMapping(value="vc/voc", method=RequestMethod.GET)
	public ModelAndView authvocPage() {
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("vc/voc");
		//mView.setViewName("vc/vocTest");
		return mView;
	}
	
	@RequestMapping(value="/vc/voc/post",method=RequestMethod.POST)
	@ResponseBody
	public int authVocInsert(HttpServletRequest request) {
		
		int cnt = vcService.vocInsert(request);
		return cnt; 
	}
	
	
	
	@RequestMapping(value="vc/satis", method=RequestMethod.GET)
	public String authvocSatis() {	
		return "vc/satis";
	}
	
	//번호 입력시 고객 팝업창
	@RequestMapping(value="/vc/pop/cust", method=RequestMethod.GET)
	public ModelAndView authvocPopCust(HttpServletRequest request) {
		ModelAndView mav = commonService.svcPopGetCustName(request);
		mav.setViewName("vc/pop/vocpopcust");
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
	//voc 고객팝업창 tr 클릭 시 해당 고객의 최근 한건의 서비스 데이터 바인딩
	@RequestMapping(value="/vc/pop/service/{custNo}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authvocPopServiceSelect(HttpServletRequest request,@PathVariable int custNo){
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("siteid", siteId);
		map.put("custno", custNo);
		Map<String,Object> serviceMap = vcService.svcVocPopServiceSelect(map);
		
		return serviceMap;
	}
	
	//voc 고객 추가
	@RequestMapping(value="/vc/cust/post", method=RequestMethod.POST)
	@ResponseBody
	public int authvocPopCustInsert(HttpServletRequest request) {				
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
		//인풋 바인딩.
		custDto.setCustname((String)search.get("custname"));
		custDto.setCustgubun(Integer.parseInt((String)search.get("custgubun")));
		custDto.setMobile1((String)search.get("mobile1"));
		custDto.setMobile2((String)search.get("mobile2"));
		custDto.setMobile3((String)search.get("mobile3"));
		custDto.setHomtel1((String)search.get("homtel1"));
		custDto.setHomtel2((String)search.get("homtel2"));
		custDto.setHomtel3((String)search.get("homtel3"));
		custDto.setRelcustno(Integer.parseInt((String)search.get("relcustno")));
		custDto.setEmail((String)search.get("email"));
		custDto.setCustgrade(Integer.parseInt((String)search.get("custgrade")));
		custDto.setHomaddr1((String)search.get("homaddr1"));
		custDto.setHomaddr2((String)search.get("homaddr2"));
		custDto.setHomaddr3((String)search.get("homaddr3"));
			
		custDenyDto.setReguser(userno);
		custDenyDto.setEdituser(userno);
		custDenyDto.setDenymailnomal(Integer.parseInt((String)search.get("denymailnomal")));
		custDenyDto.setDenymailsurvey(Integer.parseInt((String)search.get("denymailsurvey")));
		custDenyDto.setDenysmsnomal(Integer.parseInt((String)search.get("denysmsnomal")));
		custDenyDto.setDenysmssurvey(Integer.parseInt((String)search.get("denysmssurvey")));
		custDenyDto.setDenydmnomal(Integer.parseInt((String)search.get("denydmnomal")));
		custDenyDto.setDenydmsurvey(Integer.parseInt((String)search.get("denydmsurvey")));
		int custno = custService.svcCustformInsert(custDto,custDenyDto);
		
		return custno;
	}
	
	//voc 고객 수정
	@RequestMapping(value="/vc/cust/post/{custno}", method=RequestMethod.POST)
	@ResponseBody
	public int authvocPopCustUpdate(HttpServletRequest request,@PathVariable int custno) {		
		Map<String, Object> custInfo = crud.searchParam(request);
		
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		custInfo.put("userno", userno);
		custInfo.put("siteid", siteid);
		custInfo.put("custno", custno);
		
		custService.svcVocCustUpdate(custInfo);		
		return custno;
	}

	@RequestMapping(value="/vc/voc/cal", method=RequestMethod.GET)
	public ModelAndView authvocCalList(HttpServletRequest request) {
		ModelAndView mView = vcService.vocCalList(request);
		mView.setViewName("vc/calendar/vocCalMain");
		return mView;
	}

	
	//VOC -  좌측탭 서비스 리스트	
	@RequestMapping(value="/vc/tab/sv",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authvocTabServiceList(HttpServletRequest request) {
		Map<String,Object> svMap = vcService.svcVocTabServiceList(request);
		return svMap;
	}
	
	//VOC -  좌측탭 email 리스트	
	@RequestMapping(value="/vc/tab/email",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authvocTabEmailList(HttpServletRequest request) {
		Map<String,Object> emailMap = vcService.svcVocTabEmailList(request);
		return emailMap;
	}
	//VOC - 좌측탭 - 윈도우 팝업 email 상세 
	@RequestMapping(value="/vc/tab/email/view/{emailLogId}",method=RequestMethod.GET)
	public ModelAndView authvocTabEmailList(HttpServletRequest request,@PathVariable int emailLogId) {
		Map<String,Object> prmMap = new HashMap<String,Object>();
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		prmMap.put("siteid", siteid);
		prmMap.put("emaillogid", emailLogId);
		
		Map<String,Object> emailDetailMap = vcService.svcVocTabEmailDetail(prmMap);
		ModelAndView mView = new ModelAndView();
		mView.addObject("emailDetailMap",emailDetailMap);
		mView.setViewName("vc/pop/emaildetail");
		return mView;
	}
	
	//VOC -  블랙 추가 폼 	
	@RequestMapping(value="/vc/black/post",method=RequestMethod.GET)
	public String authvocBlackCustForm(HttpServletRequest request) {
		return "vc/pop/blackcustinsert";
	}
	
	//VOC -  블랙 추가 실행 	
	@RequestMapping(value="/vc/black/post",method=RequestMethod.POST)
	@ResponseBody
	public int authvocBlackCustInsert(HttpServletRequest request) {
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		Map<String,Object> blackInsMap = crud.searchParam(request);
		blackInsMap.put("userno", userno);
		int bcustno = vcService.svcVocBlackCustInsert(blackInsMap);
		return bcustno;
	}
	
	//VOC - 블랙 해제 실행 	
	@RequestMapping(value="/vc/black/del/{custno}",method=RequestMethod.GET)
	@ResponseBody
	public int authvocBlackCustDelete(HttpServletRequest request,@PathVariable int custno) {
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		Map<String,Object> blackDelMap = crud.searchParam(request);
		blackDelMap.put("userno", userno);
		blackDelMap.put("custno", custno);
		int bcustno = vcService.svcVocBlackCustDelete(blackDelMap);
		return bcustno;
	}
	
	//VOC - 세션유지 	
	@RequestMapping(value="/vc/sess",method=RequestMethod.GET)
	@ResponseBody
	public int authvocSessionMaintain(HttpServletRequest request) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@sess test@@@@@@@@@@@@@@@@@@@");
		return 0;
	}
	
	//VOC 온피아 -> 콜백 받기 
	@RequestMapping(value="/vc/callback",method=RequestMethod.POST)
	@ResponseBody
	public int vocGetCallBack(HttpServletRequest request) {
		Map<String, Object> callBackMap = crud.searchParam(request);
		callBackMap.put("callstatus", 0); //콜백 상태 기본 값 0
		callBackMap.put("callcount", 0); //상담원의 콜 시도 횟수 기본 값 0
		int res = vcService.svcVocCallBackInsert(callBackMap);
		return res;
	}
	
	
	//VOC 콜백 목록 조회 
	@RequestMapping(value="/vc/callback",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> authvocCallBackList(HttpServletRequest request) {		
		Map<String,Object> callBackList = vcService.svcVocCallBackList(request);
		return callBackList;
	}
	
}
