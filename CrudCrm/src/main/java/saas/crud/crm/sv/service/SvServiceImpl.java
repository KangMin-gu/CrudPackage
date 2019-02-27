package saas.crud.crm.sv.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import saas.crud.crm.au.dto.ProductDto;
import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.ce.MailDao;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.sv.dao.SvDao;
import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RewardDto;
import saas.crud.crm.sv.dto.ServiceDto;

@Service
public class SvServiceImpl implements SvService{
	
	@Autowired
	private SvDao svDao;
	
	@Autowired
	private CrudEngine crud;
	
	@Autowired
	private MailDao mailDao;
	// 서비스 List
	@Override
	public ModelAndView svList(HttpServletRequest request) {

		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);
		String uri = request.getRequestURI();
		if(uri.contains("convey")) {
			search.put("servicestep", 6);
		}

		int totalRows = svDao.svServiceTotalRows(search);
		
		int PAGE_ROW_COUNT = 10;
		int PAGE_DISPLAY_COUNT = 5;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> svList = svDao.svList(search);
		
		mView.addObject("svList",svList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}
	
	@Override
	public ModelAndView svRead(HttpServletRequest request, int serviceNo) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> param = new HashMap<>();
		param.put("siteid", siteId);
		param.put("serviceno", serviceNo);
		
		Map<String,Object> serviceInfo = svDao.serviceRead(param);
		Map<String,Object> rewardInfo = svDao.rewardRead(param);
		Map<String,Object> ractInfo = svDao.ractRead(param);
		List<ProductDto> product = svDao.svProductRead(param);
		
		if(serviceInfo.get("FILESEARCHKEY") != null) {
			String fileSearchKey = (String) serviceInfo.get("FILESEARCHKEY");
			param.put("filesearchkey", fileSearchKey);
			List<Map<String,Object>> serviceFile = mailDao.fileAttach(param);
			mView.addObject("serviceFile",serviceFile);
			param.remove("filesearchkey");
		}
		
		if(rewardInfo != null) {
			if(rewardInfo.get("FILESEARCHKEY") != null) {
				String fileSearchKey = (String) rewardInfo.get("FILESEARCHKEY");
				param.put("filesearchkey", fileSearchKey);
				List<Map<String,Object>> rewardFile = mailDao.fileAttach(param);
				mView.addObject("rewardFile",rewardFile);
				param.remove("filesearchkey");
			}
		}
		if(ractInfo != null) {
			if(ractInfo.get("FILESEARCHKEY") != null) {
				String fileSearchKey = (String) ractInfo.get("FILESEARCHKEY");
				param.put("filesearchkey", fileSearchKey);
				List<Map<String,Object>> ractFile = mailDao.fileAttach(param);
				mView.addObject("ractFile",ractFile);
				param.remove("filesearchkey");
			}
		}
		mView.addObject("product",product);
		mView.addObject("serviceInfo", serviceInfo);
		mView.addObject("rewardInfo", rewardInfo);
		mView.addObject("ractInfo", ractInfo);
		
		return mView;
	}

	@Override
	public int svInsertUpdate(HttpServletResponse response, HttpServletRequest request,
			MultipartHttpServletRequest multipartHttpServletRequest, ServiceDto serviceDto, RewardDto rewardDto,
			RactDto ractDto) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		Map<String,Object> search = crud.searchParam(request);
		serviceDto.setSiteid(siteId);
		serviceDto.setEdtuser(userNo);
		serviceDto.setReguser(userNo);
		rewardDto.setSiteid(siteId);
		rewardDto.setEdtuser(userNo);
		ractDto.setSiteid(siteId);
		ractDto.setEdtuser(userNo);
		
		int serviceFileSize = multipartHttpServletRequest.getFiles("servicefile").size();
		int rewardFileSize = multipartHttpServletRequest.getFiles("rewardfile").size();
		int ractFileSize = multipartHttpServletRequest.getFiles("ractfile").size();
		List<MultipartFile> serviceFileUpload = null;
		List<MultipartFile> rewardFileUpload = null;
		List<MultipartFile> ractFileUpload = null;
		MultipartFile sFile = null;
		
		if(serviceFileSize > 0) {
			serviceFileUpload = multipartHttpServletRequest.getFiles("servicefile");
			int serviceFileUploadLength = serviceFileUpload.get(0).getOriginalFilename().length();
			if(serviceFileUploadLength > 0) {
				String fileSearchKey = crud.fileSearchKey(request);
				crud.fileUpload(response, multipartHttpServletRequest, serviceFileUpload, sFile, fileSearchKey);
				serviceDto.setFilesearchkey(fileSearchKey);
			}
		}
		if(rewardFileSize > 0) {
			rewardFileUpload = multipartHttpServletRequest.getFiles("rewardfile");
			int rewardFileUploadLength = rewardFileUpload.get(0).getOriginalFilename().length();
			if(rewardFileUploadLength > 0) {
				String fileSearchKey = crud.fileSearchKey(request);
				crud.fileUpload(response, multipartHttpServletRequest, rewardFileUpload, sFile, fileSearchKey);
				rewardDto.setFilesearchkey(fileSearchKey);
				}
		}
		if(ractFileSize > 0) {
			ractFileUpload = multipartHttpServletRequest.getFiles("ractfile");
			int ractFileUploadLength = ractFileUpload.get(0).getOriginalFilename().length();
			if(ractFileUploadLength > 0) {
				String fileSearchKey = crud.fileSearchKey(request);
				crud.fileUpload(response, multipartHttpServletRequest, ractFileUpload, sFile, fileSearchKey);
				ractDto.setFilesearchkey(fileSearchKey);
			}
		}
		
		int serviceNo = serviceDto.getServiceno();
		if(serviceNo == 0) {
			serviceDto.setIsdelete(0);
			serviceNo = svDao.svInsert(serviceDto);
		}
		
		String visitDate = rewardDto.getVisitdate();
		
		 int rewardNo = rewardDto.getRewardno();
		
		 // 방문 일정이 잡히면 현상파악을 Insert 하게됨.
		 if(visitDate != null) {
			 if(visitDate.length() > 0) {
				 if(rewardNo != 0) {
					 svDao.rewardUpdate(rewardDto);
				 }else {
					 rewardDto.setServiceno(serviceNo);
					 rewardDto.setReguser(userNo);
					 svDao.rewardInsert(rewardDto);
					 serviceDto.setServicestep(3);
					 svDao.svStepUpdate(serviceDto);
				 }
			 }
		 }
		
		String ractDate = ractDto.getRactdate();
		int ractNo = ractDto.getRactno();
		
		if(ractDate.length() > 0) {
			if(ractNo != 0) {
				svDao.ractUpdate(ractDto);	
			}else{
				ractDto.setServiceno(serviceNo);
				ractDto.setReguser(userNo);
				svDao.ractInsert(ractDto);
				serviceDto.setServicestep(3);
				svDao.svStepUpdate(serviceDto);
			}
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
				if(key.contains("product")) {
					cnt ++;
					if(cnt == 1) {
					map.put("productb", value);
					}else if(cnt ==2) {
						map.put("productm", value);
					}else if(cnt ==3) {
						map.put("products", value);
						cnt = 0;
						svDao.svProductInsert(map);
					}
				}
			}
		}
		return serviceNo;
	}

	@Override
	public void svDelete(HttpServletRequest request,int serviceNo) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		ServiceDto serviceDto = new ServiceDto();
		serviceDto.setSiteid(siteId);
		serviceDto.setEdtuser(userNo);
		serviceDto.setServiceno(serviceNo);
		
		svDao.svDelete(serviceDto);
	}

	// 서비스 멀티삭제
	@Override
	public void svMultiDelete(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int serviceNo = 0;
		String sCheck[] = request.getParameterValues("serviceno");
		
		ServiceDto serviceDto = new ServiceDto();
		
		serviceDto.setSiteid(siteId);
		serviceDto.setEdtuser(userNo);
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			serviceNo = Integer.parseInt(sCheck[i]);
			serviceDto.setServiceno(serviceNo);
			svDao.svDelete(serviceDto);
		}
	}
	// 서비스 처리이력 탭
	@Override
	public List<Map<String, Object>> svTabRact(HttpServletRequest request, int serviceNo) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		RactDto ractDto = new RactDto();
		ractDto.setSiteid(siteId);
		ractDto.setServiceno(serviceNo);
		
		List<Map<String, Object>> tabRact = svDao.svTabRact(ractDto);
		
		return tabRact;
	}

	// 서비스 이관 이력 탭
	@Override
	public List<Map<String, Object>> svTabConvey(HttpServletRequest request, int serviceNo) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ConveyDto conveyDto = new ConveyDto();
		conveyDto.setServiceno(serviceNo);
		conveyDto.setSiteid(siteId);
		List<Map<String,Object>> tabConvey = svDao.conveyTabList(conveyDto);
		
		return tabConvey;
	}
	// 서비스 이관 추가
	@Override
	public void svConveyInsert(HttpServletRequest request, ConveyDto conveyDto) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		ServiceDto serviceDto = new ServiceDto();
		
		conveyDto.setSiteid(siteId);
		conveyDto.setReguser(userNo);
		conveyDto.setEdtuser(userNo);
		
		svDao.conveyInsert(conveyDto);
		
		serviceDto.setSiteid(siteId);
		serviceDto.setEdtuser(userNo);
		serviceDto.setServicestep(6);
		svDao.svStepUpdate(serviceDto);
		
	}

	@Override
	public void svComplete(HttpServletRequest request, int serviceNo) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		ServiceDto serviceDto = new ServiceDto();
		
		serviceDto.setSiteid(siteId);
		serviceDto.setEdtuser(userNo);
		serviceDto.setServiceno(serviceNo);
		serviceDto.setServicestep(8);
		
		svDao.svStepUpdate(serviceDto);
		
	}

	@Override
	public ModelAndView svCalList(HttpServletRequest request) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		RewardDto rewardDto = new RewardDto();
		
		
		rewardDto.setSiteid(siteId);
		
		List<Map<String,Object>> svCalList = svDao.svCalList(rewardDto);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(svCalList);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		mView.addObject("schList",jsonStr);//캘린더 스케쥴
		mView.addObject("svSchList",svCalList);//캘린더 틀 목록.

		return mView;
	}
}
