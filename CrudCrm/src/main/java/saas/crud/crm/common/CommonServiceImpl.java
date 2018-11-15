package saas.crud.crm.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import saas.crud.crm.ce.FileDto;
import saas.crud.crm.ce.PagingCommon;



@Service
public class CommonServiceImpl implements CommonService {

	@Autowired 
	CommonDao commonDao;
	
	//담당자 검색 팝업 페이지 데이터
	@Override
	public ModelAndView svcPopGetUserName(HttpServletRequest request) {
		
		Map<String,Object> searchVal = new HashMap<String,Object>();
		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);
		
		//username 이 null 또는 공백이 아니면 대입. 
		if(request.getParameter("username") != null && !request.getParameter("username").toString().trim().equals("") ) { 
			String username = request.getParameter("username").toString();
			searchVal.put("username", username);
		}		
		//***** 페이징설정 *******
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
		
		int totalRows = commonDao.totalcntUser(searchVal);//총 자료수 
		
		PagingCommon pages = new PagingCommon();
		Map<String,Integer> page = pages.paging(request, totalRows,pageRowCount,pageDisplayCount);
		
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
		
		int totalRows = commonDao.totalcntClient(searchVal);
		
		//페이징
		int pageRowCount = 10; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
		
		PagingCommon pages = new PagingCommon();
		
		Map<String,Integer> page = pages.paging(request, totalRows,pageRowCount,pageDisplayCount);
		
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
		FileDto fileRequest = new FileDto(); 
		fileRequest.setSiteid(siteId);
		fileRequest.setFileid(fileId);
		FileDto fileInfo = commonDao.noteDownload(fileRequest);
		ModelAndView mView = new ModelAndView();
		mView.addObject("fileInfo", fileInfo);
		return mView;
	}

}
