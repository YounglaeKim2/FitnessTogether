package com.kosmo.ft.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.ft.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {


	//OneMemoDAO주입
    @Resource(name="adminDAO")
    private AdminDAO dao;
    
	@Override
	public boolean getAdmin(Map map) {
		return dao.getAdmin(map);
	}



}
