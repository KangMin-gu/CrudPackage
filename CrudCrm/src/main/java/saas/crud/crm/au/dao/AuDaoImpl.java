package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;

@Repository
public class AuDaoImpl implements AuDao{

	@Autowired
	SqlSession session;
	
	@Override
	public List<Map<String, Object>> urList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("au.list",search);
	}

	@Override
	public int urTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("au.totalRows",search);
	}

	@Override
	public Map<String, Object> urRead(UserDto userDto) {
		// TODO Auto-generated method stub
		return session.selectOne("au.detail",userDto);
	}

	@Override
	public int urInsert(UserDto userDto) {
		// TODO Auto-generated method stub
		session.insert("au.insert",userDto);
		int userNo = userDto.getUserno();
		
		return userNo;
	}

	@Override
	public void urUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		session.update("au.update",userDto);
	}

	@Override
	public void urDelete(UserDto userDto) {
		// TODO Auto-generated method stub
		session.update("au.delete",userDto);
	}

	@Override
	public int urIdCheck(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("au.idcheck",userId);
	}
	
	public List<Map<String,Object>> urTopList(int siteid){
		
		return session.selectList("au.topList",siteid);
	}

	@Override
	public List<Map<String,Object>> urMenuList(int siteid) {
		List<Map<String,Object>> menuList = session.selectList("au.menuList",siteid);
		return menuList;
	}

	@Override
	public void urMenuInsert(UserMenuDto userMenuDto) {
		// TODO Auto-generated method stub
		session.insert("au.menuMerge",userMenuDto);
	}

	@Override
	public void urMenuDelete(UserMenuDto userMenuDto) {
		// TODO Auto-generated method stub
		session.update("au.menuDelete",userMenuDto);
	}

	@Override
	public List<Map<String, Object>> urUserMenuList(UserDto userDto) {
		// TODO Auto-generated method stub
		return session.selectList("au.userMenu",userDto);
	}
}