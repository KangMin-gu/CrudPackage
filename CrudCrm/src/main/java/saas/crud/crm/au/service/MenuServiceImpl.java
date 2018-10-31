package saas.crud.crm.au.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dao.MenuDao;
import saas.crud.crm.au.dto.MemCompanyDto;
import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.common.PagingCommon;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	MenuDao menuDao;
	
	@Override
	public ModelAndView menuList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		ModelAndView mView = new ModelAndView();
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		String menuName = request.getParameter("menuName");
		String menuVal = request.getParameter("menuVal");
		
		Map<String,Object> search = new HashMap<>();
		
		if(menuName =="") {
			menuName = null;
		}
		if(menuVal =="") {
			menuVal = null;
		}
		search.put("menuName", menuName);
		search.put("menuVal", menuVal);
		
		int totalRows = menuDao.menuTotalRows(search);
		
		int PAGE_DISPLAY_COUNT = 5;
		int PAGE_ROW_COUNT = 10;
		
		PagingCommon pages =new PagingCommon();
		Map<String, Integer> page = pages.paging(request, totalRows, PAGE_ROW_COUNT, PAGE_DISPLAY_COUNT); 
		int startRowNum = page.get("startRowNum");
		int endRowNum = page.get("endRowNum");
		
		search.put("startRowNum", startRowNum);
		search.put("endRowNum", endRowNum);
		search.put("USERNO", USERNO);
		
		List<Map<String,Object>> menuList = menuDao.menuList(search);
		
		mView.addObject("menuList",menuList);
		mView.addObject("page",page);
		mView.addObject("totalRows",totalRows);
		mView.addObject("search",search);

		return mView;
	}

	@Override
	public ModelAndView menuRead(HttpServletRequest request, int menuno) {
		// TODO Auto-generated method stub
		ModelAndView mView = new ModelAndView();
		
		Map<String,Object> menuInfo =  menuDao.menuRead(menuno);
		
		mView.addObject("menu",menuInfo);

		return mView;
	}

	@Override
	public int menuInsert(HttpServletRequest request, MenuDto menuDto) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		menuDto.setReguser(USERNO);
		menuDto.setEdtuser(USERNO);
		
		int menuNo = menuDao.menuInsert(menuDto);
		
		
		return menuNo;
	}

	@Override
	public void menuUpdate(HttpServletRequest request, MenuDto menuDto) {
		// TODO Auto-generated method stub
		
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		
		menuDto.setEdtuser(USERNO);
		
		menuDao.menuUpdate(menuDto);
	}

	@Override
	public void menuDelete(HttpServletRequest request, int menuno) {
		// TODO Auto-generated method stub
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		MenuDto menuDto = new MenuDto();
		
		menuDto.setEdtuser(USERNO);
		menuDto.setMenuno(menuno);
		
		menuDao.menuDelete(menuDto);
		
	}

	@Override
	public void menuMultiDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String sCheck[] = request.getParameterValues("menuno");
		int USERNO = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		MenuDto menuDto = new MenuDto();
		
		menuDto.setEdtuser(USERNO);
		if(sCheck.length > 0) {
			for(int i=0;i<sCheck.length;i++) {
				int menuno = Integer.parseInt(sCheck[i]); 
				menuDto.setMenuno(menuno);
				menuDao.menuDelete(menuDto);
			}
		}
	}

}
