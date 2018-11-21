package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.LicenseDto;

@Repository
public class LicenseDaoImpl implements LicenseDao{

	@Autowired
	SqlSession session;
	
	// 라이센스 List 검색
	@Override
	public List<Map<String, Object>> licenseList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("li.list",search);
	}

	// 라이센스 통합 숫자
	@Override
	public int licenseTotalRow(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("li.totalRows",search);
	}

	// 라이센스 상세 정보
	@Override
	public Map<String, Object> licenseDetail(int licenseno) {
		// TODO Auto-generated method stub
		return session.selectOne("li.detail",licenseno);
	}

	// 라이센스 추가
	@Override
	public int licenseInsert(LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		session.insert("li.insert",licenseDto);
		int licenseNo = licenseDto.getLicenseno();
		return licenseNo;
	}

	// 라이센스 수정
	@Override
	public void licenseUpdate(LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		session.update("li.update",licenseDto);
	}

	// 라이센스 상세 정보
	@Override
	public void licenseDelete(LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		session.update("li.delete",licenseDto);
	}

	// 라이센스 탭
	@Override
	public List<Map<String, Object>> licenseTopList(int siteid) {
		// TODO Auto-generated method stub
		return session.selectList("li.topList",siteid);
	}
	
	// 메뉴 추가 할때 사용 할때 selectBox에 사용될 부분
	@Override
	public List<Map<String, Object>> licenseMenuList() {
		// TODO Auto-generated method stub
		return session.selectList("li.licenselist");
	}

}
