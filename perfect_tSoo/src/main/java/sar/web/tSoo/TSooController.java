package sar.web.tSoo;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sar.web.tSoo.DAO.TSooDAO;
import sar.web.tSoo.VO.TSoo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TSooController {
	
	@Inject
	TSooDAO tDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:live";
	}
	
	@RequestMapping("/logIn")
	public String logIn() {
		return "logIn";
	}
	
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("logInID");
		return "live/live";
	}
	
	@RequestMapping("/signIn")
	public String signIn() {
		return "signIn";
	}
	
	@RequestMapping("signInConfirmed")
	public String signInConfirmed(TSoo tSoo) {
		tSoo.setfList("hanryang1125/");
		tDao.insertTSoo(tSoo);
		return "live/live";
	}
	
}
