package saas.crud.crm.ce;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class AdressQuarter {
	/*
	 *  메일에서 To 또는 CC  ex) 123@naver.com;123@naver.com;123@naver.com;123@naver.com
	 *  형식을 [123@naver.com,123@naver.com,123@naver.com,123@naver.com] 으로 리스트 배열에 담아 리턴한다. 
	 * 
	 */
	public List<Integer> quarter(String mailAdress){
		
		List<Integer> mailTarget = new ArrayList<Integer>();
		
		String[] mailAdresses = mailAdress.split(";");
		
		for(int i=0; i<mailAdresses.length; i++) {
		    System.out.println(mailAdresses[i]);
		    int target = Integer.parseInt(mailAdresses[i]);
		    mailTarget.add(target);
		}
		
		return  mailTarget;
	}
}
