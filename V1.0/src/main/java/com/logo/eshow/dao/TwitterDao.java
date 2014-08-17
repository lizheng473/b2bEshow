package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.TwitterQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Twitter;

/**
 * An interface that provides a data management interface to the Twitter table.
 */
public interface TwitterDao extends GenericDao<Twitter, Integer> {

	List<Twitter> list(TwitterQueryBean queryBean);

	Page<Twitter> search(TwitterQueryBean queryBean, int offset, int pagesize);
}
