package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.BlogCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.BlogComment;

/**
 * An interface that provides a data management interface to the BlogComment
 * table.
 */
public interface BlogCommentDao extends GenericDao<BlogComment, Integer> {

	List<BlogComment> list(BlogCommentQueryBean queryBean);

	Page<BlogComment> search(BlogCommentQueryBean queryBean, int offset,
			int pagesize);
}