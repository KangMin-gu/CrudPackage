package saas.crud.crm.sv.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
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

	// 서비스 List
	@Override
	public ModelAndView svList(HttpServletRequest request) {

		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);

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
		
		serviceDto.setSiteid(siteId);
		serviceDto.setEdtuser(userNo);
		serviceDto.setReguser(userNo);
		rewardDto.setSiteid(siteId);
		rewardDto.setEdtuser(userNo);
		ractDto.setSiteid(siteId);
		ractDto.setEdtuser(userNo);
		
		List<MultipartFile> serviceFileUpload = multipartHttpServletRequest.getFiles("servicefile");
		List<MultipartFile> rewardFileUpload = multipartHttpServletRequest.getFiles("rewardfile");
		List<MultipartFile> ractFileUpload = multipartHttpServletRequest.getFiles("ractfile");
		List<MultipartFile> mFile = null;
		MultipartFile sFile = null;
		
		if(serviceFileUpload != null) {			
			String fileSearchKey = crud.fileSearchKey(request);
			// 이부분 수정필요
			//crudEngine.MultiFileUpload(response, request, fileUpload, fileSearchKey);
			crud.fileUpload(response, multipartHttpServletRequest, serviceFileUpload, sFile, fileSearchKey);
			serviceDto.setFilesearchkey(fileSearchKey);
		}
		if(rewardFileUpload != null) {			
			String fileSearchKey = crud.fileSearchKey(request);
			// 이부분 수정필요
			//crudEngine.MultiFileUpload(response, request, fileUpload, fileSearchKey);
			crud.fileUpload(response, multipartHttpServletRequest, rewardFileUpload, sFile, fileSearchKey);
			rewardDto.setFilesearchkey(fileSearchKey);
		}
		if(ractFileUpload != null) {			
			String fileSearchKey = crud.fileSearchKey(request);
			// 이부분 수정필요
			//crudEngine.MultiFileUpload(response, request, fileUpload, fileSearchKey);
			crud.fileUpload(response, multipartHttpServletRequest, ractFileUpload, sFile, fileSearchKey);
			ractDto.setFilesearchkey(fileSearchKey);
		}
		
		int serviceNo = serviceDto.getServiceno();
		if(serviceNo != 0) {
			
			svDao.svUpdate(serviceDto);
			
		}else {
			serviceDto.setIsdelete(0);
			serviceNo = svDao.svInsert(serviceDto);
			
		}
		
		String visitDate = rewardDto.getVisitdate();
		
		 int rewardNo = rewardDto.getRewardno();
		
		 // 방문 일정이 잡히면 현상파악을 Insert 하게됨.
		if(visitDate.length() > 0) {
			if(rewardNo != 0) {
				svDao.rewardUpdate(rewardDto);
			}else {
				rewardDto.setServiceno(serviceNo);
				rewardDto.setReguser(userNo);
				svDao.rewardInsert(rewardDto);
				serviceDto.setServicestep(2);
				svDao.svStepUpdate(serviceDto);
			}
		}
		
		int ractOwner = ractDto.getRactowner();
		int ractNo = ractDto.getRactno();
		
		if(ractOwner != 0) {
			if(ractNo != 0) {
				svDao.ractUpdate(ractDto);	
			}else{
				ractDto.setServiceno(serviceNo);
				ractDto.setReguser(userNo);
				svDao.ractInsert(ractDto);
				serviceDto.setServicestep(4);
				svDao.svStepUpdate(serviceDto);
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
		String sCheck[] = request.getParameterValues("rcvno");
		
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
		serviceDto.setServicestep(4);
		svDao.svStepUpdate(serviceDto);
		
	}
}

