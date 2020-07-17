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
	
	
}
