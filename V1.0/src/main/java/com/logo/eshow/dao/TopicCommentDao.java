package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.TopicCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.TopicComment;

/**
 * An interface that provides a data management interface to the TopicComment
 * table.
 */
public interface TopicCommentDao extends GenericDao<TopicComment, Integer> {

	List<TopicComment> list(TopicCommentQueryBean queryBean);

	Page<TopicComment> search(TopicCommentQueryBean queryBean, int offset,
			int pagesize);
}