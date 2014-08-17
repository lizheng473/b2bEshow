package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.ServiceQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.Service;


/**
 * An interface that provides a data management interface to the Service table.
 */
public interface ServiceDao extends GenericDao<Service, Integer> {
	
	List<Service> list(ServiceQueryBean queryBean);
	
	Page<Service> search(ServiceQueryBean queryBean,int offset,int pagesize);
	
}