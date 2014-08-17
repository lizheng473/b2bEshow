package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.PhotoCommentQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.PhotoCommentDao;
import com.logo.eshow.model.PhotoComment;
import com.logo.eshow.service.PhotoCommentManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "PhotoCommentService", endpointInterface = "com.logo.eshow.service.PhotoCommentManager")
public class PhotoCommentManagerImpl extends GenericManagerImpl<PhotoComment, Integer> implements
		PhotoCommentManager {
	PhotoCommentDao photoCommentDao;

	public PhotoCommentManagerImpl(PhotoCommentDao photoCommentDao) {
		super(photoCommentDao);
		this.photoCommentDao = photoCommentDao;
	}
	
	public List<PhotoComment> list(PhotoCommentQueryBean queryBean) {
		return photoCommentDao.list(queryBean);
	}

	public Page<PhotoComment> search(PhotoCommentQueryBean queryBean,int offset, int pagesize) {
		return photoCommentDao.search(queryBean,offset, pagesize);
	}
	
}