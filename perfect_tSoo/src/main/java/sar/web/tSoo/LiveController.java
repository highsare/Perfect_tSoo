package sar.web.tSoo;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import sar.web.tSoo.DAO.TSooDAO;

@Controller
public class LiveController {
	
	@Inject
	TSooDAO tDao;
	
	@RequestMapping("/live")
	public String goLive(HttpSession session) {
		System.out.println("In");
		System.out.println("ID: "+session.getAttribute("logInID"));
		System.out.println("fList: "+session.getAttribute("fList"));
		System.out.println("Size: "+session.getAttribute("fListSize"));
		System.out.println("chan: "+session.getAttribute("channel"));
		System.out.println("init: "+session.getAttribute("init"));
		System.out.println("Search: "+session.getAttribute("searchID"));
		
		return "live/live";
	}
	
	@RequestMapping("/search")
	public String search(String searchID, HttpSession session) {
		session.setAttribute("searchID", searchID);
		return "redirect:live";
	}
}
