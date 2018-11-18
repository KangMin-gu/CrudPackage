package saas.crud.crm.ce;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import saas.crud.crm.common.CommonDao;


@Component
public class EUploadLogical {
	
	@Value("#{props['crud.fileupload.whitelist']}")
	private String whiteList;
	
	@Autowired
	private CommonDao commonDao;
	
	public EUploadDto singleFileUpload(HttpServletResponse response, HttpServletRequest request, MultipartFile mFile) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String url = request.getRequestURI();
		Calendar calendar = Calendar.getInstance();
		String years = String.valueOf(calendar.get(Calendar.YEAR));
		String months = String.valueOf(calendar.get(Calendar.MONTH) + 1);	
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String date = time.format(calendar.getTime());
		String fileSearchKey = date;
		String permitList = "png";
		String[] arrPermitList = permitList.split(",");	
		boolean permitListFlag = false;
		String realPath = null;
		String filePath = null;			
		String saveFileName = null;
		String path = null;
		String imgPath = null;
		EUploadDto fileInfo = new EUploadDto();		
		long limitSize = 500000;
		
		String orgFileName = mFile.getOriginalFilename();
		String extention = orgFileName.substring(orgFileName.lastIndexOf(".")+1,orgFileName.length());
		for(String chker : arrPermitList) {
			if(chker.equals(extention)) {
				permitListFlag = true;
		}
		
	
			
		if(!permitListFlag) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.write("<script language='javascript'>alert('허가되지 않은 확장자입니다.');;</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				out.close();
			}
			
		}else {
			
			long fileSize = mFile.getSize();				
			if(fileSize > limitSize) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.write("<script language='javascript'>alert('파일용량이 제한용량보다 큽니다.');;</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}finally{
					out.close();
				}
				
			}else {
				
				if(url.equals("/poplogo")) {
					realPath = request.getSession().getServletContext().getRealPath("/file/logo/"+years+"/"+months);
					fileInfo.setSub("logo");
					fileInfo.setPath(realPath);
					filePath = realPath+File.separator;					
					saveFileName = fileSearchKey+"_"+siteId+"_"+userNo+"_"+orgFileName;
					imgPath = years+"/"+months+"/"+saveFileName;
					path = filePath + saveFileName;
					
				}
				
					File file=new File(filePath);
					if(!file.exists()){
						file.mkdirs();
					}
					try{			
						mFile.transferTo(new File(filePath+saveFileName));
					}catch(Exception e){
						e.printStackTrace();
					}
					
					fileInfo.setFilesize(fileSize);
					fileInfo.setSavefilename(saveFileName);
					fileInfo.setOrgfilename(orgFileName);
					fileInfo.setPath(path);
					fileInfo.setUserno(userNo);
					fileInfo.setSiteid(siteId);
					fileInfo.setImg(imgPath);
					
					
					return fileInfo;
				}
			}

		}
		return fileInfo;
	}
		

	
	
	public void MultiFileUpload(HttpServletResponse response, HttpServletRequest request, List<MultipartFile> mFile, String fileSearchKey) {
		
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String url = request.getRequestURI();
		Calendar calendar = Calendar.getInstance();
		String years = String.valueOf(calendar.get(Calendar.YEAR));
		String months = String.valueOf(calendar.get(Calendar.MONTH) + 1);			
		String[] arrWhiteList = whiteList.split(",");
		boolean whiteListFlag = false;
		String realPath = null;
		EUploadDto fileInfo = new EUploadDto();		
		long limitSize = 500000;
		
		
		for(int i=0; i<mFile.size(); i++) {
			String orgFileName = mFile.get(i).getOriginalFilename();
			String extention = orgFileName.substring(orgFileName.lastIndexOf(".")+1,orgFileName.length());
			for(String chker : arrWhiteList) {
				if(chker.equals(extention)) {
					whiteListFlag = true;
				}
			}
			
			if(!whiteListFlag) {
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
					out.write("<script language='javascript'>alert('허가되지 않은 확장자입니다.');;</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}finally{
					out.close();
				}
				
			}else {
				
				long fileSize = mFile.get(i).getSize();				
				if(fileSize > limitSize) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = null;
					try {
						out = response.getWriter();
						out.write("<script language='javascript'>alert('파일용량이 제한용량보다 큽니다.');;</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}finally{
						out.close();
					}
				}else {
					
					if(url.equals("/note/send")) {
						realPath = request.getSession().getServletContext().getRealPath("/file/note/"+years+"/"+months);
						fileInfo.setTablename("t_note");
						fileInfo.setSub("note");
					}else if(url.equals("/campaign/send")) {
						realPath = request.getSession().getServletContext().getRealPath("/file/campaign/"+years+"/"+months);
						fileInfo.setTablename("t_campaing");
						fileInfo.setSub("campaing");
					}
					
					String filePath = realPath+File.separator;					
					String saveFileName = fileSearchKey+"_"+userNo+"_"+orgFileName;
					String path = filePath + saveFileName;
					
					File file=new File(filePath);
					if(!file.exists()){
						file.mkdirs();
					}
					try{			
						mFile.get(i).transferTo(new File(filePath+saveFileName));
					}catch(Exception e){
						e.printStackTrace();
					}
					
					fileInfo.setFilesize(fileSize);
					fileInfo.setSavefilename(saveFileName);
					fileInfo.setOrgfilename(orgFileName);
					fileInfo.setPath(path);
					fileInfo.setUserno(userNo);
					fileInfo.setSiteid(siteId);
					fileInfo.setFilesearchkey(fileSearchKey);
					commonDao.fileUpload(fileInfo);
				}
				
			}

		}

	}
	
	public String fileSearchKey(HttpServletRequest request) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String date = time.format(calendar.getTime());
		String fileSearchKey = date+userNo;
		return fileSearchKey;
	}	
}
