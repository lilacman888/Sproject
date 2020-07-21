package com.sProject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sProject.model.Board;
import com.sProject.service.BoardService;
import com.sProject.service.PagingPgm;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	@RequestMapping("/home")
	public String home() {
		System.out.println("/home");
		return "home";
	}
	@RequestMapping("/list")
	public String initBoard_list() {
		System.out.println("/initBoard_list");
//		return "list";
//		return "board/list";
//		return "redirect:board/list";
		return "redirect:list/pageNum/1"; //오류 - 값이 없나?(list.jsp작성 후 설정해보기)
	}
	@RequestMapping("/list/pageNum/{pageNum}")
	public String list(@PathVariable String pageNum, Board board, Model model) {
		System.out.println("/list");
		final int rowPerPage = 10;		//페이지 당 출력 갯수
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getTotal(board);							// 총 글 갯수
		int startRow = (currentPage -1) * rowPerPage + 1;		//해당 페이지 첫 글
		//1 = 1
		//2 = 11
		//3 = 21
		int endRow = startRow + rowPerPage -1;					//해당 페이지 마지막 글
		//1 = 10
		//11 = 20
		//21 = 30
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;
		List<Board> list = bs.list(board);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", board.getSearch());
		model.addAttribute("keyword", board.getKeyword());
		return "board/list";
	}
	@RequestMapping("/insertForm")
	public String initInsert() {
		System.out.println("/insertForm");
		return "redirect:insertForm/nm/null/pageNum/1";
	}
	@RequestMapping("/insertForm/nm/{nm}/pageNum/{pageNum}")
	public String insertForm(@PathVariable String nm, @PathVariable String pageNum, Model model) {
		System.out.println("/insertForm2");
		if(nm.equals("null"))
			nm = null;
		int board_num = 0, board_ref = 0, board_re_level = 0, board_re_step = 0;
		if(nm != null) {
			board_num = Integer.parseInt(nm);
			Board board = bs.selcet(board_num);
			board_ref = board.getBoard_ref();
			board_re_level = board.getBoard_re_level();
			board_re_step = board.getBoard_re_step();
		}
		model.addAttribute("board_num", board_num);
		model.addAttribute("board_ref", board_ref);
		model.addAttribute("board_re_level", board_re_level);
		model.addAttribute("board_re_step", board_re_step);
		model.addAttribute("pageNum", pageNum);
		return "board/insertForm";
	}
	@RequestMapping("/insert")
	public String insert(Board board, Model model/* , HttpServletRequest request */) {
		System.out.println("/insert");
		int board_num = board.getBoard_num();
		int board_number = bs.getMaxNum();
		if(board_num != 0) {			// 답변글
			bs.updateRe(board);
			board.setBoard_re_level(board.getBoard_re_level()+1);
			board.setBoard_re_step(board.getBoard_re_step()+1);
		} else {
			board.setBoard_ref(board_number);
		}
		board.setBoard_num(board_number);
		int result = bs.insert(board);
		model.addAttribute("result", result);
		return "board/insert";
	}
}
