package com.logo.eshow.service.impl;

import com.logo.eshow.model.OrderForm;
import com.logo.eshow.service.OrderFormManager;
import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.OrderFormDao;
import com.logo.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

@WebService(serviceName = "OrderFormService", endpointInterface = "com.logo.eshow.service.OrderFormManager")
public class OrderFormManagerImpl extends GenericManagerImpl<OrderForm, Integer>
		implements OrderFormManager {
	OrderFormDao orderFormDao;

	public OrderFormManagerImpl(OrderFormDao orderFormDao) {
		super(orderFormDao);
		this.orderFormDao = orderFormDao;
	}

	public List<OrderForm> list(OrderFormQueryBean queryBean){
		return orderFormDao.list(queryBean);
	}
	
	public Page<OrderForm> search(OrderFormQueryBean queryBean, int offset, int pagesize){
		return orderFormDao.search(queryBean, offset, pagesize);
	}
	
}