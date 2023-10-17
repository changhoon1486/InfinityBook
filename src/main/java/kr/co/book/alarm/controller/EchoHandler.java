//package kr.co.book.alarm.controller;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.stereotype.Component;
//import org.springframework.web.socket.CloseStatus;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//
//@Component
//@Slf4j
//@RequiredArgsConstructor
//public class EchoHandler extends TextWebSocketHandler{
//	
//	Logger logger = LoggerFactory.getLogger(getClass());
//	
//	// 전체 로그인 유저
//	private List<WebSocketSession> sessions = new ArrayList<>();
//	
//	// 1대1 매핑
//	private Map<String, WebSocketSession> userSessionMap = new HashMap<>();
//	
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		logger.info("Socket 연결");
//		sessions.add(session);
//		logger.info("현재 접속한 사람의 user name: "+sendPushUsername(session));	//현재 접속한 사람의 username이 출력됨
//		String senderId = sendPushUsername(session);
//		userSessionMap.put(senderId, session);
//	}
//
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		logger.info("session = " + sendPushUsername(session));
//		String msg = message.getPayload();				//js에서 넘어온 메세지
//		logger.info("msg = " + msg);
//		
//		if (msg != null && !msg.equals("")) {
//			String[] strs = msg.split(",");
//			
//			if (strs != null && strs.length == 5) {
//				String pushCategory = strs[0];			//댓글, 좋아요 구분
//				String replyWriter = strs[1];			//댓글, 좋아요 보낸 유저
//				String sendedPushUser = strs[2];		//푸시 알림 받을 유저
//				String boardId = strs[3];				//게시글번호
//				String title = strs[4];					//게시글제목
//				
//				WebSocketSession sendedPushSession = userSessionMap.get(sendedPushUser);	//로그인상태일때 알람 보냄
//				
//				TextMessage textMsg = new TextMessage("최은영님이 알람을 보냄: " + msg);
//				sendedPushSession.sendMessage(textMsg);
//				
//				//textMsg를 받고 그걸 html로 div에 찍는걸 gnb에 넣어줘
//				
//				//부모댓글
////				if ("reply".equals(pushCategory) && sendedPushSession != null) {
////					TextMessage textMsg = new TextMessage(replyWriter + " 님이 " + "<a href='/porfolDetail/" + boardId + "' style=\"color:black\"><strong>" + title + "</strong> 에 댓글을 남겼습니다.</a>");
////					sendedPushSession.sendMessage(textMsg);
////				}
////				
////				//좋아요
////				else if ("like".equals(pushCategory) && sendedPushSession != null) {
////					TextMessage textMsg = new TextMessage(replyWriter + " 님이 " + "<a href='/porfolDetail/" + boardId + "' style=\"color:black\"><strong>" + title + "</strong> 을 좋아요♡ 했습니다.</a>");
////					sendedPushSession.sendMessage(textMsg);
////				}
////				
////				//자식댓글
////				else if ("reReply".equals(pushCategory) && sendedPushSession != null) {
////					TextMessage textMsg = new TextMessage(replyWriter + " 님이 " + "<a href='/porfolDetail/" + boardId + "' style=\"color:black\"><strong>" + title + "</strong> 글의 회원님 댓글에 답글을 남겼습니다.</a>");
////					sendedPushSession.sendMessage(textMsg);
////				}
//			}
//		}
//	}
//
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		logger.info("Socket 연결 해제");
//		sessions.remove(session);
//		userSessionMap.remove(sendPushUsername(session), session);
//	}
//
//	//알람을 보내는 유저(댓글작성, 좋아요 누르는 유저)
//	private String sendPushUsername(WebSocketSession session) {
//		String loginUsername;
//		
////		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
////
////        User user = (User) authentication.getPrincipal();
////		
////		logger.info("알림을 보내는 유저 정보: " + user);
////		
////		
////		if (user == null) {
////			loginUsername = null;
////		} else {
//			loginUsername = session.getPrincipal().getName();
////		}
//		return loginUsername;
//	}
//}