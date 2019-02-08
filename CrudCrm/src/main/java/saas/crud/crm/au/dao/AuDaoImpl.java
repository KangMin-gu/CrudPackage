package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.au.dto.MenuDto;
import saas.crud.crm.au.dto.UserDto;
import saas.crud.crm.au.dto.UserMenuDto;

@Repository
public class AuDaoImpl implements AuDao{

	@Autowired
	private SqlSession session;
	
	// 사용자 List 검색
	@Override
	public List<Map<String, Object>> urList(Map<String, Object> search) {
		return session.selectList("au.list",search);
	}

	// 사용자 통합 수
	@Override
	public int urTotalRows(Map<String, Object> search) {
		return session.selectOne("au.totalRows",search);
	}

	// 사용자 상세
	@Override
	public Map<String, Object> urRead(UserDto userDto) {
		return session.selectOne("au.detail",userDto);
	}

	// 사용자 추가
	@Override
	public int urInsert(UserDto userDto) {
		session.insert("au.insert",userDto);
		int userNo = userDto.getUserno();
		
		return userNo;
	}

	// 사용자 수정
	@Override
	public void urUpdate(UserDto userDto) {
		session.update("au.update",userDto);
	}

	// 사용자 단일 삭제
	@Override
	public void urDelete(UserDto userDto) {
		session.update("au.delete",userDto);
	}

	// 사용자 ID 체크
	@Override
	public int urIdCheck(String userId) {
		return session.selectOne("au.idcheck",userId);
	}
	
	// 사용자 탭
	@Override
	public List<Map<String,Object>> urTopList(int siteid){
		return session.selectList("au.topList",siteid);
	}

	// 사용자 메뉴 리스트 
	@Override
	public List<Map<String,Object>> urMenuList(int siteid) {
		List<Map<String,Object>> menuList = session.selectList("au.menuList",siteid);
		return menuList;
	}

	// 사용자에게 메뉴 추가
	@Override
	public void urMenuInsert(UserMenuDto userMenuDto) {
		session.insert("au.menuMerge",userMenuDto);
	}

	// 사용자 메뉴 제거
	@Override
	public void urMenuDelete(UserMenuDto userMenuDto) {
		session.update("au.menuDelete",userMenuDto);
	}

	// 사용자의 list 검색
	@Override
	public List<Map<String, Object>> urUserMenuList(UserDto userDto) {		
		return session.selectList("au.userMenu",userDto);
	}
	
	//회원사 회원 비밀번호 리셋
	@Override
	public void userPwdResetsend(Map<String, Object> sendPwdInfo) {
		session.insert("au.urPwdResetsend", sendPwdInfo);	
	}

	@Override
	public void userPwdReset(UserDto userDto) {
		session.update("au.urPwdReset", userDto);
		
	}
	@Override
	public List<Map<String,Object>> urAsOwner(int siteId){
		
		List<Map<String,Object>> asOwner = session.selectList("au.asOwner",siteId);
		return asOwner;
	}
}
