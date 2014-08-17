package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.ThumbQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ThumbDao;
import com.logo.eshow.model.Thumb;
import com.logo.eshow.service.ThumbManager;
import com.logo.eshow.service.impl.GenericManagerImpl;
import javax.jws.WebService;

@WebService(serviceName = "ThumbService", endpointInterface = "com.logo.eshow.service.ThumbManager")
public class ThumbManagerImpl extends GenericManagerImpl<Thumb, Integer>
		implements ThumbManager {
	ThumbDao thumbDao;

	public ThumbManagerImpl(ThumbDao thumbDao) {
		super(thumbDao);
		this.thumbDao = thumbDao;
	}

	public List<Thumb> list(ThumbQueryBean queryBean) {
		return thumbDao.list(queryBean);
	}

	public Page<Thumb> search(ThumbQueryBean queryBean, int offset, int pagesize) {
		return thumbDao.search(queryBean, offset, pagesize);
	}

}