package com.logo.eshow.dao;


import java.util.List;

import com.logo.eshow.bean.query.PhotoQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Photo;


/**
 * An interface that provides a data management interface to the Photo table.
 */
public interface PhotoDao extends GenericDao<Photo, Integer> {
	
	List<Photo> list(PhotoQueryBean queryBean);
	
	Page<Photo> search(PhotoQueryBean queryBean,int offset, int pagesize);
}