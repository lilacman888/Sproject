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

	@Override
	public Board select(int board_num) {
		return dao.select(board_num);
	}

	@Override
	public int getMaxNum() {
		return dao.getMaxNum();
	}

	@Override
	public void updateRe(Board board) {
		dao.updateRe(board);
	}

	@Override
	public int insert(Board board) {
		return dao.insert(board);
	}

	@Override
	public void selectUpdate(int board_num) {
		dao.selectUpdate(board_num);
	}

	@Override
	public int update(Board board) {
		return dao.update(board);
	}

	@Override
	public void delete(int board_num) {
		dao.delete(board_num);
	}

	@Override
	public List<Board> all() {
		return dao.all();
	}
	
}
