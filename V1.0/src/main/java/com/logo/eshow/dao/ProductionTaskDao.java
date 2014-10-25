package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.ProductionTaskQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.ProductionTask;


public interface ProductionTaskDao extends GenericDao<ProductionTask, Integer> {
	
List<ProductionTask> list(ProductionTaskQueryBean queryBean);
	
	Page<ProductionTask> search(ProductionTaskQueryBean queryBean, int offset, int pagesize);
}
