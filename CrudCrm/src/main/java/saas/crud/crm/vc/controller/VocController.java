package saas.crud.crm.vc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.service.CodeService;
import saas.crud.crm.sv.dto.ServiceDto;
import saas.crud.crm.vc.service.VocService;

@Controller
public class VocController {
	
	private static final Logger logger = LoggerFactory.getLogger(VocController.class);
	
	@Autowired
	private VocService vcService;
	@Autowired
	private CodeService codeService;

	@RequestMapping(value="vc/voc", method=RequestMethod.GET)
	public ModelAndView authVocPage() {
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> code = codeService.getCode();
		mView.addAllObjects(code);
		mView.setViewName("vc/voc");
		return mView;
	}
	@RequestMapping(value="/vc/voc/post",method=RequestMethod.POST)
	@ResponseBody
	public int authVocInsert(HttpServletRequest request) {
		
		int cnt = vcService.vocInsert(request);
		return cnt; 
	}
	
	
	
	@RequestMapping(value="vc/satis", method=RequestMethod.GET)
	public String vocSatis() {
		
		return "vc/satis";
	}

}
