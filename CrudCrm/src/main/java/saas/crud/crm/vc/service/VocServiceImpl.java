package saas.crud.crm.vc.service;

import java.util.Map;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;


import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RewardDto;
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
	@Autowired
	private NoteDao ntDao;

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
		int serviceType = Integer.parseInt(search.get("servicetype").toString());
		if(search.get("servicecode1") != null) {
			serviceDto.setServicecode1(Integer.parseInt(search.get("servicecode1").toString()));
		}
		if(search.get("servicecode2") != null) {
			serviceDto.setServicecode2(Integer.parseInt(search.get("servicecode2").toString()));
		}
		serviceDto.setSiteid(siteId);
		serviceDto.setServicestep(1);
		serviceDto.setServicename(search.get("servicename").toString());
		serviceDto.setServicetype(serviceType);
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
		int owner = 0;
		// 문의 인경우
		if(serviceType == 1) {
			int vocStep = 0 ;
			//vocStep이 아무것도 없는경우
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
		}else if(serviceType == 2) {
			if(search.get("asowner") != null) {
				owner = Integer.parseInt(search.get("asowner").toString());
			}
			owner = 75;
			serviceDto.setServicestep(4);
			svDao.svStepUpdate(serviceDto);
			RewardDto rewardDto = new RewardDto();
			if(request.getParameter("visitdate") != null) {
				rewardDto.setVisitdate(request.getParameter("visitdate").toString());	
			}
			
			if(request.getParameter("visittime") != null) {
				rewardDto.setVisittime(request.getParameter("visittime").toString());
			}
			rewardDto.setReguser(userNo);
			rewardDto.setEdtuser(userNo);
			rewardDto.setSiteid(siteId);
			rewardDto.setServiceno(serviceNo);
			rewardDto.setOwner(3);
			rewardDto.setVisitaddr1(request.getParameter("visitaddr1").toString());
			rewardDto.setVisitaddr2(request.getParameter("visitaddr2").toString());
			rewardDto.setVisitaddr3(request.getParameter("visitaddr3").toString());
			svDao.rewardInsert(rewardDto);

			ConveyDto conveyDto = new ConveyDto();
			conveyDto.setConveydate(currentTime);
			conveyDto.setPrevowner(userNo);
			conveyDto.setNextowner(owner);
			String msg = "A/S 기사님에게 이관합니다.";
			conveyDto.setConveydesc(msg);
			if(search.get("conveyreason") != null) {
				conveyDto.setConveyreason(Integer.parseInt(search.get("conveyreason").toString()));
			}
			conveyDto.setReguser(userNo);
			conveyDto.setEdtuser(userNo);
			conveyDto.setServiceno(serviceNo);
			conveyDto.setSiteid(siteId);
			
			svDao.conveyInsert(conveyDto);
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
			int serviceType = Integer.parseInt(serviceMap.get("SERVICETYPE").toString());
			map.put("serviceno",serviceNo);
			if(serviceType == 1) {
				if(serviceStep == 4) {			
					serviceMap.put("reserv", svDao.svTopResv(map));
				}else if(serviceStep == 5 || serviceStep == 6) {
					serviceMap.put("convey", svDao.svTopConvey(map));
				}
			}else if(serviceType == 2) {
				serviceMap.put("reward", svDao.svTopReward(map));
			}
		}else {
			serviceMap = new HashMap<>();
		}
		return serviceMap;
	}

	@Override
	public ModelAndView vocCalList(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		RewardDto rewardDto = new RewardDto();
		
		
		rewardDto.setSiteid(siteId);
		
		List<Map<String,Object>> rewardOwnerList = svDao.svRewardOwner(rewardDto);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(rewardOwnerList);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		mView.addObject("schList",jsonStr);//캘린더 스케쥴
		mView.addObject("svSchList",rewardOwnerList);//캘린더 틀 목록.

		return mView;
	}
	
	//VOC 좌측 탭 - 서비스 리스트
	@Override
	public Map<String,Object> svcVocTabServiceList(HttpServletRequest request){
		Map<String, Object> searchVal = crud.searchParam(request);

		//총자료수
		int totalRows = svDao.svServiceTotalRows(searchVal);
							
		//paging			
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
					
		Map<String, Integer> page =  crud.paging(request, totalRows,pageRowCount,pageDisplayCount);//page text 리턴 					
		page.put("totalRows", totalRows);					
		//출력할 row 범위설정 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
					
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
					
		//서비스 리스트 출력
		List<Map<String,Object>> svList = svDao.svList(searchVal);
				
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("page", page);//페이징 text int 저장
		resMap.put("svList", svList);// 선택 된 페이지 rownum에 해당하는 리스트
		resMap.put("searchVal",searchVal);//검색조건.
							
		return resMap;
	}

	//VOC 좌측 탭 EMAIL 리스트
	@Override
	public Map<String, Object> svcVocTabEmailList(HttpServletRequest request) {
		Map<String, Object> searchVal = crud.searchParam(request);

		//총자료수
		int totalRows = vcDao.emailListCnt(searchVal);
							
		//paging			
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
					
		Map<String, Integer> page =  crud.paging(request, totalRows,pageRowCount,pageDisplayCount);//page text 리턴 					
		page.put("totalRows", totalRows);					
		//출력할 row 범위설정 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
					
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
					
		//이메일 리스트 출력
		List<Map<String,Object>> emailList = vcDao.emailList(searchVal);
				
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("page", page);//페이징 text int 저장
		resMap.put("emailList", emailList);// 선택 된 페이지 rownum에 해당하는 리스트
		resMap.put("searchVal",searchVal);//검색조건.
							
		return resMap;
	}
	//VOC 좌측 텝 - 이메일 상세 
	@Override
	public Map<String, Object> svcVocTabEmailDetail(Map<String, Object> prm) {
		Map<String,Object> emailMap = vcDao.vocEmailDetail(prm);
								
		//전달, 파일서치키가 null이 아니면 
		if(emailMap.get("FILESEARCHKEY") != null) {
			String fileSearchKey = emailMap.get("FILESEARCHKEY").toString();
			prm.put("filesearchkey", fileSearchKey);
			//파일정보 읽어옴 siteid , fileSearchKey
			List<Map<String, Object>> replyFile = ntDao.noteFile(prm);
			emailMap.put("replyFile", replyFile);
		}				
					
		return emailMap;
	}
	//voc 블랙 추가
	@Override
	public int svcVocBlackCustInsert(Map<String, Object> blackInsMap) {
		int bcustno = vcDao.vocBlackCustInsert(blackInsMap);
		return bcustno;
	}
	//voc 블랙 삭제
	@Override
	public int svcVocBlackCustDelete(Map<String, Object> prm) {
		int bcustno = vcDao.vocBlackCustDelete(prm);
		return bcustno;
	}

	//voc 콜백 추가. cti에서 보내 준 데이터 콜백 테이블에 insert 
	@Override
	public int svcVocCallBackInsert(Map<String, Object> calBackMap) {
		int res = vcDao.vocCallBackInsert(calBackMap);
		return res;
	}
	
}
