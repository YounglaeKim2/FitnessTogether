package com.kosmo.ft.web;

import java.util.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UploadController {

	@RequestMapping(value = "/fnt/fileUpload.do", method = RequestMethod.GET)
	public String dragAndDrop(Model model) {
		
		return "fileupload";
	
	}
	
	@RequestMapping(value = "/fnt/fileUpload/post.do") //ajax에서 호출하는 부분
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) {
		
		Iterator<String> itr = multipartRequest.getFileNames();
		
		String filePath = "/FitnessTogether/src/main/webapp/resources/images/upload/inputimages"; //
		
		while(itr.hasNext()) {
			
			MultipartFile mpf = multipartRequest.getFile(itr.next());
			String originalFilename = mpf.getOriginalFilename(); //파일명
			String fileFullPath = filePath+"/"+originalFilename; //파일전체경로
		}
		
		return "success";
		
	}
	
}/////UploadController
