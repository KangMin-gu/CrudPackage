package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import saas.crud.crm.au.dto.ContentDto;


@Repository
public class ContentDaoImpl implements ContentDao{
	
	@Autowired
	private SqlSession session;
	
	// 캠페인 양식 List
		@Override
		public List<Map<String, Object>> contentList(Map<String,Object> search) {
			List<Map<String,Object>> contentList = session.selectList("content.contentList",search);
			return contentList;
		}
		// 캠페인 양식 수
		@Override
		public int contentTotalRows(Map<String,Object> search) {
			return session.selectOne("content.contentTotalRows",search);
		}
		// 캠페인 양식 Insert
		@Override
		public int contentInsert(ContentDto contentDto) {
			session.insert("content.contentInsert",contentDto);
			int contentNo = contentDto.getContentno();
			return contentNo;
		}
		// 캠페인 양식 Read
		@Override
		public Map<String, Object> contentRead(ContentDto contentDto) {
			return session.selectOne("content.contentRead",contentDto);
		}
		// 캠페인 양식 Update
		@Override
		public void contentUpdate(ContentDto contentDto) {
			session.update("content.contentUpdate",contentDto);
		}
		// 캠페인 양식 삭제
		@Override
		public void contentDelete(ContentDto contentDto) {
			
			session.update("content.contentDelete",contentDto);
		}

}
