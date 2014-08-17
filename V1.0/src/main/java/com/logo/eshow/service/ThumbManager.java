package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.ThumbQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Thumb;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface ThumbManager extends GenericManager<Thumb, Integer> {
	
	List<Thumb> list(ThumbQueryBean queryBean);

	Page<Thumb> search(ThumbQueryBean queryBean, int offset, int pagesize);
	
}