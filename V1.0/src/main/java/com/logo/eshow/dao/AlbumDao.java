package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.AlbumQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Album;

/**
 * An interface that provides a data management interface to the Album table.
 */
public interface AlbumDao extends GenericDao<Album, Integer> {
	List<Album> list(AlbumQueryBean queryBean);

	Page<Album> search(AlbumQueryBean queryBean, int offset, int pagesize);
}