package com.sProject.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sProject.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getToal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	@Override
	public List<Board> list(Board board) {
		return sst.selectList("boardns.list",board);
	}

	@Override
	public Board select(int board_num) {
		return sst.selectOne("boardns.select", board_num);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("boardns.getMaxNum");
	}

	@Override
	public void updateRe(Board board) {
		sst.update("boardns.updateRe", board);
	}

	@Override
	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}

	@Override
	public void selectUpdate(int board_num) {
		sst.update("boardns.selectUpdate", board_num);
	}

	@Override
	public int update(Board board) {
		return sst.update("boardns.update", board);
	}

	@Override
	public void delete(int board_num) {
		sst.update("boardns.delete", board_num);
	}

	@Override
	public List<Board> all() {
		return sst.selectList("boardns.all");
	}
	
	
}
