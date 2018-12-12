package saas.crud.crm.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.ce.EUploadDto;

public interface CommonService {
	public ModelAndView svcPopGetUserName(HttpServletRequest request);
	public ModelAndView svcPopGetClientName(HttpServletRequest request);
	public ModelAndView svcPopGetCustName(HttpServletRequest request);
	public ModelAndView noteDownload(HttpServletRequest request, int fileId);
	public EUploadDto logoUplaod(HttpServletResponse response, HttpServletRequest request, MultipartRequest multipartRequest);
	public Map<String,Object> svcPopGetCustDetail(HttpServletRequest request, int custNo);
	public Map<String,Object> svcPopGetClientDetail(HttpServletRequest request, int cliNo);

}
