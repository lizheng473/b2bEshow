package com.logo.eshow.service.impl;

import java.util.List;

import javax.jws.WebService;

import com.logo.eshow.bean.query.WorkShopQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.dao.WorkShopDao;
import com.logo.eshow.model.WorkShop;
import com.logo.eshow.service.WorkShopManager;


@WebService(serviceName = "WorkShopService", endpointInterface = "com.logo.eshow.service.WorkShopManager")
public class WorkShopManagerImpl extends GenericManagerImpl<WorkShop, Integer>
implements WorkShopManager{

	WorkShopDao workShopDao;

	public WorkShopManagerImpl(WorkShopDao workShopDao) {
		super(workShopDao);
		this.workShopDao = workShopDao;
	}

	@Override
	public List<WorkShop> list(WorkShopQueryBean queryBean) {
		// TODO Auto-generated method stub
		List<WorkShop> list=workShopDao.list(queryBean);
		return list;
	}

	@Override
	public Page<WorkShop> search(WorkShopQueryBean queryBean, int offset,
			int pagesize) {
		// TODO Auto-generated method stub
		return workShopDao.search(queryBean, offset, pagesize);
	}


}
