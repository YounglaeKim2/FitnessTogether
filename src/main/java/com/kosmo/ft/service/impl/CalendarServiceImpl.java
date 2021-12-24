package com.kosmo.ft.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.CalendarService;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	public CalendarDAO dao;

	@Override
	public List<Map> selectOptions(String type) {
		return dao.selectOptions(type);
	}

	@Override
	public Map selectSportsNo(String str) {
		return dao.selectSportsNo(str);
	}

	@Override
	public void insertWeight(Map map) {
		// map 크기 4면 행 한개 넘어옴
		int size = map.size()/4;
		
		// 중복된 운동명을 제외하기위한 코드
		Map<String,String> weightName = new HashMap();
		for(int i=1; i<=size;i++) {
			weightName.put(map.get("name"+i).toString(),map.get("name"+i).toString());
		}
	    // 중복이제거된 운동명을 배열로 변환
		Collection<String> keys = weightName.values();
		String[] key = keys.toArray(new String[keys.size()]);
		
		// 각 행들을 저장할 List
		List<Map> writeList = new Vector();
		// 중복된 운동명의 데이터를 저장하기위한 코드
		for(int i=0;i<key.length;i++) {
			Map writeMap = new HashMap();
			String count="";
			String kg="";
			for(int j=1;j<=size;j++) { // 
				if(key[i].equals(map.get("name"+j).toString())) {
					count += map.get("kg"+j).toString()+" ";
					kg += map.get("count"+j).toString()+" ";
				}
			}
			writeMap.put("id",map.get("id"));
			writeMap.put("postdate",map.get("postdate"));
			//writeMap.put("no",noList.get(i).get("NO"));
			writeMap.put("no",selectSportsNo(key[i]).get("NO").toString());
			writeMap.put("kg",count);
			writeMap.put("count",kg);
			writeList.add(writeMap);
		}
		// 만들어진 List<Map> 출력
	
		for(int i = 0;i < writeList.size();i++) {
			System.out.println(writeList.get(i)); 
		}
		 
		for(Map resultMap:writeList) {
			dao.insertWeight(resultMap);
		}
		
	}

	
	
}
