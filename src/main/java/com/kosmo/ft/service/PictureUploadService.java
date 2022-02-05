package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PictureUploadService {
	
	boolean pictureUpload(MultipartHttpServletRequest mhsr);

	int modify(Map map);

	void delete(Map map);

	PictureDTO selectOne(Map map);

	
}	

