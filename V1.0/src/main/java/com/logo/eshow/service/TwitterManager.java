package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.TwitterQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Twitter;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface TwitterManager extends GenericManager<Twitter, Integer> {
	
	List<Twitter> list(TwitterQueryBean queryBean);

	Page<Twitter> search(TwitterQueryBean queryBean, int offset, int pagesize);
	
}