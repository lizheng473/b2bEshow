package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.ServiceTypeQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.ServiceType;

/**
 * An interface that provides a data management interface to the ServiceType
 * table.
 */
public interface ServiceTypeDao extends GenericDao<ServiceType, Integer> {
	
	List<ServiceType> list(ServiceTypeQueryBean queryBean);

	Page<ServiceType> search(ServiceTypeQueryBean queryBean, int offset,
			int pagesize);
}