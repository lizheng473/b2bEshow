package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.OrderForm;

public interface OrderFormDao extends GenericDao<OrderForm, Integer> {
	
	List<OrderForm> list(OrderFormQueryBean queryBean);
	
	Page<OrderForm> search(OrderFormQueryBean queryBean, int offset, int pagesize);
}

