package com.logo.eshow.service.impl;

import com.logo.eshow.bean.query.ServiceTypeQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ServiceTypeDao;
import com.logo.eshow.model.ServiceType;
import com.logo.eshow.service.ServiceTypeManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

@WebService(serviceName = "ServiceTypeService", endpointInterface = "com.logo.eshow.service.ServiceTypeManager")
public class ServiceTypeManagerImpl extends GenericManagerImpl<ServiceType, Integer> implements
		ServiceTypeManager {
	ServiceTypeDao serviceTypeDao;

	public ServiceTypeManagerImpl(ServiceTypeDao serviceTypeDao) {
		super(serviceTypeDao);
		this.serviceTypeDao = serviceTypeDao;
	}

	public List<ServiceType> list(ServiceTypeQueryBean queryBean) {
		return serviceTypeDao.list(queryBean);
	}

	public Page<ServiceType> search(ServiceTypeQueryBean queryBean, int offset,
			int pagesize) {
		return serviceTypeDao.search(queryBean, offset, pagesize);
	}

}