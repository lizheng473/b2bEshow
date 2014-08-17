package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.BlogCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.BlogCommentDao;
import com.logo.eshow.model.BlogComment;
import com.logo.eshow.service.BlogCommentManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "BlogCommentService", endpointInterface = "com.logo.eshow.service.BlogCommentManager")
public class BlogCommentManagerImpl extends GenericManagerImpl<BlogComment, Integer> implements
		BlogCommentManager {
	BlogCommentDao blogCommentDao;

	public BlogCommentManagerImpl(BlogCommentDao blogCommentDao) {
		super(blogCommentDao);
		this.blogCommentDao = blogCommentDao;
	}
	
	public List<BlogComment> list(BlogCommentQueryBean queryBean) {
		return blogCommentDao.list(queryBean);
	}

	public Page<BlogComment> search(BlogCommentQueryBean queryBean,int offset, int pagesize) {
		return blogCommentDao.search(queryBean, offset, pagesize);
	}

}