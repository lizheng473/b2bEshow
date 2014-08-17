package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.AppQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.AppDao;
import com.logo.eshow.model.App;
import com.logo.eshow.service.AppManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "AppService", endpointInterface = "com.logo.eshow.service.AppManager")
public class AppManagerImpl extends GenericManagerImpl<App, Integer> implements
		AppManager {
	AppDao appDao;

	public AppManagerImpl(AppDao appDao) {
		super(appDao);
		this.appDao = appDao;
	}
	
	public List<App> list(AppQueryBean queryBean) {
		return appDao.list(queryBean);
	}

	public Page<App> search(AppQueryBean queryBean,int offset, int pagesize) {
		return appDao.search(queryBean, offset, pagesize);
	}

}