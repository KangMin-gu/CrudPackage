package saas.crud.crm.sv.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RcvDto;
import saas.crud.crm.sv.service.SvService;

@Controller
public class SvController {
	
	@Autowired
	SvService svService;
	
	@RequestMapping(value="/sv",method=RequestMethod.GET)
	public ModelAndView authSvList(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);
		mView.setViewName("sv/svList");
		return mView;
	}
	@RequestMapping(value="/sv",method=RequestMethod.POST)
	public ModelAndView authSvSearchList(HttpServletRequest request) {
		ModelAndView mView = svService.svList(request);
		mView.setViewName("sv/svList");
		return mView;
	}
	@RequestMapping(value="/sv/{rcvno}",method=RequestMethod.GET)
	public ModelAndView authSvRead(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		mView.setViewName("sv/svRead");
		return mView;
	}
	@RequestMapping(value="/sv/post/{rcvno}",method=RequestMethod.GET)
	public ModelAndView authSvUpdate(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		mView.setViewName("sv/svUpdate");
		return mView;
	}
	@RequestMapping(value="/sv/post/{rcvno}",method=RequestMethod.PUT)
	public ModelAndView authSvUpdateSet(HttpServletRequest request, @PathVariable int rcvno) {
		ModelAndView mView = new ModelAndView();
		svService.svUpdate(request);
		mView.setViewName("redirect:/sv/"+rcvno);
		return mView;
	}
	
	@RequestMapping(value="/sv/post", method=RequestMethod.GET)
	public ModelAndView authSvInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sv/svInsert");
		
		return mView;
	}
	@RequestMapping(value="/sv/post", method=RequestMethod.POST)
	public ModelAndView authSvInsertSet(HttpServletRequest request, @ModelAttribute RcvDto rcvDto) {
		ModelAndView mView = new ModelAndView();
		
		int rcvNo = svService.svInsert(request,rcvDto);
		
		mView.setViewName("redirect:/sv/"+rcvNo);
		
		return mView;
	}
	@RequestMapping(value="/sv/delete", method=RequestMethod.POST)
	public ModelAndView authSvMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		
		svService.svMultiDelete(request);
		
		mView.setViewName("redirect:/sv");
		
		return mView;
	}
	@RequestMapping(value="/sv/{rcvno}", method=RequestMethod.POST)
	public ModelAndView authSvDelete(HttpServletRequest request,@PathVariable int rcvno) {
		ModelAndView mView = new ModelAndView();
		
		svService.svDelete(request,rcvno);
		
		mView.setViewName("redirect:/sv");
		
		return mView;
	}
	
	@RequestMapping(value="/convey/{rcvno}", method=RequestMethod.GET)
	public ModelAndView authcommonUserList(HttpServletRequest request,@PathVariable int rcvno) {
		ModelAndView mView = svService.svRead(request, rcvno);
		mView.setViewName("/sv/svConveyPopup");
		return mView;
	}
	
	
	
	@RequestMapping(value="/convey",method=RequestMethod.POST)
	public void authSvRactInsert(HttpServletRequest request, @ModelAttribute ConveyDto conveyDto) {
		
		svService.svConveyInsert(request, conveyDto);
	}
	
	@ResponseBody
	@RequestMapping(value="/tab/ract/{rcvno}", method=RequestMethod.GET)
	public List<Map<String, Object>> authSvTabRact(HttpServletRequest request, @PathVariable int rcvno){
		
		List<Map<String, Object>> tabRact = svService.svTabRact(request,rcvno);
		
		return tabRact;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/tab/convey/{rcvno}", method=RequestMethod.GET)
	public List<Map<String, Object>> authSvTabConvey(HttpServletRequest request, @PathVariable int rcvno){
		
		List<Map<String, Object>> tabRact = svService.svTabConvey(request,rcvno);
		
		return tabRact;
		
	}


}
