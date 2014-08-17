package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.PostQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Post;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface PostManager extends GenericManager<Post, Integer> {
	
	List<Post> list(PostQueryBean queryBean);

	Page<Post> search(PostQueryBean queryBean, int offset, int pagesize);
}