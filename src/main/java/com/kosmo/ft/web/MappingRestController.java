package com.kosmo.ft.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/fnt/")
@RestController
public class MappingRestController {

	@Autowired
	private RestTemplate restTemplate;
/*
	@Autowired
	private ObjectMapper mapper;
	*/

	@GetMapping(value="/nowAddress.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String nowAddress(@RequestParam Map map) throws JsonProcessingException{
		
		HttpHeaders headers= new HttpHeaders();

		headers.add("Authorization", "KakaoAK 0fe606496a272c7cf46def507293f01a");
		Map<String,Object> bodies = new HashMap<>();
		HttpEntity entity = new HttpEntity(headers);
		
		String uri = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?";
		uri+="x="+map.get("longitude")+"&y="+map.get("latitude");
		UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(uri).build();
		ResponseEntity<Map> response = restTemplate.exchange(
				uriComponents.toString(),//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				Map.class);
		List<Map> nowDocuments = (List<Map>)((Map)response.getBody()).get("documents");
		System.out.println(nowDocuments);
		String nowlocation="";
		for(Map document : nowDocuments) {
			if((document.get("region_type")).toString().equals("H")) {
				nowlocation=document.get("address_name").toString();
			}
		}
		return nowlocation;
	}

	@GetMapping(value="/SearchAddress.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody List<Map> searchAddress(@RequestParam Map map) throws JsonProcessingException{
		List<Map> addresses = new Vector<>();
		HttpHeaders headers= new HttpHeaders();

		headers.add("Authorization", "KakaoAK 0fe606496a272c7cf46def507293f01a");
		Map<String,Object> bodies = new HashMap<>();
		HttpEntity entity = new HttpEntity(headers);
		
		String uri = "https://dapi.kakao.com/v2/local/search/address.json?";
		uri+="query="+map.get("searchAddress");
		UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(uri).build();
		ResponseEntity<Map> response = restTemplate.exchange(
				uriComponents.toString(),//요청 URI
				HttpMethod.GET,//요청 메소드
				entity,//HttpEntity(요청바디와 요청헤더)
				Map.class);
		System.out.println(response.getBody());
		List<Map> searchDocuments=(List<Map>)((Map)response.getBody()).get("documents");
		
		int i=1;
		for(Map document : searchDocuments) {
			Map documentMap = new HashMap();
			documentMap.put("no",i++);
			String addressName = document.get("address_name").toString();
			switch (((Map)document.get("address")).get("region_1depth_name").toString()) {
			case "서울":
				addressName = addressName.replace("서울", "서울특별시");
				break;
			case "부산":
				addressName = addressName.replace("부산", "부산광역시");
				break;
			case "대구":
				addressName = addressName.replace("대구", "대구광역시");
				break;
			case "인천":
				addressName = addressName.replace("인천", "인천광역시");
				break;
			case "광주":
				addressName = addressName.replace("광주", "광주광역시");
				break;
			case "대전":
				addressName = addressName.replace("대전", "대전광역시");
				break;
			case "울산":
				addressName = addressName.replace("울산", "울산광역시");
				break;
			case "세종특별자치시":
				addressName = addressName.replace("세종특별자치시", "세종특별자치시");
				break;
			case "경기":
				addressName = addressName.replace("경기", "경기도");
				break;
			case "강원":
				addressName = addressName.replace("강원", "강원도");
				break;
			case "충북":
				addressName = addressName.replace("충북", "충청북도");
				break;
			case "충남":
				addressName = addressName.replace("충남", "충청남도");
				break;
			case "전북":
				addressName = addressName.replace("전북", "전라북도");
				break;
			case "전남":
				addressName = addressName.replace("전남", "전라남도");
				break;
			case "경북":
				addressName = addressName.replace("경북", "경상북도");
				break;
			case "경남":
				addressName = addressName.replace("경남", "경상남도");
				break;
			case "제주특별자치도":
				addressName = addressName.replace("제주특별자치도", "제주특별자치도");
				break;
			}
			documentMap.put("AddressName",addressName);
			addresses.add(documentMap);
		}
		return addresses;
	}////////////
	
	
}
