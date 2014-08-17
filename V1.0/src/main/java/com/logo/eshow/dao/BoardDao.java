package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.BoardQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Board;

/**
 * An interface that provides a data management interface to the Board table.
 */
public interface BoardDao extends GenericDao<Board, Integer> {

	List<Board> list(BoardQueryBean queryBean);

	Page<Board> search(BoardQueryBean queryBean, int offset, int pagesize);
}