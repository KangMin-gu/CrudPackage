package saas.crud.crm.nt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import saas.crud.crm.nt.dto.NoteDto;

public interface NoteService {
	public ModelAndView noteInbox(HttpServletRequest request);
	public ModelAndView noteOutbox(HttpServletRequest request);
	public ModelAndView noteImport(HttpServletRequest request);
	public ModelAndView noteTrash(HttpServletRequest request);
	public ModelAndView noteDetail(int noticeId, HttpServletRequest request);
	public void noteEyeChk(HttpServletRequest request, List<Integer> noticeid);
	public void noteImportChk(HttpServletRequest request, List<Integer> noticeid); 
	public void noteTrashChk(HttpServletRequest request, List<Integer> noticeid); 
	public void noteDeleteChk(HttpServletRequest request, List<Integer> noticeid);
	public void noteReturnChk(HttpServletRequest request, List<Integer> noticeid);
	public ModelAndView noteSet(HttpServletRequest request);
	public int noteSend(HttpServletResponse response, HttpServletRequest request, NoteDto ntDto, MultipartHttpServletRequest multipartHttpServletRequest);
	
	public Map<String,String> noteChosen(String[] userEmail);
}
