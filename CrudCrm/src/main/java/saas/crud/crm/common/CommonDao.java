package saas.crud.crm.common;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.EUploadDto;


public interface CommonDao {
	public void fileUpload(EUploadDto fileInfo);
	public int totalcntUser(Map<String,Object> searchVal);
	public List<Map<String,Object>> popUserList(Map<String,Object> searchVal);
	public int totalcntClient(Map<String,Object> searchVal);
	public List<Map<String,Object>> popClientList(Map<String,Object> searchVal);
	public EUploadDto noteDownload(EUploadDto fileRequest);
	public int totalCntCust(Map<String,Object> searchVal);
	public List<Map<String,Object>> popCustList(Map<String,Object> searchVal);
	public int totalcntSales(Map<String,Object> searchVal);
	public List<Map<String,Object>> popSalesList(Map<String,Object> searchVal);
	
	public void DirectSendSms(Map<String,Object> param);
	public void DelaySendSms(Map<String,Object> param);
	
	public void DirectSendLms(Map<String,Object> param);
	public void DelaySendLms(Map<String,Object> param);
}
