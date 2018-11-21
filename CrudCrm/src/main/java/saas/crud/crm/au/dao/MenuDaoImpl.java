package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.MenuDto;

@Repository
public class MenuDaoImpl implements MenuDao{

	@Autowired
	private SqlSession session;
	
	// 메뉴 List 검색
	@Override
	public List<Map<String, Object>> menuList(Map<String,Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("menu.list",search);
	}

	// 메뉴 통합 숫자
	@Override
	public int menuTotalRows(Map<String,Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("menu.totalRow",search);
	}

	// 메뉴 상세 정보
	@Override
	public Map<String, Object> menuRead(int menuno) {
		// TODO Auto-generated method stub
		return session.selectOne("menu.detail",menuno);
	}

	// 메뉴 추가
	@Override
	public int menuInsert(MenuDto menuDto) {
		// TODO Auto-generated method stub
		session.insert("menu.insert",menuDto);
		int menuNo = menuDto.getMenuno();
		return menuNo;
	}

	// 메뉴 수정
	@Override
	public void menuUpdate(MenuDto menuDto) {
		// TODO Auto-generated method stub
		session.update("menu.update",menuDto);
	}

	// 메뉴 단일 삭제
	@Override
	public void menuDelete(MenuDto menuDto) {
		// TODO Auto-generated method stub
		session.update("menu.delete",menuDto);
	}

}
