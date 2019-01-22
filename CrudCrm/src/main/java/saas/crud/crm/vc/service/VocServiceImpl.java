package saas.crud.crm.vc.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.ServiceDto;
import saas.crud.crm.vc.dao.VocDao;

@Service
public class VocServiceImpl implements VocService{
	
	private static final Logger logger = LoggerFactory.getLogger(VocServiceImpl.class);

	@Autowired
	private CrudEngine crud;
	
	@Autowired
	private SvDao svDao;
	
	@Override
	public int vocInsert(HttpServletRequest request) {
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");

		String currentTime = dayTime.format(new Date(time));
		
		Map<String, Object> search = crud.searchParam(request);
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//serviceDto.setOwner(userNo);
		ServiceDto serviceDto = new ServiceDto();
		serviceDto.setCustno(4);
		//serviceDto.setCustno(Integer.parseInt(search.get("custno").toString()));
		serviceDto.setSiteid(siteId);
		serviceDto.setServicestep(1);
		serviceDto.setServicename(search.get("servicename").toString());
		serviceDto.setServicetype(Integer.parseInt(search.get("servicetype").toString()));
		serviceDto.setServicedesc(search.get("servicedesc").toString());
		serviceDto.setServiceowner(userNo);
		serviceDto.setReguser(userNo);
		serviceDto.setEdtuser(userNo);
		serviceDto.setOwner(userNo);
		serviceDto.setReceptiondate(currentTime);
		serviceDto.setServicename(search.get("servicename").toString());
		serviceDto.setComplete(0);
		int serviceNo = svDao.svInsert(serviceDto);
		
		int vocStep = Integer.parseInt(search.get("vocstep").toString());
		
		if(vocStep == 2) {
			// 처리
			serviceDto.setServicestep(2);
			svDao.svStepUpdate(serviceDto);
		}else if (vocStep == 3) {
			// 상담예약
			serviceDto.setServicestep(3);
			svDao.svStepUpdate(serviceDto);
		}else if (vocStep == 4 || vocStep == 5) {
			// 이관
			ConveyDto conveyDto = new ConveyDto();
			
			conveyDto.setConveydate(currentTime);
			conveyDto.setPrevowner(userNo);
			conveyDto.setNextowner(Integer.parseInt(search.get("nextowner").toString()));
			conveyDto.setConveydesc(search.get("conveydesc").toString());
			conveyDto.setConveyreason(Integer.parseInt(search.get("conveyreason").toString()));
			conveyDto.setReguser(userNo);
			conveyDto.setEdtuser(userNo);
			conveyDto.setServiceno(serviceNo);
			conveyDto.setSiteid(siteId);
			
			svDao.conveyInsert(conveyDto);
			
			serviceDto.setServicestep(vocStep);
			svDao.svStepUpdate(serviceDto);
		}
		int cnt = 0;
		Map<String,Object> map = new HashMap();
		TreeMap<String,Object> treeMap = new TreeMap<String,Object>(search);
		
		String key;
		String value;
		
		Iterator<String> keyiterator = treeMap.keySet().iterator();
		
		while(keyiterator.hasNext()) {
			
			key = keyiterator.next().toString();
			if(search.get(key) != null) {
				value = search.get(key).toString();
				if(key.contains("goodsb")) {
					map.put(key, value);
				}
			}
			
			
			
		}


		
		
		
		
		
		return serviceNo;
	}
	

}
