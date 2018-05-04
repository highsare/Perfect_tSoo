package sar.web.tSoo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClipsController {
	
	@RequestMapping("/clips")
	public String clips() {
		
		return "clips/clips";
	}
}
