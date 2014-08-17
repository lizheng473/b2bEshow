package com.logo.eshow.service.impl;

import java.util.Date;
import java.util.List;

import com.logo.eshow.bean.query.ThumbImgQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ThumbImgDao;
import com.logo.eshow.model.ThumbImg;
import com.logo.eshow.service.ThumbImgManager;
import com.logo.eshow.service.impl.GenericManagerImpl;
import com.logo.eshow.util.DateUtil;
import com.logo.eshow.util.ImageUtil;

import javax.jws.WebService;

import magick.MagickException;

@WebService(serviceName = "ThumbImgService", endpointInterface = "com.logo.eshow.service.ThumbImgManager")
public class ThumbImgManagerImpl extends GenericManagerImpl<ThumbImg, Integer>
		implements ThumbImgManager {
	ThumbImgDao thumbImgDao;

	public ThumbImgManagerImpl(ThumbImgDao thumbImgDao) {
		super(thumbImgDao);
		this.thumbImgDao = thumbImgDao;
	}

	public List<ThumbImg> list(ThumbImgQueryBean queryBean) {
		return thumbImgDao.list(queryBean);
	}
	
	public Page<ThumbImg> search(ThumbImgQueryBean queryBean, int offset,
			int pagesize) {
		return thumbImgDao.search(queryBean, offset, pagesize);
	}

	public ThumbImg thumb(ThumbImgQueryBean queryBean) {
		List<ThumbImg> thumbImgList = thumbImgDao.list(queryBean);
		ThumbImg thumbImg = new ThumbImg();
		if (thumbImgList.isEmpty()) {
			thumbImg.setHeight(queryBean.getHeight());
			thumbImg.setWidth(queryBean.getWidth());
			// 创建缩略图
			String path = "upload/thumbImg/";
			String date = DateUtil.getDateTime("yyyyMMdd", new Date());
			String fileName = thumbImg.getWidth() + "-" + thumbImg.getHeight()
					+ ".jpg";
			try {
				ImageUtil.thumbImage(queryBean.getOrigImg(), path + date + "/",
						fileName, thumbImg.getWidth(), thumbImg.getHeight(),
						queryBean.type);
			} catch (MagickException e) {
				e.printStackTrace();
			}
			thumbImg.setAddTime(new Date());
			thumbImg.setImg(fileName);
			thumbImg.setType(queryBean.type);
			thumbImg.setName(queryBean.name);
			thumbImg.setDescription(queryBean.description);
			thumbImg.setOrigImg(queryBean.origImg);
			thumbImg = save(thumbImg);
		} else {
			thumbImg = thumbImgList.get(0);
		}
		return thumbImg;
	}
}