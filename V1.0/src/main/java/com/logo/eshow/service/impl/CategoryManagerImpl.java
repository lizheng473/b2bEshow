package com.logo.eshow.service.impl;

import com.logo.eshow.bean.query.CategoryQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.CategoryDao;
import com.logo.eshow.model.Category;
import com.logo.eshow.service.CategoryManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import java.util.List;
import javax.jws.WebService;

@WebService(serviceName = "CategoryService", endpointInterface = "com.logo.eshow.service.CategoryManager")
public class CategoryManagerImpl extends GenericManagerImpl<Category, Integer> implements
		CategoryManager {
	CategoryDao categoryDao;

	public CategoryManagerImpl(CategoryDao categoryDao) {
		super(categoryDao);
		this.categoryDao = categoryDao;
	}

	public List<Category> list(CategoryQueryBean queryBean) {
		return categoryDao.list(queryBean);
	}

	public Page<Category> search(CategoryQueryBean queryBean, int offset,
			int pagesize) {
		return categoryDao.search(queryBean, offset, pagesize);
	}

}