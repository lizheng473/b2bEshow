package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.TwitterCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.TwitterComment;

/**
 * An interface that provides a data management interface to the TwitterComment
 * table.
 */
public interface TwitterCommentDao extends GenericDao<TwitterComment, Integer> {
	
	List<TwitterComment> list(TwitterCommentQueryBean queryBean);

	Page<TwitterComment> search(TwitterCommentQueryBean queryBean, int offset,
			int pagesize);
}