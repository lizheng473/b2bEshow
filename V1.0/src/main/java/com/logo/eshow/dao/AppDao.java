package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.AppQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.App;

/**
 * An interface that provides a data management interface to the App table.
 */
public interface AppDao extends GenericDao<App, Integer> {
	List<App> list(AppQueryBean queryBean);

	Page<App> search(AppQueryBean queryBean, int offset, int pagesize);
}