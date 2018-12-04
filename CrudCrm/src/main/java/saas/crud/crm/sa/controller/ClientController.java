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

import saas.crud.crm.sa.dto.ClientDto;
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
	

	
	
}
