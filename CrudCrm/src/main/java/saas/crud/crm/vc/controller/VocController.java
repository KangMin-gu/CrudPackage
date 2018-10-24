package saas.crud.crm.vc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import saas.crud.crm.vc.service.VocService;

@Controller
public class VocController {
	
	private static final Logger logger = LoggerFactory.getLogger(VocController.class);
	
	@Autowired
	private VocService vcService;

	@RequestMapping(value="/voc", method=RequestMethod.GET)
	public String vocPage() {
		
		return "vc/voc";
	}
	
	@RequestMapping(value="/satis", method=RequestMethod.GET)
	public String vocSatis() {
		
		return "vc/satis";
	}

}
