package com.sProject.dao;

import java.util.List;

import com.sProject.model.Board;

public interface BoardDao {

	int getToal(Board board);

	List<Board> list(Board board);

	Board select(int board_num);

	int getMaxNum();

	void updateRe(Board board);

	int insert(Board board);

	void update(int num);

}
