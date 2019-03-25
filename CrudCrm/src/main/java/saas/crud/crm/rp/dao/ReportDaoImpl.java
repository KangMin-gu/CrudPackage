package saas.crud.crm.rp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDaoImpl implements ReportDao{

	@Autowired
	private SqlSession session;
	@Override
	public List<Map<String, Object>> vcReportList(Map<String, Object> param) {
		
		List<Map<String,Object>> vcReportList = session.selectList("rp.vcReportList",param); 
		return vcReportList;
	}

}
