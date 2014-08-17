package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.PhotoCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.PhotoComment;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface PhotoCommentManager extends GenericManager<PhotoComment, Integer> {
	
	List<PhotoComment> list(PhotoCommentQueryBean queryBean);

	Page<PhotoComment> search(PhotoCommentQueryBean queryBean, int offset,
			int pagesize);
}