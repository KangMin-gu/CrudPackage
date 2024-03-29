package saas.crud.crm.cp.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.cp.dao.CampaignDao;
import saas.crud.crm.cp.dto.CampaignDto;
import saas.crud.crm.cp.dto.CampaignFormDto;

@Service
public class CampaignServiceImpl implements CampaignService{

	@Autowired
	private CampaignDao campaignDao;
	
	@Autowired
	private CrudEngine crud;
	
	//캠페인 List
	@Override
	public ModelAndView campList(HttpServletRequest request) {
		
		ModelAndView mView = new ModelAndView();
		
		Map<String, Object> search = crud.searchParam(request);

		int totalRows = campaignDao.campTotalRows(search);
		
		int PAGE_ROW_COUNT = 10;
		int PAGE_DISPLAY_COUNT = 5;
		
		Map<String, Integer> page = crud.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> campList = campaignDao.campList(search);
		
		mView.addObject("camp",campList);
		mView.addObject("search",search);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		
		return mView;
	}

	//캠페인 Insert
	@Override
	public int campInsert(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CampaignDto campaignDto) {
		
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		
		
		int fileUploadSize = multipartHttpServletRequest.getFiles("file").size();
		List<MultipartFile> mFile = null;
		MultipartFile sFile = null;
		
		if(fileUploadSize > 0) {
			List<MultipartFile> fileUpload = multipartHttpServletRequest.getFiles("file");
			int serviceFileUploadLength = fileUpload.get(0).getOriginalFilename().length();
			if(serviceFileUploadLength > 0) {
				String fileSearchKey = crud.fileSearchKey(request);
				crud.fileUpload(response, multipartHttpServletRequest, fileUpload, sFile, fileSearchKey);
				campaignDto.setFilesearchkey(fileSearchKey);
			}
		}
		
		campaignDto.setReguser(userNo);
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		
		int campNo = campaignDao.campInsert(campaignDto);
		return campNo;
	}

	// 캠페인 Read
	@Override
	public ModelAndView campRead(HttpServletRequest request, int campNo) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		Map<String,Object> param = new HashMap<>();
		
		param.put("campno", campNo);
		param.put("siteid",siteId);
		
		CampaignDto campaignDto = new CampaignDto();
		campaignDto.setSiteid(siteId);
		campaignDto.setCampno(campNo);
		
		Map<String,Object> campInfo = campaignDao.campRead(param);
		
		if(campInfo != null) {
			if(campInfo.get("FILESEARCHKEY") != null) {
				String fileSearchKey = (String) campInfo.get("FILESEARCHKEY");
				campaignDto.setFilesearchkey(fileSearchKey);
				List<Map<String,Object>> campFile = campaignDao.campFile(campaignDto);
				mView.addObject("campFile",campFile);
			}
		}
		
		
		param.put("sendform", 1);
		Map<String,Object> campEmailForm = campaignDao.campFormRead(param);
		param.remove("sendform");
		param.put("sendform", 2);
		Map<String,Object> campSmsForm = campaignDao.campFormRead(param);
		param.remove("sendform");
		param.put("sendform", 4);
		Map<String,Object> campMmsForm = campaignDao.campFormRead(param);
		
		List<Map<String,Object>> targetList = campaignDao.campTargetRead(param);
		
		Map<String,Object> campTarget = new HashMap<>();
		String name;
		String value;
		String codeName;
		int targetListSize = targetList.size();
		
		for(int i = 0; i<targetListSize;i++) {
			if(targetList.get(i).get("VALUE") != null) {
				name = targetList.get(i).get("NAME").toString().toUpperCase();
				value = targetList.get(i).get("VALUE").toString();
				if(targetList.get(i).get("CODENAME") != null) {
					codeName = targetList.get(i).get("CODENAME").toString();
					campTarget.put(name, value);
					campInfo.put(name, codeName);
				}else {
					campInfo.put(name, value);
				}
			}
		}
		if(campEmailForm != null) {
			if(campEmailForm.get("FILESEARCHKEY1") != null) {
				String fileSearchKey = (String) campEmailForm.get("FILESEARCHKEY1");
				campaignDto.setFilesearchkey(fileSearchKey);
				List<Map<String,Object>> EMAILFILE1 = campaignDao.campFile(campaignDto);
				mView.addObject("EMAILFILE1",EMAILFILE1);
			}
		}
		if(campMmsForm != null) {
			if(campMmsForm.get("FILESEARCHKEY1") != null) {
				String fileSearchKey = (String) campMmsForm.get("FILESEARCHKEY1");
				campaignDto.setFilesearchkey(fileSearchKey);
				List<Map<String,Object>> MMSFILE1 = campaignDao.campFile(campaignDto);
				mView.addObject("MMSFILE1",MMSFILE1);
			}
			if(campMmsForm.get("FILESEARCHKEY2") != null) {
				String fileSearchKey = (String) campMmsForm.get("FILESEARCHKEY2");
				campaignDto.setFilesearchkey(fileSearchKey);
				List<Map<String,Object>> MMSFILE2 = campaignDao.campFile(campaignDto);
				mView.addObject("MMSFILE2",MMSFILE2);
			}
			if(campMmsForm.get("FILESEARCHKEY3") != null) {
				String fileSearchKey = (String) campMmsForm.get("FILESEARCHKEY3");
				campaignDto.setFilesearchkey(fileSearchKey);
				List<Map<String,Object>> MMSFILE3 = campaignDao.campFile(campaignDto);
				mView.addObject("MMSFILE3",MMSFILE3);
			}
		}
		
		
		
		int targetCustCnt = campaignDao.campTargetCustCnt(campaignDto);
		
		mView.addObject("campInfo", campInfo);
		mView.addObject("campTarget", campTarget);
		mView.addObject("targetCustCnt", targetCustCnt);
		mView.addObject("campEmailForm", campEmailForm);
		mView.addObject("campSmsForm", campSmsForm);
		mView.addObject("campMmsForm", campMmsForm);
		
		return mView;
	}
	//캠페인 수정
	@Override
	public void campUpdate(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CampaignDto campaignDto) {
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		
		int fileUploadSize = multipartHttpServletRequest.getFiles("file").size();
		List<MultipartFile> mFile = null;
		MultipartFile sFile = null;
		
		if(fileUploadSize > 0) {
			List<MultipartFile> fileUpload = multipartHttpServletRequest.getFiles("file");
			int serviceFileUploadLength = fileUpload.get(0).getOriginalFilename().length();
			if(serviceFileUploadLength > 0) {
				String fileSearchKey = campaignDto.getFilesearchkey();
				if(fileSearchKey == null) {
					fileSearchKey = crud.fileSearchKey(request);
				}
				crud.fileUpload(response, multipartHttpServletRequest, fileUpload, sFile, fileSearchKey);
				campaignDto.setFilesearchkey(fileSearchKey);
			}
		}
		
		campaignDao.campUpdate(campaignDto);
		
	}
	// 캠페인 단일 삭제
	@Override
	public void campDelete(HttpServletRequest request, int campNo) {
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		campaignDto.setCampno(campNo);
		
		campaignDao.campDelete(campaignDto);
		
	}
	// 캠페인 멀티삭제
	@Override
	public void campMultiDelete(HttpServletRequest request) {
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		String sCheck[] = request.getParameterValues("campno");
		
		
		
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setEdtuser(userNo);
		campaignDto.setSiteid(siteId);
		
		int length = sCheck.length;
		
		for(int i = 0; i < length; i++) {
			int campNo = Integer.parseInt(sCheck[i]);
			campaignDto.setCampno(campNo);
			campaignDao.campDelete(campaignDto);
		}
	}

	//캠페인 타겟 추출
	@Override
	public void campTargetInsert(HttpServletRequest request,int campNo) {
		
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		Map<String,Object> param = new HashMap();
		
		List<Object> test = new ArrayList<Object>();
		CampaignDto campaignDto = new CampaignDto();
		campaignDto.setSiteid(siteId);
		campaignDto.setEdtuser(userNo);
		campaignDto.setCampno(campNo);
		campaignDto.setCampstep(2);
		
		Enumeration params = request.getParameterNames();
		param.put("campno", campNo);
		param.put("userno", userNo);
		param.put("siteid", siteId);
		int order = campaignDao.targetOrderMax(param);
		
		param.put("order", order+1);
		
		if(order > 0) {
			campaignDao.campTargetDelete(param);
		}
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value != "") {
				if(name.contains("deny")) {
					Map<String,Object> deny = new HashMap();
					deny.put(name, value);
					test.add(name+"="+value);
				}
					param.put("name", name);
					param.put("value", value);
					param.put(name, value);
					campaignDao.campTargetInsert(param);
					campaignDao.campTargetHistInsert(param);
			}
		}
		param.put("deny", test);
		campaignDao.campTargetCustDelete(param);
		campaignDao.campTargetCustInsert(param);
		
		campaignDao.campStepUpdate(campaignDto);
	}

	// 캠페인 발송 Insert 및 Update
	@Override
	public void campFormInsertUpdate(HttpServletResponse response, MultipartHttpServletRequest multipartHttpServletRequest, HttpServletRequest request,@ModelAttribute CampaignFormDto campaignFormDto,@PathVariable int campNo) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		campaignFormDto.setSiteid(siteId);
		campaignFormDto.setReguser(userNo);
		campaignFormDto.setEdtuser(userNo);		
		campaignFormDto.setCampno(campNo);
		int sendForm = campaignFormDto.getSendform();
		String sendTime = campaignFormDto.getSendtime();
		int sendType = campaignFormDto.getSendtype();
		if(sendType != 1) {
			if(sendTime.contains(",")) {
				sendTime = sendTime.substring(0, 5);
				campaignFormDto.setSendtime(sendTime);
			}
		}
		
		MultipartFile sFile = null;
		int fileCnt = 0;
		if(sendForm == 4) {
			
			int fileUploadSize1 = multipartHttpServletRequest.getFiles("file1").size();
			
			if(fileUploadSize1 > 0) {
				List<MultipartFile> fileUpload1 = multipartHttpServletRequest.getFiles("file1");
				int serviceFileUploadLength = fileUpload1.get(0).getOriginalFilename().length();
				if(serviceFileUploadLength > 0) {
					String fileSearchKey = crud.fileSearchKey(request);
					crud.fileUpload(response, multipartHttpServletRequest, fileUpload1, sFile, fileSearchKey);
					campaignFormDto.setFilesearchkey1(fileSearchKey);
					fileCnt ++;
				}
			}
			
			int fileUploadSize2 = multipartHttpServletRequest.getFiles("file2").size();
			
			if(fileUploadSize2 > 0) {
				List<MultipartFile> fileUpload2 = multipartHttpServletRequest.getFiles("file2");
				int serviceFileUploadLength = fileUpload2.get(0).getOriginalFilename().length();
				if(serviceFileUploadLength > 0) {
					String fileSearchKey = crud.fileSearchKey(request);
					crud.fileUpload(response, multipartHttpServletRequest, fileUpload2, sFile, fileSearchKey);
					campaignFormDto.setFilesearchkey2(fileSearchKey);
					fileCnt ++;
				}
			}
			
			int fileUploadSize3 = multipartHttpServletRequest.getFiles("file3").size();
			if(fileUploadSize3 > 0) {
				List<MultipartFile> fileUpload3 = multipartHttpServletRequest.getFiles("file3");
				int serviceFileUploadLength = fileUpload3.get(0).getOriginalFilename().length();
				if(serviceFileUploadLength > 0) {
					String fileSearchKey = crud.fileSearchKey(request);
					crud.fileUpload(response, multipartHttpServletRequest, fileUpload3, sFile, fileSearchKey);
					campaignFormDto.setFilesearchkey3(fileSearchKey);
					fileCnt ++;
				}
			}	
		}
		
		campaignFormDto.setFilecnt(fileCnt);
		List<CampaignFormDto> campaignForm = campaignDao.campFormList(campaignFormDto);

		int campaignFormSize = campaignForm.size();
		if(campaignFormSize == 0) {
			campaignDao.campFormInsert(campaignFormDto);
		}else {
			for(int i = 0; i < campaignFormSize; i++) {
				if(sendForm == campaignForm.get(i).getSendform()) {
					campaignFormDto.setNo(campaignForm.get(i).getNo());
					campaignDao.campFormUpdate(campaignFormDto);
				}else {
					campaignDao.campFormInsert(campaignFormDto);
					break;
				}
			}
		}
		CampaignDto campaignDto = new CampaignDto();
		
		campaignDto.setSiteid(siteId);
		campaignDto.setEdtuser(userNo);
		campaignDto.setCampno(campNo);
		campaignDto.setCampstep(3);
		campaignDao.campStepUpdate(campaignDto);
	}

	// 캠페인 테스트 발송
	@Override
	public void campTestSend(HttpServletRequest request, int campNo) {
		
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		Map<String, Object> search = crud.searchParam(request);
		search.put("userno",userNo);
		
		campaignDao.campTestSend(search);

	}

	
	// 캠페인 발송
	@Override
	public void campSend(HttpServletRequest request, int campNo) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int sendForm = Integer.parseInt(request.getParameter("sendform").toString());
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("userno", userNo);
		param.put("siteid", siteId);
		param.put("campno", campNo);
		param.put("sendform", sendForm);
		
		campaignDao.campSend(param);

	}

	// 캠페인 추출 이력탭
	@Override
	public List<Map<String, Object>> campTabTargetHistory(HttpServletRequest request, int campNo) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		Map<String,Object> param = new HashMap<>();
		
		param.put("siteid", siteId);
		param.put("campno", campNo);
		
		List<Map<String,Object>> tabHistory = campaignDao.campTabTargetHistory(param);
		
		int listSize = tabHistory.size();
		
		Map<String,Object> tempMap = new HashMap<>();
		
		StringBuffer sb = new StringBuffer();
		List<Map<String,Object>> history = new ArrayList<Map<String,Object>>();
		int maxOrder = campaignDao.targetOrderMax(param);
		int campOrder;
		String name="";
		String regdate = "";
		String strHistory="";
		
		for(int j = 1; j<= maxOrder; j++) {
			for(int i = 0; i < listSize; i++) {
				tempMap = tabHistory.get(i);
				campOrder = Integer.parseInt(tempMap.get("CAMPORDER").toString());
				if(j==campOrder) {
					if(tempMap.get("CODENAME") != null) {
						if(name.equals(tempMap.get("CODENAME").toString())) {
							sb.append(tempMap.get("VALUE"));
							sb.append("|");
							regdate = tempMap.get("REGDATE").toString();
							name = tempMap.get("CODENAME").toString();
						}else {
							if(tempMap.get("CODENAME").toString().contains("거부")) {
								sb.append(tempMap.get("CODENAME"));
								sb.append("|");
							}else {
								sb.append(tempMap.get("CODENAME"));
								sb.append("-");
								sb.append(tempMap.get("VALUE"));
								sb.append("|");
								name = tempMap.get("CODENAME").toString();
								regdate = tempMap.get("REGDATE").toString();
							}
						}
					}
				}else {
					name ="";
				}
			}
			Map<String,Object> input = new HashMap<>();
			strHistory = sb.toString();
			input.put("regdate", regdate);
			input.put("history", strHistory);
			history.add(j-1, input);
			sb.delete(0,sb.toString().length());
		}
		
		return history;
	}

	// 캠페인 추출 대상 고객 탭
	@Override
	public Map<String, Object> campTabTargetCustList(HttpServletRequest request, int campNo) {
		
		Map<String, Object> search = crud.searchParam(request);
		search.put("campno",campNo);
		int totalTargetCustRows = campaignDao.campTargetCustRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 20;
		
		Map<String, Integer> page = crud.paging(request, totalTargetCustRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		
		List<Map<String,Object>> campaignTargetCustList = campaignDao.campTargetCustList(search);
		
		Map<String,Object> total = new HashMap<>();
		total.put("tabCust",campaignTargetCustList);
		total.put("page",page);
		total.put("search",search);
		total.put("totalRows",totalTargetCustRows);
		return total;
	}

	// 캠페인 대상추출 Read
	@Override
	public List<Map<String, Object>> campTargetRead(HttpServletRequest request, int campNo) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		Map<String,Object> param = new HashMap<>();
		param.put("campno", campNo);
		param.put("siteid", siteId);
		List<Map<String,Object>> targetList = campaignDao.campTargetRead(param);
		return targetList;
	}

	// 캠페인 일정 List(캘린더)
	@Override
	public ModelAndView campCalList(HttpServletRequest request) {
		
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		ModelAndView mView = new ModelAndView();
		CampaignDto campaignDto = new CampaignDto();
		
		
		campaignDto.setSiteid(siteId);
		
		List<Map<String,Object>> campCalList = campaignDao.campCalList(campaignDto);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(campCalList);
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		mView.addObject("schList",jsonStr);//캘린더 스케쥴
		mView.addObject("comSchList",campCalList);//캘린더 틀 목록.

		return mView;
	}
	
	

	
}