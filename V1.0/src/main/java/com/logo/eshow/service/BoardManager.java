package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.BoardQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Board;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface BoardManager extends GenericManager<Board, Integer> {
	
	List<Board> list(BoardQueryBean queryBean);

	Page<Board> search(BoardQueryBean queryBean, int offset, int pagesize);
}