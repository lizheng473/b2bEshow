package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.ThumbImgQueryBean;
import com.logo.eshow.model.ThumbImg;
import com.logo.eshow.service.ThumbImgManager;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.util.PageUtil;

import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

@Results( {
		@Result(name = "input", value = "add"),
		@Result(name = "list", type = ServletRedirectResult.class, value = ""),
		@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class ThumbImgAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ThumbImgManager thumbImgManager;
	private List<ThumbImg> thumbImgs;
	private ThumbImg thumbImg;
	private ThumbImgQueryBean queryBean;
	
	public String list()
	{
		thumbImgs = thumbImgManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<ThumbImg> page = thumbImgManager.search(queryBean, getOffset(),
				pagesize);
		thumbImgs = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		thumbImgManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			thumbImg = thumbImgManager.get(id);
		} else {
			thumbImg = new ThumbImg();
		}
		return SUCCESS;
	}

	/**
	 * 查看缩略图，如果找不到则添加 根据高度，宽度，原图查询
	 * 
	 * @return
	 */

	public String thumb() {
		thumbImg = thumbImgManager.thumb(queryBean);
		return SUCCESS;

	}

	public ThumbImgManager getThumbImgManager() {
		return thumbImgManager;
	}

	public void setThumbImgManager(ThumbImgManager thumbImgManager) {
		this.thumbImgManager = thumbImgManager;
	}

	public List<ThumbImg> getThumbImgs() {
		return thumbImgs;
	}

	public void setThumbImgs(List<ThumbImg> thumbImgs) {
		this.thumbImgs = thumbImgs;
	}

	public ThumbImg getThumbImg() {
		return thumbImg;
	}

	public void setThumbImg(ThumbImg thumbImg) {
		this.thumbImg = thumbImg;
	}

	public ThumbImgQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ThumbImgQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}