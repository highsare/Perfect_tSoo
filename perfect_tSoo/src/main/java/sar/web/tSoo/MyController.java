package sar.web.tSoo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@RequestMapping("/my")
	public String myCollection() {
		return "my/myCollection";
	}
}
