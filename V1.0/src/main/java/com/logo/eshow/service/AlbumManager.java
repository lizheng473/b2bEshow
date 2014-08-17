package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.AlbumQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Album;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface AlbumManager extends GenericManager<Album, Integer> {

	List<Album> list(AlbumQueryBean queryBean);

	Page<Album> search(AlbumQueryBean queryBean, int offset, int pagesize);
}