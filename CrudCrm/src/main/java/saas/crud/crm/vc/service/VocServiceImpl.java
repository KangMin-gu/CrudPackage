package saas.crud.crm.vc.service;

import java.util.Map;
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


import saas.crud.crm.cu.dao.CustDao;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.ServiceDto;
import saas.crud.crm.vc.dao.VocDao;

@Service
public class VocServiceImpl implements VocService{
	
	private static final Logger logger = LoggerFactory.getLogger(VocServiceImpl.class);

	@Autowired
	private CrudEngine crud;
	
	@Autowired
	private VocDao vcDao;
	@Autowired
	private CustDao custDao;
	@Autowired
	private SvDao svDao;
	//팝업 - 고객 리스트 TR 클릭. 바인딩용 고객 상세 데이터
	@Override
	public Map<String, Object> svcVocPopCustSelect(Map<String, Object> prm) {
		Map<String, Object> custMap = custDao.custDetail(prm);
		return custMap;
	}
	
	// VOC 추가
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
		//serviceDto.setCustno(4);
		serviceDto.setCustno(Integer.parseInt(search.get("custno").toString()));
		
		if(search.get("servicecode1") != null) {
			serviceDto.setServicecode1(Integer.parseInt(search.get("servicecode1").toString()));
		}
		if(search.get("servicecode2") != null) {
			serviceDto.setServicecode2(Integer.parseInt(search.get("servicecode2").toString()));
		}
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
		if(search.get("memo") != null) {
			serviceDto.setMemo(search.get("memo").toString());
		}
		int serviceNo = svDao.svInsert(serviceDto);
		
		int vocStep = 0 ;
		if(search.get("vocstep") == null) {
			vocStep = 3;
		}else {
			vocStep = Integer.parseInt(search.get("vocstep").toString());	
		}

		if(vocStep == 3) {
			// 처리
			RactDto ractDto = new RactDto();
			ractDto.setServiceno(serviceNo);
			ractDto.setSiteid(siteId);
			ractDto.setRactdesc(search.get("servicedesc").toString());
			ractDto.setRactdate(currentTime);
			ractDto.setReguser(userNo);
			ractDto.setEdtuser(userNo);
			svDao.ractInsert(ractDto);
			serviceDto.setServicestep(vocStep);
			svDao.svStepUpdate(serviceDto);
		}else if (vocStep == 4) {
			// 상담예약
			Map<String,Object> reserv = new HashMap();
			reserv.put("siteid", siteId);
			reserv.put("reguser", userNo);
			reserv.put("edtuser", userNo);
			reserv.put("serviceno", serviceNo);
			reserv.put("reservphone", search.get("reservphone").toString());
			reserv.put("reservdate", search.get("reservdate").toString());
			reserv.put("reservtimeto", search.get("reservtimeto").toString());
			reserv.put("reservtimefrom", search.get("reservtimefrom").toString());
			reserv.put("complete", 0);
			
			svDao.svReservInsert(reserv);
			
			serviceDto.setServicestep(vocStep);
			svDao.svStepUpdate(serviceDto);
		}else if (vocStep == 5 || vocStep == 6) {
			// 이관
			ConveyDto conveyDto = new ConveyDto();
			int owner = 0;
			if(search.get("nextowner") != null) {
				owner = Integer.parseInt(search.get("nextowner").toString());
			}
			if(search.get("nextadminowner") != null) {
				owner = Integer.parseInt(search.get("nextadminowner").toString());
			}
			conveyDto.setConveydate(currentTime);
			conveyDto.setPrevowner(userNo);
			conveyDto.setNextowner(owner);
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
		map.put("siteid", siteId);
		map.put("reguser", userNo);
		map.put("edtuser", userNo);
		map.put("serviceno", serviceNo);
		while(keyiterator.hasNext()) {
			
			key = keyiterator.next().toString();
			if(search.get(key) != null) {
				value = search.get(key).toString();
				if(key.contains("goods")) {
					cnt ++;
					if(cnt == 1) {
					map.put("goodsb", value);
					}else if(cnt ==2) {
						map.put("goodsm", value);
					}else if(cnt ==3) {
						map.put("goodss", value);
						cnt = 0;
						svDao.svGoodsInsert(map);
					}
				}
			}
		}
		return serviceNo;
	}

	@Override
	public Map<String, Object> svcVocPopServiceSelect(Map<String, Object> map) {
		Map<String,Object> serviceMap = svDao.svTopDesc(map);
		if(serviceMap != null) {
			int serviceStep = Integer.parseInt(serviceMap.get("SERVICESTEP").toString()); 
			int serviceNo = Integer.parseInt(serviceMap.get("SERVICENO").toString());
			map.put("serviceno",serviceNo);
			if(serviceStep == 4) {			
				serviceMap.put("reserv", svDao.svTopResv(map));
			}else if(serviceStep == 5 || serviceStep == 6) {
				serviceMap.put("convey", svDao.svTopConvey(map));
			}
		}else {
			serviceMap = new HashMap<>();
		}
		return serviceMap;
	}
	
}
