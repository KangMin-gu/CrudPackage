package saas.crud.crm.sa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sa.dto.ClientCustDto;
import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.service.ClientService;

@Controller
public class ClientController {


	@Autowired 
	private ClientService clientService;
	
	
	//거래처리스트
	@RequestMapping(value="/sales/client",method=RequestMethod.GET)
	public ModelAndView authclientList(HttpServletRequest request) {
		ModelAndView mView = clientService.svcCliList(request); 
		mView.setViewName("sa/client/clilist");
		return mView;
	}
	//거래처상세
	@RequestMapping(value="/sales/client/view/{clino}",method=RequestMethod.GET)
	public ModelAndView authclientDetail(HttpServletRequest request 
			 ,@PathVariable int clino) {
		request.setAttribute("clino", clino);
		ModelAndView mView = clientService.svcCliDetail(request);
		mView.setViewName("sa/client/clidetail");
		
		//관련고객 리스트 추출
		Map<String,Object> cliCustList = clientService.svcCliCustList(request);
		mView.addObject("page",cliCustList.get("page")); //페이징
		mView.addObject("searchVal",cliCustList.get("searchVal"));//검색조건
		mView.addObject("cliCustList",cliCustList.get("cliCustList"));//리스트 데이터
						
		return mView;
	}
	
	//거래처추가 form //세션값으로 서비스 x 바로 해당 페이지로 
	@RequestMapping(value="/sales/client/post",method=RequestMethod.GET)
	public ModelAndView authclientInsert(HttpServletRequest request) {		
		
		Map<String,String> defaultMap = new HashMap<String,String>();
		ModelAndView mView= new ModelAndView();		
		
		defaultMap.put("USERNO", request.getSession().getAttribute("USERNO").toString());
		defaultMap.put("USERNAME", request.getSession().getAttribute("USERNAME").toString());
		mView.addObject("clientInsert",defaultMap);
		mView.setViewName("sa/client/cliinsert");
		return mView;
	}
	
	//거래처추가실행
	@RequestMapping(value="/sales/client/post",method=RequestMethod.POST)
	public String authclientInsert(HttpServletRequest request,@ModelAttribute ClientDto clientDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 등록/수정자는 로그인한 유저로 설정
		clientDto.setReguser(userno);
		clientDto.setEdituser(userno);
		clientDto.setSiteid(siteid);
		clientDto.setIsdelete(0);
						
		int clino = clientService.svcCliInsert(clientDto);
			
		return "redirect:/sales/client/view/"+clino; 
	}
	
	//거래처수정폼
	@RequestMapping(value="/sales/client/post/{clino}",method=RequestMethod.GET)
	public ModelAndView authclientDetailForm(HttpServletRequest request 
											,@PathVariable int clino) {
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());			
		
		ModelAndView mView = new ModelAndView(); 
		mView.addObject("cliUpdate",clientService.svcCliDetailForm(siteid,clino));
		mView.setViewName("sa/client/cliupdate");
		return mView;
	}
	//거래처수정실행
	@RequestMapping(value="/sales/client/post/{clino}",method=RequestMethod.POST)
	public String authclientDetailUpdate(HttpServletRequest request,@ModelAttribute ClientDto clientDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		clientDto.setEdituser(userno);
		clientDto.setSiteid(siteid);
					
		int clino = clientService.svcCliDetailUpdate(clientDto);
			
		return "redirect:/sales/client/view/"+clino; 
	}
	
	//거래처삭제
	@RequestMapping(value="/sales/client/delete/{clino}",method=RequestMethod.GET)
	public String authclientDelete(HttpServletRequest request 
											,@PathVariable int clino) {
		ClientDto clientDto = new ClientDto();
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());			
		clientDto.setClino(clino);
		clientDto.setSiteid(siteid);
		clientService.svcCliDelete(clientDto);
		
		return "redirect:/sales/client";
	}
	

	
	//영업관련고객상세-팝업창
	@RequestMapping(value="/popclicust/view/{clicustno}", method=RequestMethod.GET)
	public ModelAndView authpopCliCustDetail(HttpServletRequest request, @PathVariable int clicustno) {			
		
		ClientCustDto clientCustDto = new ClientCustDto();
		clientCustDto.setClicustno(clicustno);
		
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		clientCustDto.setSiteid(siteid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cliCustDetail",clientService.svcCliCustDetail(clientCustDto));	
		mav.setViewName("sa/client/pop/clicustdetail");
		return mav;
	}
	
	//영업관련고객추가-팝업창
	@RequestMapping(value="/popclicust/{clino}", method=RequestMethod.GET)
	public ModelAndView authpopCliCust(HttpServletRequest request, @PathVariable int clino) {			
		ModelAndView mav = new ModelAndView();
		mav.addObject("clino",clino);	
		mav.setViewName("sa/client/pop/clicustinsert");
		return mav;
	}
	
	//영업관련고객추가-실행
	@RequestMapping(value="/popclicust/post",method=RequestMethod.POST)
	@ResponseBody
	public int authpopCliCustInsert(HttpServletRequest request,@ModelAttribute ClientCustDto clientCustDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		clientCustDto.setEdtuser(userno);
		clientCustDto.setSiteid(siteid);
			
		int res = clientService.svcCliCustInsert(clientCustDto);//관련고객추가 서비스 실행
		return res;			
	}
	
	//팝업영업관련고객-삭제
	@RequestMapping(value="/popclicust/del/{clicustno}",method=RequestMethod.GET)
	@ResponseBody
	public int authcliCustDelete(HttpServletRequest request 
									,@PathVariable int clicustno) {
		ClientCustDto clientCustDto = new ClientCustDto();	
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		clientCustDto.setEdtuser(userno);
		clientCustDto.setSiteid(siteid);	
		clientCustDto.setClicustno(clicustno);
	
		int res = clientService.svcCliCustDelete(clientCustDto);
			
		return res;
	}
	
	
	//영업관련고객수정-팝업창
	@RequestMapping(value="/popclicust/post/{clicustno}", method=RequestMethod.GET)
	public ModelAndView authpopCliCustDetailForm(HttpServletRequest request, @PathVariable int clicustno) {			
		ClientCustDto clientCustDto = new ClientCustDto();
		clientCustDto.setClicustno(clicustno);
		int siteid= Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		clientCustDto.setSiteid(siteid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cliCustUpdate",clientService.svcCliCustDetail(clientCustDto));	
		mav.setViewName("sa/client/pop/clicustupdate");
		return mav;
	}	
	
	
	//팝업거래처관련고객-수정 실행
	@RequestMapping(value="/popclicust/post/{clicustno}",method=RequestMethod.POST)
	@ResponseBody
	public int authcliCustDelete(HttpServletRequest request 
										,@PathVariable int clicustno,@ModelAttribute ClientCustDto clientCustDto) {
			
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 수정자는 로그인한 유저로 설정
		clientCustDto.setEdtuser(userno);
		clientCustDto.setSiteid(siteid);	
		clientCustDto.setClicustno(clicustno);
		
		int res = clientService.svcCliCustUpdate(clientCustDto);
				
		return res;
	}		
	
	
	
	
}
