package saas.crud.crm.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import saas.crud.crm.home.dao.HomeDao;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	private HomeDao homeDao;
	
}
