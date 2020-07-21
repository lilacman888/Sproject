package com.sProject.service;

import java.util.List;

import com.sProject.model.Board;

public interface BoardService {

	int getTotal(Board board);

	List<Board> list(Board board);

	Board selcet(int num);

	int getMaxNum();

	void updateRe(Board board);

	int insert(Board board);


}
