package saas.crud.crm.cu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.PagingCommon;
import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;



@Service
public class CustServiceImpl implements CustService {

	@Autowired
	CustDao custDao;

	@Override
	public ModelAndView svcCustList(HttpServletRequest request) {
		
		Map<String, Object> searchVal = new HashMap<String, Object>();;
		//**********여기부터 검색조건설정*************************************** 
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);

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
		if( request.getParameter("cliname") != null && !request.getParameter("cliname").toString().trim().equals("") )  { 	
			searchVal.put("cliname",request.getParameter("cliname"));
		}
		
		if(request.getParameter("mobile") != null && !request.getParameter("mobile").toString().trim().equals("") ) {
			searchVal.put("mobile",request.getParameter("mobile").toString());
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
		//데이트 yyyy/mm/dd-> yyyymmdd 
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
		//*********************총 자료수 검색조건끝****************************************
			
		//총자료수
		int totalRows = custDao.totalCnt(searchVal);
				
		//paging
		
		int pageRowCount = 20; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
		
		PagingCommon  pages = new PagingCommon();			
		 
		Map<String, Integer> page =  pages.paging(request, totalRows,pageRowCount,pageDisplayCount);//page text 리턴 
		
		page.put("totalRows", totalRows);
		
		//출력할 row 범위설정 
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
	
	//유저 멀티 삭제 
	@Override
	public int svcCustDelete(HttpServletRequest request) {
		
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		String[] custno = request.getParameterValues("custno");
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		CustDto custDto=new CustDto();
		custDto.setSiteid(siteid);
		custDto.setUserno(userno);
		
		int size = custno.length; 
		int res = 0; //실행 된 건수 체크용 카운터 현재 미사용
		//custno 배열 수 만큼 dao호출  
		for (int i=0;i<size;i++) {
			if(custno[i].toString()!=null) {
				custDto.setCustno(Integer.parseInt(custno[i].toString()));	
				res += custDao.custDelete(custDto);			
			}			
		}	
		return res;
	}
	
	//상세페이지
	public Map<String,Object> svcCustDetail(int custno, int siteid){
		Map<String,Object> custVal = new HashMap<String,Object>();
		custVal.put("custno",custno);
		custVal.put("siteid", siteid);
		Map<String,Object> detailMap = custDao.custDetail(custVal);
		return  detailMap;
	}
	
	//고객 추가 페이지. 기본 정보 셋팅 
	@Override
	public ModelAndView svcCustForm(HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		int userno = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String username = request.getSession().getAttribute("USERNAME").toString();//담당자는 로그인한 유저명으로 기본설정
		mView.addObject("SESSIONUSERNO",userno);
		mView.addObject("SESSIONUSERNAME",username);
		return mView;
	}


	//고객 추가 dao실행
	@Override
	public int svcCustformInsert(HttpServletRequest request, CustDto custDto, CustDenyDto custDenyDto) {
		//세션 정보 값 DTO셋팅  
		int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		//필수 값 설정. 등록/수정자는 로그인한 유저로 설정
		custDto.setReguser(userno);
		custDto.setEdituser(userno);
		custDto.setSiteid(siteid);
		
		//고객 추가 dao호출 추가된 고객pk 값 리턴
		int custno = custDao.custformInsert(custDto);
		
		//수신거부 테이블 default 값 + 파라미터 dto 값 전달  
		custDenyDto.setCustno(custno);
		custDenyDto.setReguser(userno);
		custDenyDto.setEdituser(userno);
		//수신거부 테이블에 해당 고객 데이터 생성
		custDao.custformInsertDeny(custDenyDto);
		
		return custno;//상세 페이지 이동을 위해 생성된 pk값 리턴 
	}

	//고객 수정 - form 화면에 바인딩 할 데이터 전달 
	public Map<String,Object> svcCustUpdateForm(int custno){
		Map<String,Object> map = custDao.custUpdateForm(custno);
		return  map;
	}
	
	//고객 수정 실행 
	@Override
	public int svcCustformUpdate(HttpServletRequest request, CustDto custDto, CustDenyDto custDenyDto) {
			//세션 정보 값 DTO셋팅  
			int userno  = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
			
			custDto.setEdituser(userno); //수정자는 로그인한 본인
			custDao.custformUpdate(custDto);//업데이트 dao호출
			
			//업데이트한 pk값 수신거부 dto에 설정
			int custno = custDto.getCustno();
			custDenyDto.setCustno(custno);
			custDenyDto.setEdituser(userno);
			
			//수신거부 dao 호출  
			custDao.custformUpdateDeny(custDenyDto);				
			return custno;
	}



}
