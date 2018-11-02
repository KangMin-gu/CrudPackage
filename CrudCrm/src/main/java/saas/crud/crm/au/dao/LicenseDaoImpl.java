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
	
	@Override
	public List<Map<String, Object>> licenseList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("li.list",search);
	}

	@Override
	public int licenseTotalRow(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("li.totalRows",search);
	}

	@Override
	public Map<String, Object> licenseDetail(int licenseno) {
		// TODO Auto-generated method stub
		return session.selectOne("li.detail",licenseno);
	}

	@Override
	public int licenseInsert(LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		session.insert("li.insert",licenseDto);
		int licenseNo = licenseDto.getLicenseno();
		return licenseNo;
	}

	@Override
	public void licenseUpdate(LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		session.update("li.update",licenseDto);
	}

	@Override
	public void licenseDelete(LicenseDto licenseDto) {
		// TODO Auto-generated method stub
		session.update("li.delete",licenseDto);
	}

}
