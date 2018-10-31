package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdDaoImpl implements AdDao{

	
	@Autowired
	SqlSession session;
	
	@Override
	public List<Map<String, Object>> urList(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectList("ad.list",search);
	}

	@Override
	public int urTotalRows(Map<String, Object> search) {
		// TODO Auto-generated method stub
		return session.selectOne("ad.totalRows",search);
	}
}
