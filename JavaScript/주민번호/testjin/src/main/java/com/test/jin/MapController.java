package com.test.jin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

	@RequestMapping("/list.ro")
	public String map(HttpSession session) {
		session.setAttribute("category", "ro");
		
		return "road/map";
	}
	
}
