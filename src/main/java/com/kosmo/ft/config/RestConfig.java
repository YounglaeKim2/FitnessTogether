package com.kosmo.ft.config;

import java.util.concurrent.TimeUnit;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration  //※주로 외부 라이브러를 자바코드를 통해서 빈으로 등록시
public class RestConfig {
	/*
	 * 반환 타입:IOC컨테이너(스프링 컨테이너)에 등록할 빈(싱글 톤)
	 * 메소드명:생성된 빈의 이름(아이디값)
	 * 예:RestTemplate restTemplate = new RestTemplate(ClientHttpRequestFactory)
	 */
	@Bean
	public RestTemplate restTemplate() {
		//1.커넥션 풀 사용을 위한 HttpClient객체 생성
		CloseableHttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(50)//연결을 유지할 최대 Http커넥션 수
				.setMaxConnPerRoute(50)//Route당 최대 Http커넥션 수
				.setConnectionTimeToLive(5, TimeUnit.SECONDS)
				.build();
		//2.타임아웃 설정을 위한 객체 생성
		HttpComponentsClientHttpRequestFactory factory =
				new HttpComponentsClientHttpRequestFactory();
		factory.setConnectionRequestTimeout(3000);//연결시간 설정
		factory.setHttpClient(httpClient);
		
		return new RestTemplate(factory);
	}
}
