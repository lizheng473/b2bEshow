package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.TopicCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.TopicComment;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface TopicCommentManager extends GenericManager<TopicComment, Integer> {
	
	List<TopicComment> list(TopicCommentQueryBean queryBean);
	
	Page<TopicComment> search(TopicCommentQueryBean queryBean, int offset, int pagesize);
}