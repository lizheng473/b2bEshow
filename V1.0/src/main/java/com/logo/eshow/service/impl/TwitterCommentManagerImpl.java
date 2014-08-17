package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.TwitterCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TwitterCommentDao;
import com.logo.eshow.model.TwitterComment;
import com.logo.eshow.service.TwitterCommentManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "TwitterCommentService", endpointInterface = "com.logo.eshow.service.TwitterCommentManager")
public class TwitterCommentManagerImpl extends GenericManagerImpl<TwitterComment, Integer> implements
		TwitterCommentManager {
	TwitterCommentDao twitterCommentDao;

	public TwitterCommentManagerImpl(TwitterCommentDao twitterCommentDao) {
		super(twitterCommentDao);
		this.twitterCommentDao = twitterCommentDao;
	}
	
	public List<TwitterComment> list(TwitterCommentQueryBean queryBean) {
		return twitterCommentDao.list(queryBean);
	}

	public Page<TwitterComment> search(TwitterCommentQueryBean queryBean,int offset, int pagesize) {
		return twitterCommentDao.search(queryBean,offset, pagesize);
	}
	
}