package saas.crud.crm.vc.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.home.controller.HomeController;

@Repository
public class VocDaoImpl implements VocDao{
	
	private static final Logger logger = LoggerFactory.getLogger(VocDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	
}
