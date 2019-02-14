package saas.crud.crm.au.dao;

import java.util.List;
import java.util.Map;

import saas.crud.crm.au.dto.ContentDto;

public interface ContentDao {
	
	public List<Map<String,Object>> contentList(Map<String,Object> search);
	
	public int contentTotalRows(Map<String,Object> search);
	
	public int contentInsert(ContentDto contentsDto);
	
	public Map<String,Object> contentRead(ContentDto contentsDto);
	
	public void contentUpdate(ContentDto contentsDto);
	
	public void contentDelete(ContentDto contentsDto);
	
	public List<Map<String,Object>> contentUseDescList(Map<String,Object> param);
	
}