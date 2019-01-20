package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.CompanyDto;
import saas.crud.crm.au.dto.UserDto;

@Repository
public class CompanyDaoImpl implements CompanyDao{

	@Autowired
	
	SqlSession session;
	
	// 회원사 List 검색
	@Override
	public List<Map<String, Object>> companyList(Map<String,Object> search) {
		return session.selectList("company.list", search);
	}
	
	// 회원사 상세 정보

	@Override
	public Map<String, Object> companyRead(CompanyDto CompanyDto) {
		return session.selectOne("company.detail",CompanyDto);
	}
	
	// 회원사 수정
	@Override
	public void companyUpdate(CompanyDto CompanyDto) {
		session.update("company.update",CompanyDto);
	}
	
	// 회원사 추가
	@Override
	public int companyInsert(CompanyDto CompanyDto) {
		session.insert("company.insert",CompanyDto);
		int siteid = CompanyDto.getSiteid();
		return siteid;
	}
	
	// 회원사 통합 숫자
	@Override
	public int companyTotalRows(Map<String, Object> search) {
		return session.selectOne("company.totalRow",search);
	}
	
	// 회원사 단일 삭제
	@Override
	public void companyDelete(CompanyDto CompanyDto) {
		session.update("company.delete",CompanyDto);
		
	}
	
	// 회원사에게 라이센스 추가
	@Override
	public void companyLicenseInsert(Map<String, Object> data) {
		session.insert("company.siteLicenseInsert",data);
		
	}

	@Override
	public void companyAdminInsert(CompanyDto companyDto) {
		session.insert("company.adminUserInsert", companyDto);
	}

	@Override
	public void adminPwdResetsend(Map<String, Object> sendPwdInfo) {
		session.insert("company.adminPwdResetsend", sendPwdInfo);
		
	}

	@Override
	public void adminPwdReset(UserDto resetUserDto) {
		session.update("company.adminPwdReset", resetUserDto);
	}

	@Override
	public Map<String,Object> licenseCnt(Map<String, Object> param) {

		return session.selectOne("company.licenseCnt",param);
	}
	
	

}
