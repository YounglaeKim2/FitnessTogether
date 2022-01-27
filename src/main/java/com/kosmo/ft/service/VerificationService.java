package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

public interface VerificationService {

	int insertVerification(Map map);

	List<Map> selectList(Map map);
	
	int deleteVerification(Map map);
}
