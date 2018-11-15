package saas.crud.crm.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import saas.crud.crm.nt.service.NoteService;

@Service
public class FileUpload{
	
	@Autowired
	private CommonDao comDao; 
	 
	public int fileUpload(HttpServletResponse response, HttpServletRequest request, List<MultipartFile> fileUpload, String tableName) {

				int siteId = Integer.parseInt(request.getSession().getAttribute("SITEID").toString());
				int userNo = Integer.parseInt(request.getSession().getAttribute("USERNO").toString());
				
				long limitSize = 500000;					
		
				//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
				List<MultipartFile> mFile = fileUpload;
				
				for(int i=0; i < mFile.size(); i++) {
					
					String orgFileName = mFile.get(i).getOriginalFilename();
					long fileSize = mFile.get(i).getSize();
					
					String url = request.getRequestURI();							
					String realPath = null;
					StringBuffer path = new StringBuffer();	
					
					if(url.equals("/logo")) {
						realPath = request.getSession().getServletContext().getRealPath("/file/logo");
						path.append("/file/logo/");
					}else if(url.equals("/note/send")) {
						realPath = request.getSession().getServletContext().getRealPath("/file/note");
						path.append("/file/note/");
					}
						
					
					String filePath = realPath+File.separator;
					int fileSearchKey = 0;
					
					if(fileSize > limitSize ) {
						//해당 경고문 폼작업시 서비스단으로 맵에 트루 펄스를 담아서 뺄것.
							response.setContentType("text/html; charset=UTF-8");
							PrintWriter out = null;
							try {
								out = response.getWriter();
								out.write("<script>alert('파일용량이 제한용량보다 큽니다.');</script>");
							}catch(IOException e){
								e.printStackTrace();
							}finally {
								out.close();
							}
							
					}else {					
							//디렉토리를 만들 파일 객체 생성
							File file=new File(filePath);
							if(!file.exists()){//디렉토리가 존재하지 않는다면
								file.mkdirs();//디렉토리를 만든다.
							}
							//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
							String saveFileName=System.currentTimeMillis()+orgFileName;
							path.append(saveFileName);
							
							try{
								//upload 폴더에 파일을 저장한다.
								mFile.get(i).transferTo(new File(filePath+saveFileName));
							}catch(Exception e){
								e.printStackTrace();
							}
							
							//fileMap 객체에 추가 정보를 담는다.
							FileDto fileInfo = new FileDto();
							fileInfo.setFilesize(fileSize);
							fileInfo.setOrgfilename(orgFileName);
							fileInfo.setSavefilename(saveFileName);
							fileInfo.setPath(path.toString());
							fileInfo.setUserno(userNo);
							fileInfo.setSiteid(siteId);
							
							fileSearchKey = comDao.fileUpload(fileInfo);
							
							return fileSearchKey;
					}			
				}
				
				return userNo;
	}
}

	
	

