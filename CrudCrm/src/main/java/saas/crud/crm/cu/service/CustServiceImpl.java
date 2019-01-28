package saas.crud.crm.cu.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.CrudEngine;
import saas.crud.crm.cu.dao.CustDao;
import saas.crud.crm.cu.dto.CustDenyDto;
import saas.crud.crm.cu.dto.CustDto;
import saas.crud.crm.sv.dao.SvDao;



@Service
public class CustServiceImpl implements CustService {

	@Autowired
	private CustDao custDao;
	@Autowired
	private SvDao svDao;
	@Autowired
	private CrudEngine crud;
	
	//고객리스트 출력 (검색 조건) 
	@Override
	public ModelAndView svcCustList(HttpServletRequest request) {
		
		Map<String, Object> searchVal = crud.searchParam(request);
		//**********여기부터 검색조건설정*************************************** 
		int siteid = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		searchVal.put("siteid", siteid);

		
		//총자료수
		int totalRows = custDao.totalCnt(searchVal);
		
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
	public ModelAndView svcCustDetail(int custno, int siteid){
		Map<String,Object> custVal = new HashMap<String,Object>();
		custVal.put("custno",custno);
		custVal.put("siteid", siteid);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("custDetail",custDao.custDetail(custVal));
		
		//****서비스 정보 바인딩**********************************		
		int startRowNum = 1;
		int endRowNum = 10;
		custVal.put("startRowNum",startRowNum);
		custVal.put("endRowNum",endRowNum);
		mView.addObject("custService",svDao.svList(custVal));
		//*****************************************************
		return  mView;
	}
	
	//고객 추가 실행
	@Override
	public int svcCustformInsert(CustDto custDto, CustDenyDto custDenyDto) {
			
		//고객 추가 dao호출 추가된 고객pk 값 리턴
		int custno = custDao.custformInsert(custDto);
		
		//수신거부 테이블 default 값 + 파라미터 dto 값 전달  
		custDenyDto.setCustno(custno);
		
		//수신거부 테이블에 해당 고객 데이터 생성
		custDao.custformInsertDeny(custDenyDto);
		
		if(custDto.getClino() != 0) {//clino가 존재하면 거래처-관련고객 테이블에 insert
			custDao.mergeCliCust(custDto);
		}
			
		return custno;//상세 페이지 이동을 위해 생성된 pk값 리턴 
	}

	//고객 수정폼 - form 화면에 바인딩 할 데이터 전달 
	public Map<String,Object> svcCustDetailForm(int custno){
		Map<String,Object> map = custDao.custDetailForm(custno);
		return  map;
	}
	
	//고객 수정 실행 
	@Override
	public int svcCustformUpdate(CustDto custDto, CustDenyDto custDenyDto) {			
			custDao.custformUpdate(custDto);//업데이트 dao호출			
			
			//업데이트한 pk값 수신거부 dto에 설정
			int custno = custDto.getCustno();
			custDenyDto.setCustno(custno);
						
			//수신거부 dao 호출  
			custDao.custformUpdateDeny(custDenyDto);
			
			if(custDto.getClino() != 0) {//clino가 존재하면 거래처-관련고객 테이블에 update or insert
				custDao.mergeCliCust(custDto);
			}	
			return custno;
	}
	
	//VOC 에서 고객 수정
	@Override
	public int svcVocCustUpdate(Map<String,Object> prmMap) {
		int res = custDao.vocCustUpdate(prmMap); 
		return res;
	}
	
	//고객 상세 탭 - 캠페인 리스트
	@Override
	public Map<String, Object> svcCustTabCampList(HttpServletRequest request) {
		Map<String, Object> searchVal = crud.searchParam(request);
		
		//총자료수
		int totalRows = custDao.custTabCampListCnt(searchVal);
							
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
					
		//영업 리스트 출력
		List<Map<String,Object>> campList = custDao.custTabCampList(searchVal);
				
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("page", page);//페이징 text int 저장
		resMap.put("campList", campList);// 선택 된 페이지 rownum에 해당하는 리스트
		resMap.put("searchVal",searchVal);//검색조건.
							
		return resMap;
	}

	
	

}
