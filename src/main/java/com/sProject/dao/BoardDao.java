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

	void selectUpdate(int board_num);

	int update(Board board);

	void delete(int board_num);

	List<Board> all();

}
