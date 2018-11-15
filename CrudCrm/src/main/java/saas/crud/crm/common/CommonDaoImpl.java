package saas.crud.crm.common;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import saas.crud.crm.vc.dao.VocDaoImpl;

@Repository
public class CommonDaoImpl implements CommonDao{
	
	private static final Logger logger = LoggerFactory.getLogger(VocDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	//파일등록
	@Override
	public int fileUpload(FileDto fileInfo) {
		session.insert("common.fileUpload", fileInfo);
		int fileSearchKey = fileInfo.getFilesearchkey();
		return fileSearchKey;
	}

}
