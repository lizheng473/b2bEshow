package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.BlogQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Blog;


/**
 * An interface that provides a data management interface to the Blog table.
 */
public interface BlogDao extends GenericDao<Blog, Integer> {
	
	List<Blog> list(BlogQueryBean queryBean);
	
	Page<Blog> search(BlogQueryBean queryBean ,int offset, int pagesize);
}