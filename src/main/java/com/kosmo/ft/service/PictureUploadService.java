package com.kosmo.ft.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface PictureUploadService {
	
	boolean pictureUpload(MultipartHttpServletRequest mhsr);
	
}	

