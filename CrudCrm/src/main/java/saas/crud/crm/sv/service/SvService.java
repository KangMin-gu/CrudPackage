package saas.crud.crm.sv.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.sv.dto.ConveyDto;
import saas.crud.crm.sv.dto.RactDto;
import saas.crud.crm.sv.dto.RewardDto;
import saas.crud.crm.sv.dto.ServiceDto;

public interface SvService {
	// 서비스 List
	public ModelAndView svList(HttpServletRequest request);
	// 서비스 Read
	public ModelAndView svRead(HttpServletRequest request, int serviceNo);
	// 서비스,현상파악,처리결과 Insert 및 update
	public int svInsertUpdate(HttpServletResponse response,HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest,ServiceDto serviceDto,RewardDto rewardDto,RactDto ractDto);
	// 서비스 Delete
	public void svDelete(HttpServletRequest request,int serviceNo);
	
	public void svMultiDelete(HttpServletRequest request);
	
	public List<Map<String, Object>> svTabRact(HttpServletRequest request,int serviceNo);
	
	public List<Map<String,Object>> svTabConvey(HttpServletRequest request,int serviceNo);
	
	public void svConveyInsert(HttpServletRequest request,ConveyDto conveyDto);
	
	public void svComplete(HttpServletRequest request, int serviceNo);
	
	public ModelAndView svCalList(HttpServletRequest request);

}