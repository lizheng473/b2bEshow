package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.ThumbImgQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.ThumbImg;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface ThumbImgManager extends GenericManager<ThumbImg, Integer> {
	
	List<ThumbImg> list(ThumbImgQueryBean queryBean);
	
	Page<ThumbImg> search(ThumbImgQueryBean queryBean, int offset, int pagesize);
	
	ThumbImg thumb(ThumbImgQueryBean queryBean);
	
}