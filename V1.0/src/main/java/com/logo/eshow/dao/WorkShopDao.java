package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.WorkShopQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.WorkShop;

public interface WorkShopDao extends GenericDao<WorkShop, Integer> {
	
	List<WorkShop> list(WorkShopQueryBean queryBean);
	
	Page<WorkShop> search(WorkShopQueryBean queryBean, int offset, int pagesize);
}