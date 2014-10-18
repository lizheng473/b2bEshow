package com.logo.eshow.service;

import java.util.List;

import javax.jws.WebService;

import com.logo.eshow.bean.query.WorkShopQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.WorkShop;
@WebService
public interface WorkShopManager extends GenericManager<WorkShop, Integer> {
	List<WorkShop> list(WorkShopQueryBean queryBean);

	Page<WorkShop> search(WorkShopQueryBean queryBean, int offset, int pagesize);
}
