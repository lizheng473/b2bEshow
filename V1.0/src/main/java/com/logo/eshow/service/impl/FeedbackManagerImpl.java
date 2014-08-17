package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.FeedbackQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.FeedbackDao;
import com.logo.eshow.model.Feedback;
import com.logo.eshow.service.FeedbackManager;
import com.logo.eshow.service.impl.GenericManagerImpl;
import javax.jws.WebService;

@WebService(serviceName = "FeedbackService", endpointInterface = "com.logo.eshow.service.FeedbackManager")
public class FeedbackManagerImpl extends GenericManagerImpl<Feedback, Integer> implements
		FeedbackManager {
	FeedbackDao feedbackDao;

	public FeedbackManagerImpl(FeedbackDao feedbackDao) {
		super(feedbackDao);
		this.feedbackDao = feedbackDao;
	}
	
	public List<Feedback> list(FeedbackQueryBean queryBean){
		return feedbackDao.list(queryBean);
	}

	public Page<Feedback> search(FeedbackQueryBean queryBean,int offset, int pagesize) {
		return feedbackDao.search(queryBean,offset, pagesize);
	}
	
}