package saas.crud.crm.ce;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import saas.crud.crm.common.CommonDao;

@Component
public class MailScheduler {
	
	@Autowired
	private MailDao mailDao;
	
	//	@Scheduled(cron="10 0/1 * * * ?")
	public void sendmail() throws Exception {
		boolean isValid = false;

		//날짜비교
		Date datetime = new Date();
		SimpleDateFormat formattime = new SimpleDateFormat("yyyy-MM-dd");
		String today = formattime.format(datetime);
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		MailDto emailDto = new MailDto();
		emailDto.setToday(today);

		List<Map<String, Object>> list = mailDao.Alltarget(emailDto);

		for(int i=0; i<list.size(); i++){
			String fromemail = list.get(i).get("FROMEMAIL").toString();
			String toemail =  list.get(i).get("TOEMAIL").toString();
			String subject =  list.get(i).get("SUBJECT").toString();
			String content =  list.get(i).get("CONTENT").toString();
			String ccemail =  (String) list.get(i).get("CCEMAIL");
			String bccemail =  (String) list.get(i).get("BCCEMAIL");
			int emaillogid = Integer.parseInt(list.get(i).get("EMAILLOGID").toString());
			String senddatetime =  list.get(i).get("SENDDATETIME").toString();
			int time = Integer.parseInt(list.get(i).get("TIME").toString());

			if(today.equals(senddatetime) && time <= hour && time == 0){
				send(subject,fromemail,content,toemail,ccemail,bccemail);
				isValid = true;
				emailDto.setEmaillogid(emaillogid);
				UpdateState(isValid, emailDto);
			}
		}
	}

	private void send(String subject, String fromemail, String content, String toemail, String ccemail, String bccemail)
			throws Exception {

		InternetAddress[] toAddr = null;
		InternetAddress[] cCAddr = null;
		InternetAddress[] bCAddr = null;
		List<String> toList = new ArrayList<String>();
		List<String> cCList = new ArrayList<String>();
		List<String> bCList = new ArrayList<String>();

		// smtp 연결설정 192.168.0.32 / 182.231.77.200 / 192.168.219.102
		Properties properties = new Properties();
		properties.setProperty("mail.smtp.host", "192.168.0.32");
		properties.setProperty("mail.smtp.port", "25");
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.debug", "true");
		Authenticator authenticator = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("", "");
			}
		};

		Session session = Session.getDefaultInstance(properties, authenticator);
		Message message = new MimeMessage(session);

		((MimeMessage) message).setSubject(subject, "UTF-8");
		message.setFrom(new InternetAddress(fromemail));
		((MimeMessage) message).setText(content, "UTF-8");

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
			String rltcode = "20";
			emailDto.setRltcode(rltcode);
			mailDao.UpdateMailState(emailDto);
		}
	}

	private String makeMailAdresses(List<String> targetList) {
		String strAddress = "";
		for (int i = 0; i < targetList.size(); i++) {
			strAddress += targetList.get(i);
			if (i < targetList.size() - 1) {
				strAddress += ",";
			}
		}
		return strAddress;
	}

}
