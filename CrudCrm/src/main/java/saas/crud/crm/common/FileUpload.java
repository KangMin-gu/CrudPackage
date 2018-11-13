	package saas.crud.crm.common;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;


@Component
public class FileUpload {
	
	public Map<String, Object> fileUpload(HttpServletResponse response, HttpServletRequest request, MultipartFile fileUpload) {
				
				long limitSize = 500000;
		
				//파일을 저장할 폴더의 절대 경로를 얻어온다.
				String realPath=request.getSession().getServletContext().getRealPath("/upload");
				//경로출력
				System.out.println(realPath);
		
	
				//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
				MultipartFile mFile=fileUpload;
				//원본 파일명
				String orgFileName=mFile.getOriginalFilename();
				//파일 사이즈
				long fileSize=mFile.getSize();
				//저장할 파일의 상세 경로
				String filePath=realPath+File.separator;
				
			
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
							file.mkdir();//디렉토리를 만든다.
						}
						//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
						String saveFileName=System.currentTimeMillis()+orgFileName;
						try{
							//upload 폴더에 파일을 저장한다.
							mFile.transferTo(new File(filePath+saveFileName));
						}catch(Exception e){
							e.printStackTrace();
						}
						//fileMap 객체에 추가 정보를 담는다.
						Map<String, Object> fileMap = new HashMap<String, Object>();
						fileMap.put("orgFileName", orgFileName);
						fileMap.put("saveFileName", saveFileName);
						fileMap.put("fileSize", fileSize);
						
						return fileMap;
				}
					
					return null;
	}
}

	
	

