package kr.co.book.chat.service;

import java.util.Collections;

import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.config.ServerEndpointConfig;


@Service
@ServerEndpoint(value = "/chat", configurator = ServerEndpointConfig.class) // websocket 연결점을 알려주는 어노테이션(webSocket을 활성화 시키는 요청)
public class ChatsocketService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ChatService service;
	
	
	// 클라이언트가 접속할 때마다 생성되어 클라이언트와 직접 통신하는 클래스
	// 따라서 새로운 클라이언트가 접속 할 떄마다 
	// 클라이언트의 세션 관련 정보를 정적형으로 저장하여 1:N 통신이 가능하도록 만들어야 한다. 
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage // 메시지가 수신 되었을 때
	public void onMessage(String msg, Session session) throws Exception{
		// 클라이언트로부터 메시지가 전달되면 onMessage메서드에 의해 clients에 있는 모든 session에 메시지를 전달한다. 
		
		logger.info("receive message : " + msg);
		for(Session s : clients) {
			logger.info("send data : " + msg);
			s.getBasicRemote().sendText(msg);

		}
		
		
	}
	
	@OnOpen // 클라이언트가 접속할 떄 발생하는 이벤트
	public void onOpen(Session s) {
		// 클라이언트가 ServerEndpoint 값인 "/chat" url로 서버에 접속하게 되면 실행되는 메서드
		// 클라이언트의 정보를 매개변수인 Session 객체를 통해 전달 받는다. 
		// 이때 정적 필드인 clients에 해당 session이 존재하지 않으면 clients에 접속된 클라이언트를 추가한다. 
		logger.info("Open Session : "+ s.toString());
		if (!clients.contains(s)) {
			clients.add(s);
			logger.info("Session Open : "+ s);
		}else {
			logger.info(s + "는 이미 연결된 Session입니다.");
		}
	}
	
	@OnClose // 클라이언트가 브라우져를 끄거나 다른 경로로 이동했을 때
	public void onClose(Session s) {
		// 클라이언트가 url을 바꾸거나 브라우저를 종료하면 자동으로 onClose()메서드가 실행되며 
		// 해당 클라이언트의 정보를 clients에서 제거
		
		logger.info("session close : " + s);
		clients.remove(s);
		
	}
}
