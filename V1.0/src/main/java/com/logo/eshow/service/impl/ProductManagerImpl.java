package com.logo.eshow.service.impl;

import com.logo.eshow.bean.query.ProductQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ProductDao;
import com.logo.eshow.model.Product;
import com.logo.eshow.service.ProductManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

@WebService(serviceName = "ProductService", endpointInterface = "com.logo.eshow.service.ProductManager")
public class ProductManagerImpl extends GenericManagerImpl<Product, Integer>
		implements ProductManager {
	ProductDao productDao;

	public ProductManagerImpl(ProductDao productDao) {
		super(productDao);
		this.productDao = productDao;
	}

	public List<Product> list(ProductQueryBean queryBean){
		return productDao.list(queryBean);
	}
	
	public Page<Product> search(ProductQueryBean queryBean, int offset, int pagesize){
		return productDao.search(queryBean, offset, pagesize);
	}
	
}