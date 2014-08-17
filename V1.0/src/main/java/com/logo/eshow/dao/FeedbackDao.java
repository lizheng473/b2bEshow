package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.FeedbackQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Feedback;


/**
 * An interface that provides a data management interface to the Feedback table.
 */
public interface FeedbackDao extends GenericDao<Feedback, Integer> {
	
	List<Feedback> list(FeedbackQueryBean queryBean);
	
	Page<Feedback> search(FeedbackQueryBean queryBean ,int offset, int pagesize);
}