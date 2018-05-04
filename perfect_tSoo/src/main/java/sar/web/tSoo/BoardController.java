package sar.web.tSoo;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sar.web.tSoo.DAO.BoardDAO;
import sar.web.tSoo.DAO.TSooDAO;
import sar.web.tSoo.VO.TBoard;
import sar.web.tSoo.VO.TReply;

@Controller
public class BoardController {
	
	@Inject
	BoardDAO bDao;
	
	@Inject
	TSooDAO tDao;
	
	@RequestMapping("/tBoard")
	public String goTBoard(String reqPage ,Model model) {
		int showNum = 15;
		int pageNum = 1;
		int totalBoard = 0;
		int offset = 0;
		
		totalBoard = bDao.numOfBoards();
		
		int numOfPages = (int)(Math.ceil(((double)totalBoard / showNum)));
		
		if (reqPage != null) {
			if (Integer.parseInt(reqPage) > 0 && Integer.parseInt(reqPage) <= numOfPages) {
				pageNum = Integer.parseInt(reqPage);
			}else if (Integer.parseInt(reqPage) > numOfPages) {
				pageNum = numOfPages;
			}
		}
		
		offset = (showNum * (pageNum - 1));
		
		RowBounds rb = new RowBounds(offset,showNum);
		
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("showNum", showNum);
		model.addAttribute("totalBoard", totalBoard);
		model.addAttribute("bList", bDao.selectAllBoard(rb));
		model.addAttribute("rList", bDao.selectAllReply());
		return "board/board";
	}
	
	@RequestMapping(value="writeForm", method=RequestMethod.POST)
	public String writeForm() {
		
		return "board/writeForm";
	}
	
	@RequestMapping(value="boardConfirmed", method = RequestMethod.POST)
	public String boardConfirmed(TBoard board) {
		bDao.insertBoard(board);
		return "redirect:tBoard";
	}
	
	@RequestMapping("replyConfirmed")
	public String replyConfirmed(TReply reply) {
		if (reply.getContext() == null) {
			return "redirect:tBoard";
		}
		
		bDao.insertReply(reply);
		
		return "redirect:tBoard";
	}
}
