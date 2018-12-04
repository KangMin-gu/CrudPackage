package saas.crud.crm.sa.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.PagingCommon;
import saas.crud.crm.sa.dao.SalesDao;
import saas.crud.crm.sa.dto.ClientDto;
import saas.crud.crm.sa.dto.SalesDto;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired 
	private SalesDao salesDao;
	
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
				
		PagingCommon  pages = new PagingCommon();			
				 
		Map<String, Integer> page =  pages.paging(request, totalRows,pageRowCount,pageDisplayCount);//page text 리턴 
				
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
		mView.addObject("salesCustList",salesDao.salesCustList(salesDto));
		return mView;
	}
	//영업추가
	@Override
	public int svcSalesInsert(SalesDto salesDto) {
		int salesNo = salesDao.salesInsert(salesDto);
		return salesNo;
	}
	//영업수정 폼
	@Override
	public Map<String, Object> svcSalesDetailForm(SalesDto salesDto) {
		Map<String,Object> resMap = salesDao.salesDetail(salesDto);
		return resMap;
	}
	//영업수정 실행
	@Override
	public int svcSalesDetailUpdate(SalesDto salesDto) {
		int salesNo = salesDao.salesUpdate(salesDto);
		return salesNo;
	}
	//영업삭제
	@Override
	public int svcSalesDelete(SalesDto salesDto) {
		int res = salesDao.salesDelete(salesDto);
		return res;
	}

	

	

}
