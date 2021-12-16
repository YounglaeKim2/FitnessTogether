package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PhotoBbsController {

	@RequestMapping("/fnt/photoList.do")
	public String myFeed() {
		return "photobbs/PhotoList";
	}
	
	@RequestMapping("/fnt/frPhotoList.do")
	public String frFeed() {
		return "photobbs/FrPhotoList";
	}
	
	@RequestMapping("/fnt/mapPhotoList.do")
	public String mapFeed() {
		return "photobbs/MapPhotoList";
	}
}
