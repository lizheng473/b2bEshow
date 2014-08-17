package com.logo.eshow.service.impl;

import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TopicDao;
import com.logo.eshow.model.Topic;
import com.logo.eshow.service.TopicManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

@WebService(serviceName = "TopicService", endpointInterface = "com.logo.eshow.service.TopicManager")
public class TopicManagerImpl extends GenericManagerImpl<Topic, Integer>
		implements TopicManager {
	TopicDao topicDao;

	public TopicManagerImpl(TopicDao topicDao) {
		super(topicDao);
		this.topicDao = topicDao;
	}

	public List<Topic> list(TopicQueryBean queryBean) {
		return topicDao.list(queryBean);
	}

	public Page<Topic> search(TopicQueryBean queryBean, int offset, int pagesize) {
		return topicDao.search(queryBean, offset, pagesize);
	}
	
}