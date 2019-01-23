package saas.crud.crm.ce;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.stereotype.Component;

@Component
public class LoginManager implements HttpSessionBindingListener {

	// LoginManager 클래스의 객체 선언
	private static LoginManager loginManager = null;
	// 사용자 ID를 저장해둘 Hashtable 선언
	private static Hashtable loginUsers = new Hashtable();
		
	private LoginManager() {
		super();
	}

	// 싱글톤 기법 사용
	public static synchronized LoginManager getInstance() {
		if (loginManager == null) {
			loginManager = new LoginManager();
		}
		return loginManager;
	}

	// 해당 세션에서 이미 로그인을 했는지 안했는지를 체크
	public boolean isLogin(String sessionID) {
		boolean isLogin = false;
		Enumeration e = loginUsers.keys();
		String key = "";

		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (sessionID.equals(key)) {
				isLogin = true;
			}
		}

		return isLogin;
	}

	// 해당 아이디의 동시 사용을 막기위해 이미 사용중인 아이디인지를 알아본다.
	public boolean isUsing(String userID) {
		boolean isUsing = false;
		Enumeration e = loginUsers.keys();
		String key = "";

		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (userID.equals(loginUsers.get(key))) {
				isUsing = true;
			}
		}

		return isUsing;
	}
	
	//로그인한 사용자와session 을 리턴 
	public List<Map<String, String>> allSession() {
		
		 List<Map<String, String>> loginUserss = new ArrayList<Map<String, String>>();		
		 Set key = loginUsers.keySet();
		 
		 for (Iterator iterator = key.iterator(); iterator.hasNext();) {
			   Map<String, String> loginuser = new HashMap<String, String>();
			   String keyName = (String) iterator.next();
			   String valueName = (String) loginUsers.get(keyName);
			   System.out.println("valuename"+valueName);
			   loginuser.put("ID", valueName);
			   loginuser.put("session", keyName);
			   
			   loginUserss.add(loginuser);
		 }	

		 return loginUserss;
	}
	
	// ID 저장, Sessiong Binding
	public void setSession(HttpSession session, String userID) {
		loginUsers.put(session.getId(), userID);
		// Session Binding이 일어나는 시점
		session.setAttribute("login", this.getInstance());
	}

	// 세션이 성립되었을때, HttpSessionBindingListener 인터페이스 추상 메서드 구현
	public void valueBound(HttpSessionBindingEvent event) {
		// 아무일도 하지 않는다.
	}

	// 세션이 끊겼을때 자동으로 호출된다. Hashable에 저장된 아이디를 삭제한다. HttpSessionBindingListener 인터페이스
	// 추상 메서드 구현.
	public void valueUnbound(HttpSessionBindingEvent event) {
		loginUsers.remove(event.getSession().getId());

	}

	// 세션 ID로 현재 로그인한 ID를 구분해 낸다.
	public String getUserID(String sessionID) {
		return (String) loginUsers.get(sessionID);
	}

	// 현재 접속자수
	public int getUserCount() {
		return loginUsers.size();
	}
}