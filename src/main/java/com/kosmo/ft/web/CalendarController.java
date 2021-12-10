package com.kosmo.ft.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {

	@RequestMapping("fnt/calendar.do")
	public String goCalendar() {
		return "calendar/Calendar";
	}
	
}
