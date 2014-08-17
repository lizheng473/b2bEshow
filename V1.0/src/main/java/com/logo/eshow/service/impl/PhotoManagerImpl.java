package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.PhotoQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.PhotoDao;
import com.logo.eshow.model.Photo;
import com.logo.eshow.service.PhotoManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "PhotoService", endpointInterface = "com.logo.eshow.service.PhotoManager")
public class PhotoManagerImpl extends GenericManagerImpl<Photo, Integer>
		implements PhotoManager {
	PhotoDao photoDao;

	public PhotoManagerImpl(PhotoDao photoDao) {
		super(photoDao);
		this.photoDao = photoDao;
	}
	
	public List<Photo> list(PhotoQueryBean queryBean) {
		return photoDao.list(queryBean);
	}

	public Page<Photo> search(PhotoQueryBean queryBean, int offset, int pagesize) {
		return photoDao.search(queryBean,offset,pagesize);
	}
}