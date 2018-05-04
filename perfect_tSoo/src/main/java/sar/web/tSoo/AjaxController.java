package sar.web.tSoo;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sar.web.tSoo.DAO.BoardDAO;
import sar.web.tSoo.DAO.TSooDAO;
import sar.web.tSoo.VO.TSoo;

@Controller
public class AjaxController {
	
	@Inject
	TSooDAO tDao;
	
	@Inject
	BoardDAO bDao;
	
	@ResponseBody
	@RequestMapping("/idCheck")
	public String idCheck(String id) {
		if (id.isEmpty()) {
			return "empty";
		}
		if (id.length() > 15 || id.length() < 2) {
			return "length";
		}
		
		TSoo tSoo = tDao.selectOneTSoo(id);
		
		if (tSoo == null) {
			return "true";
		}
		
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/logInConfirmed")
	public String logInConfirmed(String id, String password, HttpSession session) {
		
		if (id.isEmpty()) {
			return "id_empty";
		}
		if (password.isEmpty()) {
			return "password_empty";
		}
		
		TSoo tSoo = tDao.selectOneTSoo(id);
		if (tSoo == null) {
			return "NotExist";
		}else if(!tSoo.getPassword().equals(password)) {
			return "wrongPassword";
		}
		session.setAttribute("logInID", tSoo.getId());
		loadFollow(id, session);
		return "logIn";
	}
	
	@ResponseBody
	@RequestMapping("/addHits")
	public void addHits(int bNum) {
		bDao.addHits(bNum);
	}
	
	@ResponseBody
	@RequestMapping("/addFollow")
	public String addFollow(String streamID, String id,HttpSession session) {
		TSoo tSoo = tDao.selectOneTSoo(id);
		String[] fList = (String[])(session.getAttribute("fList"));
		
		for (String str : fList) {
			if (str.equals(streamID)) {
				return "Exist";
			}
		}
		tSoo.setfList((tSoo.getfList() == null? "":tSoo.getfList())+streamID+"/");
		tDao.updateFList(tSoo);
		return "Added";
	}
	
	@ResponseBody
	@RequestMapping("/deleteFollow")
	public String deleteFollow(String streamID, String id,HttpSession session) {
		TSoo tSoo = tDao.selectOneTSoo(id);
		String[] fList = (String[])(session.getAttribute("fList"));
		
		for (String str : fList) {
			if (str.equals(streamID)) {
				tSoo.setfList(tSoo.getfList().replaceAll(streamID+"/", ""));
				session.setAttribute("fList",tSoo.getfList());
				tDao.updateFList(tSoo);
				return "deleted";
			}
		}
		return "failed";
	}
	
	@ResponseBody
	@RequestMapping("/loadFollow")
	public void loadFollow(String id,HttpSession session) {
		TSoo tSoo = tDao.selectOneTSoo(id);
		if (tSoo != null) {
			if (tSoo.getfList() == null) {
				tSoo.setfList("");
			}
			String[] fList = tSoo.getfList().split("/");
			
			if (fList == null) {
				tSoo.setfList("hanryang1125/");
				fList[0] = "hanryang1125";
				tDao.updateFList(tSoo);
			}
			
			session.setAttribute("fList", fList);
			session.setAttribute("fListSize", fList.length);
		}
	}
	
	@ResponseBody
	@RequestMapping("/changingStream")
	public int changingStream(String key,String currChannel,HttpSession session) {
		int channel = Integer.parseInt(currChannel);
		
		if (key.equals("prev")) {
			channel -= 1;
			if (channel < 0) {
				channel = 0;
			}
		}else {
			channel += 1;
			if(channel >= (Integer)(session.getAttribute("fListSize"))) {
				channel = (Integer)(session.getAttribute("fListSize"))-1;
			}
		}
		session.setAttribute("channel", channel);
		return channel;
	}
	
	@ResponseBody
	@RequestMapping("/init")
	public void init(HttpSession session) {
		String[] fList = null;
		session.setAttribute("fList", fList);
		session.setAttribute("fListSize", 0 );
		session.setAttribute("channel", 0 );
		session.setAttribute("init", true);
	}
	
	@ResponseBody
	@RequestMapping("searchRefresh")
	public void searchRefresh(String searchID, HttpSession session) {
		session.setAttribute("searchID", "");
	}
}
