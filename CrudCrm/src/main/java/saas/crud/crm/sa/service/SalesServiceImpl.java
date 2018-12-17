package saas.crud.crm.sa.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sa.dao.SalesDao;
import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SaleStateDto;
import saas.crud.crm.sa.dto.SalesCustDto;
import saas.crud.crm.sa.dto.SalesDto;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired 
	private SalesDao salesDao;
	@Autowired
	private CrudEngine crud;
	
	//영업리스트
	@Override
	public ModelAndView svcSalesList(HttpServletRequest request) {
		Map<String, Object> searchVal = new HashMap<String, Object>();//검색 조건을 담을 변수 
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);
		
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {//requeset 값이 있으면 while문 가동 
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			
			if(name.equals("owner") || name.equals("clino") || name.equals("salestate") ) {//숫자 타입은 값이 없으면 0으로 초기화
				if(value == "") {
					value = "0";
				}				
			}else {//스트링 타입은 값이 없으면 NULL로 초기화				
				if(value == "") {
					value = null;
				}
			}
			searchVal.put(name, value);
		}
		
		//총자료수
		int totalRows = salesDao.salesListCount(searchVal);
						
		//paging			
		int pageRowCount = 20; //한페이지에서 출력될 row
		int pageDisplayCount = 5; // 페이지 목록 수  
				
		Map<String, Integer> page =  crud.paging(request, totalRows,pageRowCount,pageDisplayCount);//page text 리턴 
				
		page.put("totalRows", totalRows);
				
		//출력할 row 범위설정 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
				
		searchVal.put("startRowNum", startRowNum);
		searchVal.put("endRowNum",endRowNum);
				
		//거래처 리스트 출력
		List<Map<String,Object>> salesList = salesDao.salesList(searchVal);
			
		ModelAndView resMap = new ModelAndView();
		resMap.addObject("page", page);//페이징 text int 저장
		resMap.addObject("salesList", salesList);// 선택 된 페이지 rownum에 해당하는 리스트
		resMap.addObject("searchVal",searchVal);//검색조건.
						
		return resMap;
	}
	//영업상세
	@Override
	public ModelAndView svcSalesDetail(SalesDto salesDto) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("salesDetail",salesDao.salesDetail(salesDto));
		mView.addObject("salesStateList",salesDao.salesStateList(salesDto));
		
		Map<String,Object> prmMap= new HashMap<String,Object>();
		int siteId = salesDto.getSiteid();
		int salesNo = salesDto.getSalesno();
		int startRowNum = 1;
		int endRowNum = 20;
		prmMap.put("startRowNum", startRowNum);
		prmMap.put("endRowNum",endRowNum);		
		prmMap.put("siteid",siteId);
		prmMap.put("salesno",salesNo);
		
		mView.addObject("contList",salesDao.salesContList(prmMap));
		return mView;
	}
	//영업추가 , 영업스케쥴 추가. sort 컬럼 값으로 rorddate, forddate 구분
	@Override
	public int svcSalesInsert(SalesDto salesDto) {
		int salesNo = salesDao.salesInsert(salesDto);
		//rorddate or forddate 가 존재하면 영업 스케쥴 테이블에 insert. (두개다 존재하면 두개 row insert)
		if( (salesDto.getRorddate() != null &&salesDto.getRorddate() != "")    ) {//rord 데이터 값이 있다면
			salesDao.mergeSalesSch(salesDto);// merge into 실행 
		}
		if(salesDto.getForddate() != null &&salesDto.getForddate() != "") {//forddate 값이 있다면
			salesDao.mergeSalesSch(salesDto);//merge into 실행
		}
		return salesNo;
	}
	//영업수정 폼, 영업스케쥴 추가
	@Override
	public Map<String, Object> svcSalesDetailForm(SalesDto salesDto) {
		Map<String,Object> resMap = salesDao.salesDetail(salesDto);
		return resMap;
	}
	//영업수정 실행
	@Override
	public int svcSalesDetailUpdate(SalesDto salesDto) {
		int salesNo = salesDao.salesUpdate(salesDto);
		//rorddate or forddate 가 존재하면 영업 스케쥴 테이블에 insert. (두개다 존재하면 두개 row insert)
		if( (salesDto.getRorddate() != null &&salesDto.getRorddate() != "")    ) {//rord 데이터 값이 있다면
			salesDao.mergeSalesSch(salesDto);// merge into 실행 
		}
		if(salesDto.getForddate() != null &&salesDto.getForddate() != "") {//forddate 값이 있다면
			salesDao.mergeSalesSch(salesDto);//merge into 실행
		}
		return salesNo;
	}
	//영업삭제
	@Override
	public int svcSalesDelete(SalesDto salesDto) {
		int res = salesDao.salesDelete(salesDto);
		return res;
	}
	
	//영업관련고객 리스트
	@Override
	public Map<String, Object> svcSalesCustList(HttpServletRequest request) {

		Map<String,Object> searchVal = crud.searchParam(request);
		
		/*
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {//requeset 값이 있으면 while문 가동 
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			
			if(value == "") {
					value = null;
			}
			searchVal.put(name, value);
		}
		*/	
		if( request.getAttribute("salesno") != null ) {//거래처서비스에서 호출
			int salesno = Integer.parseInt(request.getAttribute("salesno").toString());
			searchVal.put("salesno", salesno);
		}
				
		//총자료수
		int totalRows = salesDao.salesCustListCnt(searchVal);							
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
		
		List<Map<String,Object>> salesCustList = salesDao.salesCustList(searchVal);
		
		Map<String,Object> resMap = new HashMap<String,Object>();
		
		resMap.put("page", page);
		resMap.put("searchVal", searchVal);
		resMap.put("salesCustList", salesCustList);
		
		return resMap;
	}
	
	//영업관련고객팝업- 추가
	@Override
	public int svcSalesCustInsert(SalesCustDto salesCustDto) {
		int res = salesDao.salesCustInsert(salesCustDto);
		return res;
	}
	
	//영업관련고객팝업-상세
	@Override
	public Map<String, Object> svcSalesCustDetail(SalesCustDto salesCustDto) {
		Map<String,Object> salesCustDetail = salesDao.salesCustDetail(salesCustDto);
		return salesCustDetail;
	}
	//영업관련고객팝업-삭제
	@Override
	public int svcSalesCustDelete(SalesCustDto salesCustDto) {
		int res = salesDao.salesCustDelete(salesCustDto);
		return res;
	}
	//영업관련고객팝업-수정
	@Override
	public int svcSalesCustUpdate(SalesCustDto salesCustDto) {
		int res = salesDao.salesCustUpdate(salesCustDto);
		return res;
	}
	
	//영업단계 추가실행
	@Override
	public int svcSalesStateInsert(Map<String,Object> insVal) {
		int res = salesDao.salesStateInsert(insVal);
		return res;
	}
	
	//영업 스케쥴러 리스트
	@Override
	public String svcSalesSchList(Map<String, Object> schVal) {
		List<Map<String, Object>> schList = salesDao.salesSchList(schVal);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(schList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonStr;
	}
	
	//영업 스케쥴 추가
	@Override
	public int svcSalesSchInsert(Map<String, Object> schVal) {
		int res = salesDao.salesSchInsert(schVal);
		return res;
	}
	//영업 스케쥴 수정
	@Override
	public int svcSalesSchUpdate(Map<String, Object> schVal) {
		int res = salesDao.salesSchUpdate(schVal);
		return res;
	}
	
	//영업 스케쥴 상세
	@Override
	public Map<String, Object> svcSalesSchDetail(Map<String, Object> schVal) {
		Map<String, Object> schDetail = salesDao.salesSchDetail(schVal);
		return schDetail;
	}
	
	//영업 -공통 스케쥴 리스트
	@Override
	public List<Map<String, Object>> svcSalesComSchList(Map<String, Object> schVal) {
		List<Map<String, Object>> comSchList = salesDao.salesComSchList(schVal);
		return comSchList;
	}
	//영업 - 공통스케쥴 팝업 추가 실행 
	@Override
	public int scvSalesComSchInsert(Map<String, Object> schVal) {
		int res = salesDao.salesComSchInsert(schVal);
		return res;
	}
	//영업- 공통 스케줄상세 팝업 
	@Override
	public Map<String, Object> svcSalesComSchDetail(Map<String, Object> schVal) {
		Map<String, Object> comSchDetail = salesDao.salesComSchDetail(schVal);
		return comSchDetail;
	}
	//영업 - 스케쥴추가 (공통 스케쥴에서 캘린더로 Drag) 
	@Override
	public String svcSalesSchInsertFromCom(Map<String, Object> schVal) {
		
		int schno = salesDao.salesSchInsertFromCom(schVal);	//추가실행.
		schVal.put("schno", schno);
		
		Map<String,Object> schMap = new HashMap<String,Object>();
		schMap = salesDao.salesSchDetail(schVal);//추가한 스케쥴 조회
		
		Map<String,Object> toJsonMap = new HashMap<String,Object>();//스케쥴러 타입에 맞게 데이터 바인딩.
		toJsonMap.put("id", schno);
		toJsonMap.put("color", schMap.get("COLOR").toString() );
		toJsonMap.put("title", schMap.get("SCHNAME").toString() );
		toJsonMap.put("start", schMap.get("START").toString() );
			
		ObjectMapper mapper = new ObjectMapper();		
		String jsonStr = "";
			
			try {
				jsonStr = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(toJsonMap);//맵 -> json형식의 String으로 변수담
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		
		return jsonStr;	
	}

	

	

}
