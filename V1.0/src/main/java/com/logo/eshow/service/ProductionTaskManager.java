package com.logo.eshow.service;

import java.util.List;

import javax.jws.WebService;

import com.logo.eshow.bean.query.ProductionTaskQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.ProductionTask;
@WebService
public interface ProductionTaskManager extends GenericManager<ProductionTask, Integer> {
	
	List<ProductionTask> list(ProductionTaskQueryBean queryBean);
	
	Page<ProductionTask> search(ProductionTaskQueryBean queryBean,int offset,int pagesize);
}
