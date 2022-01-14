package com.kosmo.ft.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.ft.service.PictureUploadService;

@Service("pictureUploadService")
public class PictureUploadServiceImpl implements PictureUploadService{

	@Override
	public boolean pictureUpload(MultipartHttpServletRequest mhsr) {
		
		String id = mhsr.getParameter("id"); //파라미터로 SQL에서 검색할 키값 받아오기
		String content = mhsr.getParameter("content"); //파라미터로 본문텍스트 가져오기
		
		List<MultipartFile> listImgFile = mhsr.getFiles("i_src");
		
		
		return false;
	}

	
	
} 

