package com.logo.eshow.service.impl;

import com.logo.eshow.bean.query.TopicCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TopicCommentDao;
import com.logo.eshow.model.TopicComment;
import com.logo.eshow.service.TopicCommentManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

@WebService(serviceName = "TopicCommentService", endpointInterface = "com.logo.eshow.service.TopicCommentManager")
public class TopicCommentManagerImpl extends
		GenericManagerImpl<TopicComment, Integer> implements
		TopicCommentManager {
	TopicCommentDao topicCommentDao;

	public TopicCommentManagerImpl(TopicCommentDao topicCommentDao) {
		super(topicCommentDao);
		this.topicCommentDao = topicCommentDao;
	}
	
	public List<TopicComment> list(TopicCommentQueryBean queryBean) {
		return topicCommentDao.list(queryBean);
	}

	public Page<TopicComment> search(TopicCommentQueryBean queryBean,
			int offset, int pagesize) {
		return topicCommentDao.search(queryBean, offset, pagesize);
	}
	
}