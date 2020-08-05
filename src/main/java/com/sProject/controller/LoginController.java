package com.sProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sProject.model.Board;

@Controller
@RequestMapping(value = "/user/*")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
//	로그인 테스트용
	@RequestMapping(value ="/login", method=RequestMethod.GET)
	public String login(Board board,Model model, HttpServletRequest request) {
		logger.info("login .....");
		String id = "test";
		String cp = request.getContextPath();
		String path = board.getPath().replaceFirst(cp, "");
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		model.addAttribute("id", id);
		return "redirect:" + path;
	}
	//로그아웃 테스트용
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Board board,Model model, HttpServletRequest request) {
		logger.info("logout .....");
		String cp = request.getContextPath();
		String path = board.getPath().replaceFirst(cp, "");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:" + path;
	}
}
