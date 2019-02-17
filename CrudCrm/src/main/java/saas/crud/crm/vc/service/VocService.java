package saas.crud.crm.vc.service;


import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.ServiceDto;


public interface VocService {
	
	public int vocInsert(HttpServletRequest request);
	public Map<String,Object> svcVocPopCustSelect(Map<String,Object> prm);
	public Map<String,Object> svcVocPopServiceSelect(Map<String,Object> map);
	public ModelAndView vocCalList(HttpServletRequest request);
	public Map<String,Object> svcVocTabServiceList(HttpServletRequest request);
	public Map<String,Object> svcVocTabEmailList(HttpServletRequest request);
	public Map<String,Object> svcVocTabEmailDetail(Map<String,Object> prm);
	public int svcVocBlackCustInsert(Map<String,Object> blackInsMap);
	public int svcVocBlackCustDelete(Map<String,Object> prm);
	public Map<String,Object> vocOwnerList(HttpServletRequest request,int asOwner);
	public ModelAndView vocCalOwnerList(HttpServletRequest request,int asOwner);
	public void svcVocCallBackInsert(Map<String,Object> param);
	
	public Map<String,Object> vocCallBackList(HttpServletRequest request);
	public Map<String,Object> vocCallBackUserList(HttpServletRequest request);
}
