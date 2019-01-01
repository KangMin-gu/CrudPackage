package saas.crud.crm.sa.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.sa.dao.ClientDao;
import saas.crud.crm.sa.dao.SalesDao;
import saas.crud.crm.sa.dto.ClientCustDto;
import saas.crud.crm.sa.dto.ClientDto;


@Service
public class ClientServiceImpl implements ClientService {
		
	@Autowired 
	private ClientDao clientDao;
	@Autowired
	private SalesDao salesDao;
	@Autowired
	private CrudEngine crud;
	
	
	//거래처리스트
	@Override
	public ModelAndView svcCliList(HttpServletRequest request) {
			
		Map<String, Object> searchVal = crud.searchParam(request);//검색 조건을 담을 변수 
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);
			
		//총자료수
		int totalRows = clientDao.cliListCount(searchVal);
							
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
		List<Map<String,Object>> clientList = clientDao.clientList(searchVal);
				
		ModelAndView resMap = new ModelAndView();
		resMap.addObject("page", page);//페이징 text int 저장
		resMap.addObject("clientList", clientList);// 선택 된 페이지 rownum에 해당하는 리스트
		resMap.addObject("searchVal",searchVal);//검색조건.
							
		return resMap;
	}
		
	//거래처 상세
	@Override
	public ModelAndView svcCliDetail(HttpServletRequest request) {
			
		Map<String,Object> prm = new HashMap<String,Object>();
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		prm.put("siteid", siteid);			
		prm.put("clino", Integer.parseInt(request.getAttribute("clino").toString()));
					
		ModelAndView mView = new ModelAndView();
		mView.addObject("cliDetail",clientDao.clientDetail(prm));//고객상세 데이터				
		
		//거래처-영업 탭 최근 20 개항목 리스트 출력
		int startRowNum = 1;
		int endRowNum = 20;
		prm.put("startRowNum", startRowNum);
		prm.put("endRowNum",endRowNum);
//		mView.addObject("cliSalesList",salesDao.salesList(prm));
			
		return mView;
	}
	
	
	
	
	
	
	
	
	
	
	//거래처 추가
	@Override
	public int svcCliInsert(ClientDto clientDto) {
		int clino = clientDao.clientInsert(clientDto);
		return clino;
	}
	
	//거래처 수정 폼 바인딩 할 데이터
	@Override
	public Map<String, Object> svcCliDetailForm(int siteid, int clino) {
		Map<String,Object> prm = new HashMap<String,Object>();
		prm.put("siteid", siteid);
		prm.put("clino", clino);
			
		Map<String,Object> resMap = clientDao.clientDetail(prm);
		return resMap;
	}

	//거래처수정실행
	@Override
	public int svcCliDetailUpdate(ClientDto clientDto) {
		int cliNo = clientDao.clientUpdate(clientDto);
		return cliNo;
	}
	//거래처삭제
	@Override
	public int svcCliDelete(Map<String,Object> prmMap) {
		String[] arrayClinoStr = (String[])prmMap.get("arrayClinoStr");
		int size = arrayClinoStr.length;			
		int[] arrayCliNo = new int[size];
				
		for (int i=0;i<size;i++) {//string 배열에 담긴 값을 int 배열로 옮긴다.
			arrayCliNo[i] = Integer.parseInt(arrayClinoStr[i]);		
		}
		
		prmMap.put("arrayCliNo", arrayCliNo);				
		int res = clientDao.cliDelete(prmMap);
		
		return res;
	}

		
	//거래처관련고객 리스트
	@Override
	public Map<String, Object> svcCliCustList(HttpServletRequest request) {

		Map<String,Object> searchVal = crud.searchParam(request);
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		if( request.getAttribute("clino") != null ) {//거래처서비스에서 호출
			int clino = Integer.parseInt(request.getAttribute("clino").toString());
			searchVal.put("clino", clino);
		}
				
		//총자료수
		int totalRows = clientDao.cliCustListCnt(searchVal);							
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
			
		List<Map<String,Object>> cliCustList = clientDao.cliCustList(searchVal);
			
		Map<String,Object> resMap = new HashMap<String,Object>();
			
		resMap.put("page", page);
		resMap.put("searchVal", searchVal);
		resMap.put("cliCustList", cliCustList);
			
		return resMap;
	}
		
		
		
		//영업관련고객팝업- 추가
		@Override
		public int svcCliCustInsert(ClientCustDto clientCustDto) {
			int res = clientDao.cliCustInsert(clientCustDto);
			return res;
		}
		
		//영업관련고객팝업-상세
		@Override
		public Map<String, Object> svcCliCustDetail(ClientCustDto clientCustDto) {
			Map<String,Object> cliCustDetail = clientDao.cliCustDetail(clientCustDto);
			return cliCustDetail;
		}
		//영업관련고객팝업-삭제
		@Override
		public int svcCliCustDelete(ClientCustDto clientCustDto) {
			int res = clientDao.cliCustDelete(clientCustDto);
			return res;
		}
		//영업관련고객팝업-수정
		@Override
		public int svcCliCustUpdate(ClientCustDto clientCustDto) {
			int res = clientDao.cliCustUpdate(clientCustDto);
			return res;
		}


}
