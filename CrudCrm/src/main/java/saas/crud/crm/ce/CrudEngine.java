package saas.crud.crm.ce;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface CrudEngine {
	
	public void fileUpload(HttpServletResponse response, HttpServletRequest request, List<MultipartFile> mFile, MultipartFile sFile, String fileSearchKey);
	public String singleUpload(HttpServletResponse response, HttpServletRequest request,MultipartFile sFile);
	public String multiUpload(HttpServletResponse response, HttpServletRequest request,List<MultipartFile> mFile);
	public String fileSearchKey(HttpServletRequest request);
	public boolean whiteFlag(String orgFileName);
	public boolean whiteSizeFlag(long fileSize);
	public Map<String, Object> searchParam(HttpServletRequest request);
	public Map<String, Integer> paging(HttpServletRequest request, int totalRows, int PAGE_ROW_COUNT, int PAGE_DISPLAY_COUNT);
	public List<Integer> adressQuarter(String mailAdress);
	public String getMapValueNullCheck(Map target, String key);
}
