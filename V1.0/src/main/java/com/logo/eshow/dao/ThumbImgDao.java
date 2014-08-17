package com.logo.eshow.dao;

import java.util.List;

import com.logo.eshow.bean.query.ThumbImgQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.GenericDao;
import com.logo.eshow.model.ThumbImg;

/**
 * An interface that provides a data management interface to the ThumbImg table.
 */
public interface ThumbImgDao extends GenericDao<ThumbImg, Integer> {

	List<ThumbImg> list(ThumbImgQueryBean queryBean);

	Page<ThumbImg> search(ThumbImgQueryBean queryBean, int offset, int pagesize);
}