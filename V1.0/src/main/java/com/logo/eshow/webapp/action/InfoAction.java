package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.InfoQueryBean;
import com.logo.eshow.model.Info;
import com.logo.eshow.service.InfoManager;
import com.logo.eshow.webapp.action.BaseAction;
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
public class InfoAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private InfoManager infoManager;
	private List<Info> infos;
	private Info info;
	private InfoQueryBean queryBean;

	public String list() {
		infos = infoManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Info> page = infoManager.search(queryBean, getOffset(), pagesize);
		infos = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		infoManager.remove(id);
		saveMessage("删除成功");
		return INDEX;
	}

	public String view() {
		if (id != null) {
			info = infoManager.get(id);
		} else {
			return INDEX;
		}
		return NONE;
	}

	public String browse() {
		info = infoManager.getBy("url", info.getUrl());
		return NONE;
	}

	public String update() throws Exception {
		Info old = infoManager.get(id);
		old.setTitle(info.getTitle());
		old.setContent(info.getContent());
		old.setUrl(info.getUrl());
		infoManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		infoManager.save(info);
		saveMessage("添加成功");
		return SUCCESS;
	}

	public InfoManager getInfoManager() {
		return infoManager;
	}

	public void setInfoManager(InfoManager infoManager) {
		this.infoManager = infoManager;
	}

	public List<Info> getInfos() {
		return infos;
	}

	public void setInfos(List<Info> infos) {
		this.infos = infos;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public InfoQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(InfoQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}