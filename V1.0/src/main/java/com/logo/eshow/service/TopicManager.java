package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Topic;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface TopicManager extends GenericManager<Topic, Integer> {
	
	List<Topic> list(TopicQueryBean queryBean);
	
	Page<Topic> search(TopicQueryBean queryBean,int offset, int pagesize);
}
