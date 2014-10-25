package com.logo.eshow.service.impl;

import java.util.List;

import javax.jws.WebService;

import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.bean.query.ProductionTaskQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.dao.OrderFormDao;
import com.logo.eshow.dao.ProductionTaskDao;
import com.logo.eshow.model.Album;
import com.logo.eshow.model.OrderForm;
import com.logo.eshow.model.ProductionTask;
import com.logo.eshow.service.ProductionTaskManager;

@WebService(serviceName = "ProductionTaskService", endpointInterface = "com.logo.eshow.service.ProductionTaskManager")
public class ProductionTaskManagerImpl extends  GenericManagerImpl<ProductionTask, Integer>
implements ProductionTaskManager {

	ProductionTaskDao productionTaskDao;

	public ProductionTaskManagerImpl(ProductionTaskDao productionTaskDao) {
		super(productionTaskDao);
		this.productionTaskDao = productionTaskDao;
	}

	public List<ProductionTask> list(ProductionTaskQueryBean queryBean){
		return productionTaskDao.list(queryBean);
	}
	
	public Page<ProductionTask> search(ProductionTaskQueryBean queryBean, int offset, int pagesize){
		return productionTaskDao.search(queryBean, offset, pagesize);
	}

}
