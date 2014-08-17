package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.PostQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Post;

/**
 * An interface that provides a data management interface to the Post table.
 */
public interface PostDao extends GenericDao<Post, Integer> {
	
	List<Post> list(PostQueryBean queryBean);

	Page<Post> search(PostQueryBean queryBean, int offset, int pagesize);
}