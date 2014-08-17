package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.CategoryQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Category;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface CategoryManager extends GenericManager<Category, Integer> {
	
	List<Category> list(CategoryQueryBean queryBean);

	Page<Category> search(CategoryQueryBean queryBean, int offset, int pagesize);
}