package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.VerificationService;

@Service("VerificationService")
public class VerificationServiceImpl implements VerificationService{

	@Autowired
	public VerificationDAO dao;
	
	@Override
	public int insertVerification(Map map) {
		return dao.insertVerification(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return dao.selectList(map);
	}

	public int deleteVerification(Map map) {
		return dao.deleteVerification(map);
	}

}
