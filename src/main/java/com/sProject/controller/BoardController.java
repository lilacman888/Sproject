package com.sProject.controller;

import java.util.List;

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
		return "home";
	}
	@RequestMapping("/list")
	public String initBoard_list() {
		
		return "redirect:/board/list";
//		return "redirect:/board/board_list/pageNum/1";
	}
	@RequestMapping("/list/pageNum/{pageNum}")
	public String list(@PathVariable String pageNum, Board board, Model model) {
		final int rowPerPage = 10;
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getTotal(board);		//검색
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
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
		return "list";
	}
	
}
