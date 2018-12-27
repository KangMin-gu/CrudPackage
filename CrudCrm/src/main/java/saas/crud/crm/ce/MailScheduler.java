package saas.crud.crm.ce;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import saas.crud.crm.common.CommonDao;

@Component
public class MailScheduler {
	
	@Autowired
	private MailDao mailDao;
	
//	@Scheduled(cron="*/30 * * * * *")
	@Scheduled(cron="*/10 * * * * *")//삭제 후 윗코드 주석 제거 요망
	public void sendmail() throws Exception {
		boolean isValid = false;

		//날짜비교
		Date dateTime = new Date();
		//SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		//SimpleDateFormat formatTime = new SimpleDateFormat("H:mm");
		SimpleDateFormat formatTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String today = formatDate.format(dateTime);
		//String currentTime = formatTime.format(dateTime);
		String today = formatTime.format(dateTime);
		//Calendar cal = Calendar.getInstance();
		//int hour = cal.get(Calendar.HOUR_OF_DAY);
		
		MailDto emailDto = new MailDto();
		emailDto.setRltdate(today);
		
		
		List<Map<String, Object>> list = mailDao.allTarget(emailDto);//미발송 메일 100건 리스트 긁어오기
		String fileSearchKey = null; 
		String custNo = null;
		String userNo = null;
		int siteId = 0;
		for(int i=0; i<list.size(); i++){
			String fromEmail = list.get(i).get("FROMEMAIL").toString(); //보낸이
			String toEmail =  list.get(i).get("TOEMAIL").toString(); //받는이 
			String subject =  list.get(i).get("SUBJECT").toString(); //제목
			String content =  list.get(i).get("CONTENT").toString(); //내용
			String ccEmail =  (String) list.get(i).get("CCEMAIL"); //참조
			String bccEmail =  (String) list.get(i).get("BCCEMAIL"); //숨은참조
			int emailLogId = Integer.parseInt(list.get(i).get("EMAILLOGID").toString()); //이메일로그pk
			String sendDate = list.get(i).get("RLTDATE").toString();
			
			if(list.get(i).get("USERNO") != null) {
				userNo = list.get(i).get("USERNO").toString();
			}
			if(list.get(i).get("CUSTNO") != null) {
				custNo = list.get(i).get("CUSTNO").toString();
			}
			StringBuffer sb = new StringBuffer();
			
			ccEmail =  (String) list.get(i).get("CCEMAIL"); //참조
			bccEmail =   (String) list.get(i).get("BCCEMAIL"); //숨은참조
			emailLogId = Integer.parseInt(list.get(i).get("EMAILLOGID").toString()); //이메일로그pk
			siteId = Integer.parseInt(list.get(i).get("SITEID").toString());
			fileSearchKey = (String) list.get(i).get("FILESEARCHKEY");
			
			if(custNo != null) {
			// 고객용
				sb.append("<html lang='ko'> <!-- 휴먼랭귀지 --> <head> <meta charset='utf-8'> <!-- 문자셋 --> <link rel=\"stylesheet\" href=\"http://125.129.242.156:8888/resources/css/bootstrap.min.css\" type=\"text/css\"><link rel=\"stylesheet\" href=\"http://125.129.242.156:8888/resources/css/style.css\" type=\"text/css\"><title>웹페이지 제목</title> </head> <body><img src=\"http://125.129.242.156:8888/mail/check?emaillogid=");
				sb.append(emailLogId);
				sb.append("&SITEID=");
				sb.append(siteId);
				sb.append("&CUSTNO=");
				sb.append(custNo);
				sb.append("\" width=\"0\" height=\"0\" border=\"0\"  />");
				sb.append(content);
				
				sb.append("<p style='FONT-SIZE: 8pt; MARGIN-BOTTOM: 15px; FONT-FAMILY: dotum; MARGIN-TOP: 0px; COLOR: #666666' align='left'>");
				sb.append("<br>본 메일은 정보통신망 이용촉진 및 정보보호 등에 관한 법률시행규칙에 의거하여 CRUD CRM 중 소식지 수신을 동의 하신 분과&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;저희 <b>[CRUD SYSTEM]</b>의 주요거래 고객분들 에게만 발송되어 [광고] 표시를 하지 않고 발송됩니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본 메일은 소식지발신전용 메일이므로 소식지를 원하지 않는 분은 <a href=\'");
				sb.append("http://125.129.242.156:8888/mail/deny?EMAILLOGID=");
				sb.append(emailLogId);
				sb.append("&CUSTNO=");
				sb.append(custNo);
				sb.append("&SITEID=");
				sb.append(siteId);
				sb.append("\' target='_blank'>[수신거부]</a> 를 click 해주시기 바랍니다.</p><br>");
			}
			if(userNo != null) {
				// 내부통지용
				sb.append("<html lang='ko'> <!-- 휴먼랭귀지 --> <head> <meta charset='utf-8'> <!-- 문자셋 --> <link rel=\"stylesheet\" href=\"http://125.129.242.156:8888/resources/css/bootstrap.min.css\" type=\"text/css\"><link rel=\"stylesheet\" href=\"http://125.129.242.156:8888/resources/css/style.css\" type=\"text/css\"><title>웹페이지 제목</title> </head> <body><img src=\"http://125.129.242.156:8888/mail/check?emaillogid=");
				sb.append(emailLogId);
				sb.append("&SITEID=");
				sb.append(siteId);
				sb.append("&USERNO=");
				sb.append(userNo);
				sb.append("\" width=\"0\" height=\"0\" border=\"0\"  />");
				sb.append(content);
			}
			
			sb.append("</body></html>");
			
			content = sb.toString();
			sendDate = list.get(i).get("RLTDATE").toString();
			//String sendDate =  list.get(i).get("SENDDATETIME").toString(); //보낸날짜
			//int time = Integer.parseInt(list.get(i).get("TIME").toString()); //시간
			//String date = formatTime.format(sendDate);
			//String time = formatTime.format(sendDate);
			//String date = formatDate.format(sendDate);
			/*
			if(today.equals(date) &&  ){
				send(subject,fromEmail,content,toEmail,ccEmail,bccEmail);
				isValid = true;
				emailDto.setEmaillogid(emailLogId);
				UpdateState(isValid, emailDto);
			}
			*/
			int compare = sendDate.compareTo(today);
				send(subject,fromEmail,content,toEmail,ccEmail,bccEmail,fileSearchKey,siteId);
				isValid = true;
				emailDto.setEmaillogid(emailLogId);
				UpdateState(isValid, emailDto);
		}
	}

	private void send(String subject, String fromemail, String content, String toemail, String ccemail, String bccemail,String fileSearchKey,int siteId)
			throws Exception {
		InternetAddress[] toAddr = null;
		InternetAddress[] cCAddr = null;
		InternetAddress[] bCAddr = null;
		List<String> toList = new ArrayList<String>();
		List<String> cCList = new ArrayList<String>();
		List<String> bCList = new ArrayList<String>();

		// smtp 연결설정 192.168.0.32 / 182.231.77.200 / 192.168.219.102
		Properties properties = new Properties();
		//properties.setProperty("mail.smtp.host", "192.168.1.32");
	    properties.setProperty("mail.smtp.host", "125.129.242.156");
		//properties.setProperty("mail.smtp.host", "192.168.0.10");
		properties.setProperty("mail.smtp.port", "25");
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.debug", "true");
		Authenticator authenticator = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("", "");
			}
		};
		
		Session session = null;
		Message message = null;

		
		if(fileSearchKey == null) {			//첨부파일이 없다면 
			 session = Session.getDefaultInstance(properties, authenticator);
			 message = new MimeMessage(session);

			((MimeMessage) message).setSubject(subject, "UTF-8");
			message.setFrom(new InternetAddress(fromemail));
			//((MimeMessage) message).setText(content, "UTF-8");
			((MimeMessage) message).setContent(content, "text/html; charset=UTF-8");
		
		}else{								//첨부파일이 있으면
			
			session = Session.getDefaultInstance(properties, authenticator);
			//메일 객체 
			message = new MimeMessage(session);
			//받는사람 설정 
			message.setFrom(new InternetAddress(fromemail));
			
			//파일서치키,사이트 ID 담을 map
			HashMap<String, Object> fileSearchId = new HashMap<String,Object>();
			fileSearchId.put("filesearchkey",fileSearchKey);
			fileSearchId.put("siteid",siteId);

			//파일  정보 받아오기 
			List<Map<String, Object>> fileInfo = mailDao.fileAttach(fileSearchId);
			// C:\\Users\\Lee\\Desktop\\CrudCr_w\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CrudCrm\\file\\note\\2018\\12\\201812191012029913_3_digest.bat
			//제목 설정 
			((MimeMessage) message).setSubject(subject, "UTF-8");
			
			String filePath = fileInfo.get(0).get("PATH").toString();
			//String filePath = "C:\\Users\\Lee\\Desktop\\CrudCr_w\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CrudCrm\\file\\note\\2018\\12\\2018121913294224814_3_digest.bat";
			String orgFileName = fileInfo.get(0).get("ORGFILENAME").toString();
			//String orgFileName = "digest.bat";
			//파일 생성 
			
			//경로지정 
			File attachFile = new File(filePath);
			
			
			//최종적으로 mp에 추가한 값을 setContent해서 추가시키면 됌 
			//내용 및 파일이 전부 담김 
			Multipart mp = new MimeMultipart();
			
			
			//내용 : MimeBodyPart에  내용과 인코딩 방식 설정 
			MimeBodyPart contentMimeBody = new MimeBodyPart();
			contentMimeBody.setContent(content,"text/html; charset=UTF-8");
			contentMimeBody.setHeader("Content-Transfer-Encoding", "base64");
			mp.addBodyPart(contentMimeBody);
			
			//첨부파일 
			MimeBodyPart attachFileMimeBody = new MimeBodyPart();
			//첨부파일 이름 설정
			attachFileMimeBody.setFileName(MimeUtility.encodeText(orgFileName,"UTF-8","B"));
			
			//첨부파일 데이터 설정 
			FileDataSource fileDataSource = new FileDataSource(attachFile);
			DataHandler dataHandler = new DataHandler(fileDataSource);
		
			attachFileMimeBody.setDataHandler(dataHandler);
			attachFileMimeBody.setDescription("UTF-8");
			
			//최종적으로 설정한 값을 message에 추가 
			mp.addBodyPart(attachFileMimeBody);
			
			message.setContent(mp);
		}
		
		
		

		if (toemail != null) {
			toList.add(toemail);
		}
		if (ccemail != null) {
			cCList.add(ccemail);
		}
		if (bccemail != null) {
			bCList.add(bccemail);
		}

		if (toList.size() > 0) {
			toAddr = InternetAddress.parse(makeMailAdresses(toList));
		}
		if (cCList.size() > 0) {
			cCAddr = InternetAddress.parse(makeMailAdresses(cCList));
		}
		if (bCList.size() > 0) {
			bCAddr = InternetAddress.parse(makeMailAdresses(bCList));
		}

		message.setRecipients(Message.RecipientType.TO, toAddr);

		if (null != cCAddr && 0 < toAddr.length) {
			message.setRecipients(Message.RecipientType.CC, cCAddr);
		}
		if (null != bCAddr && 0 < bCAddr.length) {
			message.setRecipients(Message.RecipientType.BCC, bCAddr);
		}
		
	
			Transport.send(message);
		
		
		
		
	}

	private void UpdateState(Boolean isValid, MailDto emailDto) {

		if (isValid == true) {
			int rltcode = 20;
			emailDto.setRltcode(rltcode);
			mailDao.UpdateMailState(emailDto);
		}
	}

	private String makeMailAdresses(List<String> targetList) {
		String strAddress = "";
		for (int i = 0; i < targetList.size(); i++) {
			strAddress += targetList.get(i);
			if (i < targetList.size() - 1) {
				strAddress += ";";
			}
		}
		return strAddress;
	}

}
