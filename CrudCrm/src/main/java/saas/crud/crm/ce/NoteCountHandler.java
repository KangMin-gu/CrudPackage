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

import saas.crud.crm.nt.dto.NoteDto;


@Component
public class NoteCountHandler extends TextWebSocketHandler{
	
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	private static final Logger logger = LoggerFactory.getLogger(NoteCountHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("Notice Alarm 접속 ID : "+ session.getId());
		list.add(session);

	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	/*	String ntCountKey = message.getPayload();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> maps = mapper.readValue(ntCountKey, new TypeReference<Map<String, Object>>() {});

		if(maps.size() != 0){

			int receiver =  Integer.parseInt((String) maps.get("userid"));
			int siteid =  Integer.parseInt((String) maps.get("siteid"));

			NoteDto ntdto = new NoteDto();
			ntdto.setSiteid(siteid);
			//ntdto.setReceiver(receiver);

			//int count = ntService.aram(ntdto);
			//String aram = String.valueOf(count);

			for(WebSocketSession s : list){

				if(s.getId().equals(session.getId())){
				//	s.sendMessage(new TextMessage(aram));
				}
			}
		}*/
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("Notice Alarm Disconnected ID : "+ session.getId());
		list.remove(session);
	}
}
