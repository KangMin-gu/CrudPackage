package saas.crud.crm.vc.service;

import java.util.Map;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;


import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.nt.dao.NoteDao;
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
		
		if(vocStep == 3) {
			// 처리
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
	
}
