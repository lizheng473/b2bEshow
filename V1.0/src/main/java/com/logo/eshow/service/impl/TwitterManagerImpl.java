package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.TwitterQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TwitterDao;
import com.logo.eshow.model.Twitter;
import com.logo.eshow.service.TwitterManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "TwitterService", endpointInterface = "com.logo.eshow.service.TwitterManager")
public class TwitterManagerImpl extends GenericManagerImpl<Twitter, Integer> implements
		TwitterManager {
	TwitterDao twitterDao;

	public TwitterManagerImpl(TwitterDao twitterDao) {
		super(twitterDao);
		this.twitterDao = twitterDao;
	}

	public List<Twitter> list(TwitterQueryBean queryBean) {
		return twitterDao.list(queryBean);
	}
	
	public Page<Twitter> search(TwitterQueryBean queryBean,int offset, int pagesize) {
		return twitterDao.search(queryBean, offset, pagesize);
	}
	
}