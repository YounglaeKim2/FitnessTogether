package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;

public interface PictureUploadService {

	boolean pictureUpload(MultipartHttpServletRequest mhsr);

	int modify(MultipartHttpServletRequest mhsr);

	void delete(Map map);

	PictureDTO selectOne(Map map);


}

