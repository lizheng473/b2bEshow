package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.AppQueryBean;
import com.logo.eshow.model.App;
import com.logo.eshow.service.AppManager;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.util.PageUtil;

import java.util.Date;
import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

@Results( {
		@Result(name = "input", value = "add"),
		@Result(name = "list", type = ServletRedirectResult.class, value = ""),
		@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class AppAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4663487175099570373L;
	private AppManager appManager;
	private List<App> apps;
	private App app;
	private AppQueryBean queryBean;

	public String list() {
		apps = appManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<App> page = appManager
				.search(queryBean, getOffset(), pagesize);
		apps = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		appManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			app = appManager.get(id);
		} else {
			app = new App();
		}

		return NONE;
	}

	public String update() throws Exception {
		App old = appManager.get(id);
		old.setName(app.getName());
		old.setUrl(app.getUrl());
		appManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		app.setAddTime(new Date());
		app.setUser(getSessionUser());
		appManager.save(app);
		saveMessage("添加成功");
		id = app.getId();
		return SUCCESS;
	}

	public AppManager getAppManager() {
		return appManager;
	}

	public void setAppManager(AppManager appManager) {
		this.appManager = appManager;
	}

	public List<App> getApps() {
		return apps;
	}

	public void setApps(List<App> apps) {
		this.apps = apps;
	}

	public App getApp() {
		return app;
	}

	public void setApp(App app) {
		this.app = app;
	}

	public AppQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(AppQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}