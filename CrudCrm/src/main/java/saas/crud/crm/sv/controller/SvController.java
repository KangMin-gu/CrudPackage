package saas.crud.crm.sv.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.SvDto;
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
	@RequestMapping(value="/sv/{serviceno}",method=RequestMethod.GET)
	public ModelAndView authSvRead(HttpServletRequest request, @PathVariable int serviceno) {
		ModelAndView mView = svService.svRead(request, serviceno);
		mView.setViewName("sv/svRead");
		return mView;
	}
	@RequestMapping(value="/sv/post/{serviceno}",method=RequestMethod.GET)
	public ModelAndView authSvUpdate(HttpServletRequest request, @PathVariable int serviceno) {
		ModelAndView mView = svService.svRead(request, serviceno);
		mView.setViewName("sv/svUpdate");
		return mView;
	}
	@RequestMapping(value="/sv/post/{serviceno}",method=RequestMethod.PUT)
	public ModelAndView authSvUpdateSet(HttpServletRequest request, @ModelAttribute SvDto serviceDto) {
		ModelAndView mView = new ModelAndView();
		svService.svUpdate(request, serviceDto);
		int serviceNo = serviceDto.getServiceno();
		mView.setViewName("redirect:/sv/"+serviceNo);
		return mView;
	}
	
	@RequestMapping(value="/sv/post", method=RequestMethod.GET)
	public ModelAndView authSvInsert(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("sv/svInsert");
		
		return mView;
	}
	@RequestMapping(value="/sv/post", method=RequestMethod.POST)
	public ModelAndView authSvInsertSet(HttpServletRequest request,@ModelAttribute SvDto svDto) {
		ModelAndView mView = new ModelAndView();
		
		int serviceNo = svService.svInsert(request, svDto);
		
		mView.setViewName("redirect:/sv/"+serviceNo);
		
		return mView;
	}
	@RequestMapping(value="/sv/delete", method=RequestMethod.POST)
	public ModelAndView authSvMultiDelete(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		
		svService.svMultiDelete(request);
		
		mView.setViewName("redirect:/sv");
		
		return mView;
	}
	@RequestMapping(value="/sv/{serviceno}", method=RequestMethod.POST)
	public ModelAndView authSvDelete(HttpServletRequest request,@PathVariable int serviceno) {
		ModelAndView mView = new ModelAndView();
		
		svService.svDelete(request,serviceno);
		
		mView.setViewName("redirect:/sv");
		
		return mView;
	}


}
