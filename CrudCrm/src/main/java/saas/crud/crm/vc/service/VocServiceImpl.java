package saas.crud.crm.vc.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired; 
import saas.crud.crm.vc.dao.VocDao;

@Service
public class VocServiceImpl implements VocService{
	
	private static final Logger logger = LoggerFactory.getLogger(VocServiceImpl.class);
	
	@Autowired
	private VocDao vcDao;
	

}
