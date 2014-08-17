package com.logo.eshow.service.impl;

import java.util.List;

import com.logo.eshow.bean.query.AlbumQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.AlbumDao;
import com.logo.eshow.model.Album;
import com.logo.eshow.service.AlbumManager;
import com.logo.eshow.service.impl.GenericManagerImpl;

import javax.jws.WebService;

@WebService(serviceName = "AlbumService", endpointInterface = "com.logo.eshow.service.AlbumManager")
public class AlbumManagerImpl extends GenericManagerImpl<Album, Integer> implements
		AlbumManager {
	AlbumDao albumDao;

	public AlbumManagerImpl(AlbumDao albumDao) {
		super(albumDao);
		this.albumDao = albumDao;
	}
	
	public List<Album> list(AlbumQueryBean queryBean) {
		return albumDao.list(queryBean);
	}

	public Page<Album> search(AlbumQueryBean queryBean,int offset, int pagesize) {
		return albumDao.search(queryBean, offset, pagesize);
	}

}