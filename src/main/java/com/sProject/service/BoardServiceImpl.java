package com.sProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sProject.dao.BoardDao;
import com.sProject.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao dao;
	
	@Override
	public int getTotal(Board board) {
		return dao.getToal(board);
	}

	@Override
	public List<Board> list(Board board) {
		return dao.list(board);
	}
	
}
