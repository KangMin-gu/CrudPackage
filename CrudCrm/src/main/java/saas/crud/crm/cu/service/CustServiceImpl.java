package saas.crud.crm.cu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.common.PagingCommon;
import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;



@Service
public class CustServiceImpl implements CustService {

	@Autowired
	CustDao custDao;

	@Override
	public ModelAndView svcCustList(HttpServletRequest request) {
		//todo. 페이지 설정 동적 변경. 
		
		Map<String, Object> searchVal = new HashMap<String, Object>();;
		//**********여기부터 검색조건설정*************************************** 
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);

		String test = request.getParameter("custname");
		if (test =="") {
			test = null;
		}

		//검색조건 설정 null 또는 공백이 아니면 if실행
		if( request.getParameter("custname") != null && !request.getParameter("custname").toString().trim().equals("") )  { 	
			searchVal.put("custname",request.getParameter("custname"));
		}
		
		if(request.getParameter("owner") != null ) {
			searchVal.put("owner",request.getParameter("owner"));
		}
		if(request.getParameter("ownername") != null ) {
			searchVal.put("ownername",request.getParameter("ownername"));
		}
		if(request.getParameter("clino") != null ) {
			searchVal.put("clino",request.getParameter("clino"));
		}
		if(request.getParameter("cliname") != null ) {
			searchVal.put("cliname",request.getParameter("cliname"));
		}
		
		if(request.getParameter("mobile") != null && !request.getParameter("mobile").toString().trim().equals("") ) {
			searchVal.put("mobile",request.getParameter("mobile").toString());
		}
		
		if(request.getParameter("company") != null) {
			searchVal.put("company",request.getParameter("company"));
		}
		
		if(request.getParameter("email") != null && !request.getParameter("email").toString().trim().equals("") ) {
			searchVal.put("email",request.getParameter("email") );
		}
		
		if(request.getParameter("custgubun") != null) {
			searchVal.put("custgubun",request.getParameter("custgubun"));
		}else {
			searchVal.put("custgubun",0);//선택 값이 없다면 기본값은 0
		}
		
		if(request.getParameter("custgrade") != null) { 
			searchVal.put("custgrade",request.getParameter("custgrade"));
		}else {
			searchVal.put("custgrade",0);//선택 값이 없다면 기본값은 0
		}
		
		if(request.getParameter("fromregdt") != null && !request.getParameter("fromregdt").toString().trim().equals("") ) {
			String temp = request.getParameter("fromregdt");//	yyyy/mm/dd
			String fromdt = temp.replace("/",""); // yyyymmdd
			searchVal.put("fromregdt", fromdt);
		}
		if(request.getParameter("toregdt") != null && !request.getParameter("toregdt").toString().trim().equals("")) {
			String temp = request.getParameter("toregdt");//	yyyy/mm/dd
			String todt = temp.replace("/",""); // yyyymmdd
			searchVal.put("toregdt", todt);
		}
		//정보활용동의 라디오버튼
		if(request.getParameter("infoagree") != null) {
			searchVal.put("infoagree",request.getParameter("infoagree"));//선택된 값으로 저장
		}else {
			searchVal.put("infoagree",0);//선택 값이 없다면 기본값은 0
		}
		if( request.getParameter("cliname") != null && !request.getParameter("cliname").toString().trim().equals("") )  { 	
			searchVal.put("cliname",request.getParameter("cliname"));
		}
			
		//총자료수
		int totalRows = custDao.totalCnt(searchVal);
		//*********************검색조건끝****************************************
		
		//paging
		PagingCommon  pages = new PagingCommon();			
		 
		Map<String, Integer> page =  pages.paging(request, totalRows,20,5); 
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		//고객 리스트 출력
		List<Map<String,Object>> custList = custDao.custList(searchVal);
	
		ModelAndView resMap = new ModelAndView();
		resMap.addObject("page", page);//페이징 text int 저장
		resMap.addObject("custList", custList);// 선택 된 페이지 rownum에 해당하는 리스트
		resMap.addObject("searchVal",searchVal);//검색조건.
				
		return resMap;
				
	}
	
	//유저 삭제 
	@Override
	public int svcCustDelete(HttpServletRequest request) {
		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		String[] custno = request.getParameterValues("custno");
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		CustDto custDto=new CustDto();
		custDto.setSiteid(siteid);
		custDto.setUserno(userno);
		
		int size = custno.length; 
		int res = 0; 
	
		for (int i=0;i<size;i++) {
			if(custno[i].toString()!=null) {
				custDto.setCustno(Integer.parseInt(custno[i].toString()));	
				res += custDao.custDelete(custDto);			
			}			
		}
		
		
		return res;
	}
	
	//상세페이지
	public Map<String,Object> svcCustDetail(int custno){
		Map<String,Object> map = custDao.custDetail(custno);
		return  map;
	}
	//업데이트 - form화면 
	public Map<String,Object> svcCustUpdateForm(int custno){
		Map<String,Object> map = custDao.custUpdateForm(custno);
		return  map;
	}


	@Override
	public int svcCustformInsert(HttpServletRequest request, CustDto custDto, CustDenyDto custDenyDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		custDto.setReguser(userno);
		custDto.setEdituser(userno);
		custDto.setSiteid(siteid);
			
		int custno = custDao.custformInsert(custDto);//추가된 고객pk 값 리턴
		
		custDenyDto.setCustno(custno);
		custDenyDto.setReguser(userno);
		custDenyDto.setEdituser(userno);
		custDao.custformInsertDeny(custDenyDto);
		
		return custno;
	}

	//고객 추가 페이지에 필요한 정보 셋팅 
	@Override
	public ModelAndView svcCustForm(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String username = request.getSession().getAttribute("USERNAME").toString();
		mView.addObject("SESSIONUSERNO",userno);
		mView.addObject("SESSIONUSERNAME",username);
		return mView;
	}

	//고객 수정 실행 
	@Override
	public int svcCustformUpdate(HttpServletRequest request, CustDto custDto, CustDenyDto custDenyDto) {
		//세션 정보 값 DTO셋팅  
			int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			custDto.setEdituser(userno);
			custDao.custformUpdate(custDto);	
			int custno = custDto.getCustno();
			custDenyDto.setCustno(custno);
			custDenyDto.setEdituser(userno);
			
			custDao.custformUpdateDeny(custDenyDto);
				
			return custno;
	}

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
		
		int totalRows = custDao.totalcntUser(searchVal);
		
		PagingCommon pages = new PagingCommon();
		Map<String,Integer> page = pages.paging(request, totalRows,10,5);
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");	
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		List<Map<String,Object>> userList = custDao.popUserList(searchVal);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page",page);
		mView.addObject("searchVal",searchVal);
		mView.addObject("userList",userList);
		return mView;
	}

	@Override
	public ModelAndView svcPopGetClientName(HttpServletRequest request) {
		Map<String,Object> searchVal = new HashMap<String,Object>();
		int PAGE_ROW_COUNT=10;
		int PAGE_DISPLAY_COUNT=10;
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);
		//username 이 null 또는 공백이 아니면 대입. 
		if(request.getParameter("cliname") != null && !request.getParameter("cliname").toString().trim().equals("") ) { 
			String cliname = request.getParameter("cliname").toString();
			searchVal.put("cliname", cliname);
		}		
		
		int totalRows = custDao.totalcntClient(searchVal);
		
		PagingCommon pages = new PagingCommon();
		Map<String,Integer> page = pages.paging(request, totalRows,PAGE_ROW_COUNT,PAGE_DISPLAY_COUNT);
		
		page.put("totalRows", totalRows);
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");	
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
		
		List<Map<String,Object>> clientList = custDao.popClientList(searchVal);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("page",page);
		mView.addObject("searchVal",searchVal);
		mView.addObject("clientList",clientList);
		return mView;
	}






	



}
