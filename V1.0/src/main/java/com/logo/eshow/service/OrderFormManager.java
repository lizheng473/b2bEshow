package com.logo.eshow.service;

import java.util.List;

import javax.jws.WebService;

import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.OrderForm;
@WebService
public interface OrderFormManager extends GenericManager<OrderForm, Integer> {
	List<OrderForm> list(OrderFormQueryBean queryBean);
	
	Page<OrderForm> search(OrderFormQueryBean queryBean,int offset,int pagesize);

}
