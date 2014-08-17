package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.BlogQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.BlogDao;
import com.logo.eshow.model.Blog;
import com.logo.eshow.service.BlogManager;
import com.logo.eshow.service.impl.GenericManagerImpl;
import javax.jws.WebService;

@WebService(serviceName = "BlogService", endpointInterface = "com.logo.eshow.service.BlogManager")
public class BlogManagerImpl extends GenericManagerImpl<Blog, Integer> implements
		BlogManager {
	BlogDao blogDao;

	public BlogManagerImpl(BlogDao blogDao) {
		super(blogDao);
		this.blogDao = blogDao;
	}
	
	public List<Blog> list(BlogQueryBean queryBean){
		return blogDao.list(queryBean);
	}

	public Page<Blog> search(BlogQueryBean queryBean,int offset, int pagesize) {
		return blogDao.search(queryBean,offset, pagesize);
	}
	
}