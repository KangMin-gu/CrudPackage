package saas.crud.crm.ce;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import saas.crud.crm.au.dao.UserDao;
import saas.crud.crm.nt.dto.NoteDto;
import saas.crud.crm.nt.service.NoteService;
import saas.crud.crm.vc.dao.VocDao;


@Component
public class VocHandler extends TextWebSocketHandler{
	
	
	@Autowired
	private VocDao vocDao;
	
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	private static final Logger logger = LoggerFactory.getLogger(NoteCountHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String vocCountKey = message.getPayload();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> maps = mapper.readValue(vocCountKey, new TypeReference<Map<String, Object>>() {});
		
		Map<String,Object> param = new HashMap<String,Object>();
		int userNo =  Integer.parseInt(maps.get("userno").toString());
		String trunk = maps.get("trunk").toString();
		int chkauth = Integer.parseInt(maps.get("chkauth").toString());
		param.put("userno", userNo);
		param.put("trunk", trunk);
		param.put("chkauth", chkauth);
		
		WebSocketMessage<Map<String, Object>> vocAlarm = new WebSocketMessage<Map<String, Object>>() {

			@Override
			public Map<String, Object> getPayload() {
				Map<String, Object> vocAlarm = vocDao.vocAlarm(param);	
				return vocAlarm;
			}

			@Override
			public boolean isLast() {
				return false;
			}
		};
		
		String vocAlarmJson = "";
		vocAlarmJson = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(vocAlarm); 
		
		for(WebSocketSession s: list) {
			s.sendMessage(new TextMessage(vocAlarmJson));
		}
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
	}
}
