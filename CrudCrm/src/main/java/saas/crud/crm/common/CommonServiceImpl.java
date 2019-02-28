package saas.crud.crm.common;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.ce.CrudRemote;
import saas.crud.crm.ce.EUploadDto;
import saas.crud.crm.ce.MailDao;
import saas.crud.crm.ce.MailDto;
import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.nt.dao.NoteDao;
import saas.crud.crm.nt.dto.NoteCategoryDto;
import saas.crud.crm.sa.dao.ClientDao;
import saas.crud.crm.sa.dao.SalesDao;



@Service
public class CommonServiceImpl implements CommonService {

	@Autowired 
	private CommonDao commonDao;
	
	@Autowired
	private CustDao custDao;
	
	@Autowired
	private ClientDao clientDao;
	
	@Autowired
	private CrudEngine crud;
	
	@Autowired
	private MailDao mailDao;
	
	@Autowired
	private NoteDao ntDao;
	
	@Autowired
	private CrudRemote crudRemote;

	//담당자 검색 팝업 페이지 데이터
	@Override
	public ModelAndView svcPopGetUserName(HttpServletRequest request) {
		
		Map<String,Object> searchVal = crud.searchParam(request);
		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		if(request.getParameter("chkauth") != null) {
		int chkAuth = Integer.parseInt(request.getParameter("chkauth").toString());
		searchVal.put("chkauth", chkAuth);
		}
		searchVal.put("siteid", siteid);
		
				
		//***** 페이징설정 *******
		int pageRowCount = 5; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
		
		int totalRows = commonDao.totalcntUser(searchVal);//총 자료수 

		Map<String,Integer> page = crud.paging(request, totalRows,pageRowCount,pageDisplayCount);
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");	
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		List<Map<String,Object>> userList = commonDao.popUserList(searchVal);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page",page);
		mView.addObject("searchVal",searchVal);
		mView.addObject("userList",userList);
		return mView;
	}

	//거래처팝업
	@Override
	public ModelAndView svcPopGetClientName(HttpServletRequest request) {
		Map<String,Object> searchVal = new HashMap<String,Object>();
		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);
		//username 이 null 또는 공백이 아니면 대입. 
		if(request.getParameter("cliname") != null && !request.getParameter("cliname").toString().trim().equals("") ) { 
			String cliname = request.getParameter("cliname").toString();
			searchVal.put("cliname", cliname);
		}		
		if(request.getParameter("parentid") != null) { //호출한 필드명. 페이징시 값 유지를 위한 설정
			String parentid = request.getParameter("parentid").toString();
			searchVal.put("parentid", parentid);
		}
		
		
		int totalRows = commonDao.totalcntClient(searchVal);
		
		//페이징
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  

		Map<String,Integer> page = crud.paging(request, totalRows,pageRowCount,pageDisplayCount);
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");	
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		List<Map<String,Object>> clientList = commonDao.popClientList(searchVal);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page",page);
		mView.addObject("searchVal",searchVal);
		mView.addObject("clientList",clientList);
		return mView;
	}
	
	//내부통지 파일다운로드
	@Override
	public ModelAndView noteDownload(HttpServletRequest request, int fileId) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		EUploadDto fileRequest = new EUploadDto(); 
		fileRequest.setSiteid(siteId);
		fileRequest.setFileid(fileId);
		EUploadDto fileInfo = commonDao.noteDownload(fileRequest);
		ModelAndView mView = new ModelAndView();
		mView.addObject("fileInfo", fileInfo);
		return mView;
	}
	
	//사이트로고 업로드
	@Override
	public EUploadDto logoUplaod(HttpServletResponse response, HttpServletRequest request, MultipartRequest multipartRequest) {
		MultipartFile mFile=multipartRequest.getFile("logo");
		// 여기 수정 필요
		//EUploadDto uploadInfo = crud.singleFileUpload(response, request, mFile);
		EUploadDto uploadInfo = new EUploadDto();
		return uploadInfo;
	}

	// 고객 팝업 
	@Override
	public ModelAndView svcPopGetCustName(HttpServletRequest request) {
		Map<String, Object> searchVal = crud.searchParam(request);
		
		int totalRows = commonDao.totalCntCust(searchVal);
		
		//페이징
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  

		Map<String,Integer> page = crud.paging(request, totalRows,pageRowCount,pageDisplayCount);
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");	
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		List<Map<String,Object>> custList = commonDao.popCustList(searchVal);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page",page);
		mView.addObject("searchVal",searchVal);
		mView.addObject("custList",custList);
		return mView;
	}

	// custpopup에서 클릭했을때 ajax 처리해서 sv 화면에 데이터를 넣어줌
	@Override
	public Map<String, Object> svcPopGetCustDetail(HttpServletRequest request, int custNo) {
		Map<String,Object> cstVal = new HashMap<>();
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		cstVal.put("siteid", siteId);
		cstVal.put("custno", custNo);
		
		Map<String,Object> custDetail = custDao.custDetail(cstVal);
		return custDetail;
	}

	@Override
	public Map<String, Object> svcPopGetClientDetail(HttpServletRequest request, int cliNo) {
		Map<String,Object> cliVal = new HashMap<>();
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		cliVal.put("siteid", siteId);
		cliVal.put("clino", cliNo);
		
		Map<String,Object> cliDetail = clientDao.clientDetail(cliVal);
		return cliDetail;
	}

	@Override
	public void mailClick(HttpServletRequest request) {
		Map<String,Object> remote = crudRemote.getRemote(request);
		int emailLogId = Integer.parseInt(request.getParameter("emaillogid"));
		int custNo = 0;
		int userNo = 0;
		if(request.getParameter("CUSTNO") != null) {
			custNo = Integer.parseInt(request.getParameter("CUSTNO"));
		}
		if(request.getParameter("USERNO") != null) {
			userNo = Integer.parseInt(request.getParameter("USERNO"));
		}
		int siteId = Integer.parseInt(request.getParameter("SITEID"));
		MailDto mailDto = new MailDto();
		
		
		remote.put("custno", custNo);
		remote.put("userno", userNo);
		remote.put("siteid", siteId);
		
		mailDao.clickHistory(remote);
		
		mailDto.setEmaillogid(emailLogId);
		mailDao.mailClick(mailDto);
	}
	
	//내부통지 팝업 
	@Override
	public ModelAndView svcPopNote(HttpServletRequest request) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		//유저정보
		List<Map<String,String>> adminMail = ntDao.adminMail(siteId);
		
		NoteCategoryDto noteCategory = new NoteCategoryDto();
		noteCategory.setUserno(userNo);
		noteCategory.setSiteid(siteId);
		
		List<Map<String, Object>> category = ntDao.noteSet(noteCategory);
		ModelAndView mView = new ModelAndView();
		mView.addObject("category", category);
		mView.addObject("adminMail",adminMail);
		
		//팝업 띄우기 전에 주소값 가져옴 
		mView.addObject("url",request.getHeader("referer"));
		
		return mView;
	}

	@Override
	public void mailDeny(HttpServletRequest request) {
		int emaillogid = Integer.parseInt(request.getParameter("emaillogid"));
		
		MailDto mailDto = new MailDto();
		//String test = crudRemote.getRemoteAddr(request);
		mailDto.setEmaillogid(emaillogid);
		mailDto.setReserv(0);
		mailDao.mailDeny(mailDto);
	}
	//영업 팝업
	@Override
	public ModelAndView svcPopGetSalesName(HttpServletRequest request) {
		Map<String,Object> searchVal = crud.searchParam(request);
				
		int totalRows = commonDao.totalcntSales(searchVal);
		
		//페이징
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  

		Map<String,Integer> page = crud.paging(request, totalRows,pageRowCount,pageDisplayCount);
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");	
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		List<Map<String,Object>> salesList = commonDao.popSalesList(searchVal);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page",page);
		mView.addObject("searchVal",searchVal);
		mView.addObject("salesList",salesList);
		return mView;
	}

	@Override
	public void sendSms(HttpServletRequest request) {
		Map<String,Object> param = crud.searchParam(request);

		if(Integer.parseInt(param.get("sendtype").toString()) == 0) {
			// 즉시발송
			if(Integer.parseInt(param.get("lengthType").toString()) == 0) {
				// sms인경우
				commonDao.DirectSendSms(param);
			}else {
				// lms 인경우
				commonDao.DirectSendLms(param);
			}
			
		}else {
			// 예약발송
			if(Integer.parseInt(param.get("lengthType").toString()) == 0) {
				// sms 인경우
				commonDao.DelaySendSms(param);
			}else {
				// lms 인경우
				commonDao.DelaySendLms(param);
			}
			
		}
	}
	public String uploadFilesFromTinyMCE(String prefix, MultipartFile files[], boolean isMain,HttpServletRequest request) {
	    try {
	        
	        StringBuffer result = new StringBuffer();
	        Calendar calendar = Calendar.getInstance();
	        String years= String.valueOf(calendar.get(Calendar.YEAR)) ;
			String months= String.valueOf(calendar.get(Calendar.MONTH) + 1) ;
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String currentTimestamp = sd.format(calendar.getTime());
			
			String folder = request.getSession().getServletContext().getRealPath("/") + prefix;// +"\\" +years +"\\" + months;

	        for (int i = 0; i < files.length; i++) {
	            if (!files[i].isEmpty()) {
	                try {
	                    try {
	                        File theDir = new File(folder);
	                        theDir.mkdir();
	                    } catch (SecurityException se) {
	                        se.printStackTrace();
	                    }
	                    String path = "";
	                    path = folder +"\\"+ currentTimestamp +"_"+ files[i].getOriginalFilename();
	                    File destination = new File(path);
	                    files[i].transferTo(destination);
	                    result.append("/tinyMCE/"+currentTimestamp +'_'+ files[i].getOriginalFilename());
	                } catch (Exception e) {
	                    throw new RuntimeException("이미지 저장에 실패하였습니다.", e);
	                }

	            } else
	                result.append(files[i].getOriginalFilename() + " 실패. ");
	        }
	        return result.toString();

	    } catch (Exception e) {
	        return "이미지 파일을 업로드 하는중 문제가 생겼습니다." + " => " + e.getMessage();
	    }
	}

	@Override
	public void mailSend(HttpServletResponse response, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int fromUserNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());			
		String toCust = request.getParameter("custmail");
		String ccUserList[] = request.getParameterValues("ccuser");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		int custNo = Integer.parseInt(request.getParameter("custno").toString());
		
		Map<String,Object> param = new HashMap();
		
		param.put("siteid", siteId);
		param.put("custno", custNo);
		param.put("content", content);
		param.put("title", title);
		param.put("tocust", toCust);
		
		if(ccUserList != null) {
			for(String b : ccUserList) {
				int ccUserNo = Integer.parseInt(b);
				param.put("tocust", ccUserNo);
				

			}
		}
		
		
		
	}

}
