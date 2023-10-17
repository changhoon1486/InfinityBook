package kr.co.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/*
 * 일반적으로 스프링에서 빈들은 싱클톤으로 관리되지만  
 * @ServerEndpoint 어노테이션이 달린 클래스들은 WebSocket이 생성될 때 마다 인스턴스가 생성되고 
 * JMA에 의해 관리되기 때문에 스프링의 @Autowired 설정된 멤버들이 정상적으로 초기화 되지 않는다.
 * 이때 이를 연결해주고 초기화해주는 클래스가 필요하다.
 */

@Component
public class WebSocketConfig {
	@Bean
	public ServerEndpointExporter serverEndpointExporter() {
		return new ServerEndpointExporter();
	}
}

