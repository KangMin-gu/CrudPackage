package saas.crud.crm.ce;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import saas.crud.crm.common.CommonDao;

@Service
public class CrudEngineImpl implements CrudEngine{
	
	//crud.properties
	@Value("#{props['crud.fileupload.whitelist']}")
	private String whiteList;
	
	@Autowired
	private CommonDao commonDao;
	
	//fileupload 엔진
	@Override
	public void fileUpload(HttpServletResponse response, HttpServletRequest request, List<MultipartFile> multiFile, MultipartFile singleFile, String fileSearchKey) {
		boolean upload = false;
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String url = request.getRequestURI();
		String referer = request.getHeader("Referer");
		Calendar calendar = Calendar.getInstance();
		String years = String.valueOf(calendar.get(Calendar.YEAR));
		String months = String.valueOf(calendar.get(Calendar.MONTH) + 1);			
		EUploadDto fileInfo = new EUploadDto();
		StringBuffer buf = new StringBuffer();
		String realPath = null;
		String imgPath = null;
		boolean whiteListFlag = false;
		boolean sizeFlag = false;
		
		List<MultipartFile> mFile = multiFile;
		MultipartFile sFile = singleFile;
		
		if(mFile.size() != 0) {
			
			for(int i=0; i<mFile.size(); i++) {
				String orgFileName = mFile.get(i).getOriginalFilename();
				whiteListFlag = whiteFlag(orgFileName);
				
				//확장자가 올바르지 않으면 false로 떨궈서 alert() 타게함 
				if(!whiteListFlag) {			
					buf.append("<script>alert('허가되지 않은 확장자 입니다.');");
					buf.append("location.href='");
					buf.append(referer+"?fsk="+fileSearchKey);				
					buf.append("';</script>");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out;
					try {
						out = response.getWriter();
						out.println(buf);					 
						out.flush();
					} catch (IOException e) {					
						e.printStackTrace();
					}	
					
				}else {
					
					long fileSize = mFile.get(i).getSize();
					sizeFlag = whiteSizeFlag(fileSize);
					if(!sizeFlag) {
						buf.append("<script>alert('파일용량이 제한용량보다 큽니다.');");
						buf.append("location.href='");
						buf.append(referer+"?fsk="+fileSearchKey);				
						buf.append("';</script>");
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out;
						try {
							out = response.getWriter();
							out.println(buf);					 
							out.flush();
						} catch (IOException e) {					
							e.printStackTrace();
						}						
					}else {
						
						if(url.equals("/note/send")) {
							realPath = request.getSession().getServletContext().getRealPath("/file/note/"+years+"/"+months);
							fileInfo.setTablename("t_note");
						}else if(url.equals("/campaign/send")) {
							realPath = request.getSession().getServletContext().getRealPath("/file/campaign/"+years+"/"+months);
							fileInfo.setTablename("t_campaing");
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
			}//for
			
			
		}else if(sFile != null) {
			
			String orgFileName = sFile.getOriginalFilename();
			whiteListFlag = whiteFlag(orgFileName);
			
			if(!whiteListFlag) {				
				buf.append("<script>alert('허가되지 않은 확장자 입니다.');");
				buf.append("location.href='");
				buf.append(referer+"?fsk="+fileSearchKey);				
				buf.append("';</script>");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				try {
					out = response.getWriter();
					out.println(buf);					 
					out.flush();
				} catch (IOException e) {					
					e.printStackTrace();
				}			
			}else {
				
				long fileSize = sFile.getSize();
				sizeFlag = whiteSizeFlag(fileSize);
				
				if(!sizeFlag) {
					buf.append("<script>alert('파일용량이 제한용량보다 큽니다.');");
					buf.append("location.href='");
					buf.append(referer+"?fsk="+fileSearchKey);				
					buf.append("';</script>");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out;
					try {
						out = response.getWriter();
						out.println(buf);					 
						out.flush();
					} catch (IOException e) {					
						e.printStackTrace();
					}
				}else {
					
					if(url.equals("/logo/fileupload")) {
						realPath = request.getSession().getServletContext().getRealPath("/logo/"+years+"/"+months);
						imgPath = "logo/"+years+"/"+months+"/"+fileSearchKey+"_"+orgFileName;
						fileInfo.setImgpath(imgPath);
						fileInfo.setTablename("TB980070");
					}
										
					String filePath = realPath+File.separator;					
					String saveFileName = fileSearchKey+"_"+orgFileName;
					String path = filePath + saveFileName;			
					
					File file=new File(filePath);	
					if(!file.exists()){
						file.mkdirs();
					}
					try{			
						sFile.transferTo(new File(filePath+saveFileName));
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
					
					buf.append("<script>window.close();</script>");				
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out;
					try {
						out = response.getWriter();
						out.println(buf);					 
						out.flush();
					} catch (IOException e) {					
						e.printStackTrace();
					}
				}
				
			}
		}
			
	}
	
	//파일서치키생성
	@Override
	public String fileSearchKey(HttpServletRequest request) {
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat time = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String date = time.format(calendar.getTime());
		String fileSearchKey = date+userNo;
		return fileSearchKey;
	}
	
	//확장자체크
	@Override
	public boolean whiteFlag(String orgFileName) {
		
		//aaaa,txt 형식으로 끊어서 배열에 집어넣음 
		boolean whiteListFlag = false;
		String[] arrWhiteList = whiteList.split(",");
		
		String extention = orgFileName.substring(orgFileName.lastIndexOf(".")+1,orgFileName.length());
		for(String chker : arrWhiteList) {
			//확장자를 비교해서 있으면 true로 떨굼 
			if(chker.equals(extention)) {
				whiteListFlag = true;
			}
		}
		return whiteListFlag;
	}
	
	//파일사이즈체크
	@Override
	public boolean whiteSizeFlag(long fileSize) {
		boolean whiteSizeFlag = false;
		long limitSize = 500000;
		if(fileSize < limitSize) {
			whiteSizeFlag = true;
		}
		return whiteSizeFlag;
	}
	
	//검색조건 파라미터 추출
	@Override
	public Map<String, Object> searchParam(HttpServletRequest request) {
	int SITEID = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		
		Map<String,Object> search = new HashMap();
		Enumeration params = request.getParameterNames();
		
		while (params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = request.getParameter(name);
			if(value == "") {
				value = null;
			}else {
				if(name.contains("desc")) {
					value = value.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
				}
			}
			search.put(name, value);
		}
		
		search.put("siteid", SITEID);
		
		return search;
		
	}
	
	//페이징처리
	@Override
	public Map<String, Integer> paging(HttpServletRequest request, int totalRows, int PAGE_ROW_COUNT,
			int PAGE_DISPLAY_COUNT) {
		//보여줄 페이지의 번호
				int pageNum=1;
				//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
				String strPageNum=request.getParameter("pageNum");
				if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
					//페이지 번호를 설정한다.
					pageNum=Integer.parseInt(strPageNum);
				}
				//보여줄 페이지 데이터의 시작 ResultSet row 번호
				int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
				//보여줄 페이지 데이터의 끝 ResultSet row 번호
				int endRowNum=pageNum*PAGE_ROW_COUNT;
				//전체 row 의 갯수를 DB 에서 얻어온다.
				int totalRow = totalRows;
				//전체 페이지의 갯수 구하기
				int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
				//시작 페이지 번호
				int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
				//끝 페이지 번호
				int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
				//끝 페이지 번호가 잘못된 값이라면 
				if(totalPageCount < endPageNum){
					endPageNum=totalPageCount; //보정해준다. 
				}		
				
				Map<String, Integer> paging = new HashMap<>();

				paging.put("startRowNum", startRowNum);
				paging.put("endRowNum", endRowNum);
				paging.put("startPageNum", startPageNum);
				paging.put("endPageNum", endPageNum);
				paging.put("pageNum", pageNum);
				paging.put("totalPageCount", totalPageCount);
				
				return paging;
	}
	
	//내부통지 주소 쿼터
	@Override
	public List<Integer> adressQuarter(String mailAdress) {
		
		/*
		 *  메일에서 To 또는 CC  ex) 123@naver.com;123@naver.com;123@naver.com;123@naver.com
		 *  형식을 [123@naver.com,123@naver.com,123@naver.com,123@naver.com] 으로 리스트 배열에 담아 리턴한다. 
		 * 
		 */
		
		List<Integer> mailTarget = new ArrayList<Integer>();
			
			String[] mailAdresses = mailAdress.split(",");
			
			for(int i=0; i<mailAdresses.length; i++) {
			    int target = Integer.parseInt(mailAdresses[i]);
			    mailTarget.add(target);
			}
			
			return  mailTarget;
	}
	


	@Override
	public String getMapValueNullCheck(Map target, String key) {
		if(target.get(key) != null) {
			return target.get(key).toString();
		}else {
			return "";
		}
	}
	
	//싱글업로드
	@Override
	public String singleUpload(HttpServletResponse response, HttpServletRequest request, MultipartFile sFile) {
		
		String fileSearchKey = fileSearchKey(request);
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String referer = request.getHeader("Referer");
		Calendar calendar = Calendar.getInstance();
		String years = String.valueOf(calendar.get(Calendar.YEAR));
		String months = String.valueOf(calendar.get(Calendar.MONTH) + 1);			
		EUploadDto fileInfo = new EUploadDto();
		StringBuffer buf = new StringBuffer();
		String realPath = null;
		String imgPath = null;
		boolean whiteListFlag = false;
		boolean sizeFlag = false;
		
		String orgFileName = sFile.getOriginalFilename();
		whiteListFlag = whiteFlag(orgFileName);
		
		if(!whiteListFlag) {				
			buf.append("<script>alert('허용되지 않은 확장자입니다. 관리자에게 문의해주세요.');");
			buf.append("location.href='");
			buf.append(referer);				
			buf.append("';</script>");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println(buf);					 
				out.flush();
			} catch (IOException e) {					
				e.printStackTrace();
			}	
			
		}else {
			
			long fileSize = sFile.getSize();
			sizeFlag = whiteSizeFlag(fileSize);
			
			if(!sizeFlag) {
				buf.append("<script>alert('파일용량이 제한용량보다 큽니다. 관리자에게 문의해주세요.');");
				buf.append("location.href='");
				buf.append(referer);				
				buf.append("';</script>");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				try {
					out = response.getWriter();
					out.println(buf);					 
					out.flush();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}else {
				
				//로고 업로드
				realPath = request.getSession().getServletContext().getRealPath("/logo/"+years+"/"+months);
				imgPath = "logo/"+years+"/"+months+"/"+fileSearchKey+"_"+orgFileName;
				fileInfo.setImgpath(imgPath);
				fileInfo.setTablename("ma900010");	
									 
				String filePath = realPath+File.separator;					
				String saveFileName = fileSearchKey+"_"+orgFileName;
				String path = filePath + saveFileName;			
				
				File file=new File(filePath);	
				if(!file.exists()){
					file.mkdirs();
				}
				try{			
					sFile.transferTo(new File(filePath+saveFileName));
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
		
		return fileSearchKey;
	}
	
	//멀티업로드
	@Override
	public String multiUpload(HttpServletResponse response, HttpServletRequest request, List<MultipartFile> multiFile) {

		String fileSearchKey = fileSearchKey(request);
		int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
		int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
		String url = request.getRequestURI();
		String referer = request.getHeader("Referer");
		Calendar calendar = Calendar.getInstance();
		String years = String.valueOf(calendar.get(Calendar.YEAR));
		String months = String.valueOf(calendar.get(Calendar.MONTH) + 1);			
		EUploadDto fileInfo = new EUploadDto();
		StringBuffer buf = new StringBuffer();
		String realPath = null;
		boolean whiteListFlag = false;
		boolean sizeFlag = false;
		
		List<MultipartFile> mFile = multiFile;
		
				for(int i=0; i<mFile.size(); i++) {
					String orgFileName = mFile.get(i).getOriginalFilename();
					whiteListFlag = whiteFlag(orgFileName);
					
					//확장자가 올바르지 않으면 false로 떨궈서 alert() 타게함 
					if(!whiteListFlag) {			
						buf.append("<script>alert('허가되지 않은 확장자 입니다. 관리자에게 문의해주세요.');");
						buf.append("location.href='");
						buf.append(referer);				
						buf.append("';</script>");
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out;
						try {
							out = response.getWriter();
							out.println(buf);					 
							out.flush();
						} catch (IOException e) {					
							e.printStackTrace();
						}	
						
					}else {
						
						long fileSize = mFile.get(i).getSize();
						sizeFlag = whiteSizeFlag(fileSize);
						if(!sizeFlag) {
							buf.append("<script>alert('파일용량이 제한용량보다 큽니다. 관리자에게 문의해주세요.');");
							buf.append("location.href='");
							buf.append(referer);				
							buf.append("';</script>");
							response.setContentType("text/html; charset=UTF-8");
							PrintWriter out;
							try {
								out = response.getWriter();
								out.println(buf);					 
								out.flush();
							} catch (IOException e) {					
								e.printStackTrace();
							}						
						}else {
							
							if(url.equals("/note/send")) {
								realPath = request.getSession().getServletContext().getRealPath("/file/note/"+years+"/"+months);
								fileInfo.setTablename("sys970010");
							}else if(url.equals("/campaign/send")) {
								realPath = request.getSession().getServletContext().getRealPath("/file/campaign/"+years+"/"+months);
								fileInfo.setTablename("cp400010");
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
				}//for
			
			return fileSearchKey;		
	}
}
