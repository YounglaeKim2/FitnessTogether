package com.kosmo.ft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class AndroidRestController {

	@Autowired
	public AndroidDAO dao;
	
	@CrossOrigin
	@GetMapping("/membership/{username}/{password}")
	public Map aMemberIsLogin(@PathVariable String username,@PathVariable String password){
		Map map = new HashMap();
		map.put("id", username);
		map.put("pwd", password);
		Map members=dao.aMemberIsLogin(map);
		map.put("id", members.get("ID"));
		map.put("pwd", members.get("PWD"));
		return map;
	}
	
	@CrossOrigin
	@GetMapping("/aInsertFood")
	public int aInsertFood(@RequestParam HashMap<String, String> map) {
		return dao.ainsertFood(map);
	}
	
}
