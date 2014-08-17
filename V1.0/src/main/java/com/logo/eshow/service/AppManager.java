package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.AppQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.App;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface AppManager extends GenericManager<App, Integer> {

	List<App> list(AppQueryBean queryBean);

	Page<App> search(AppQueryBean queryBean, int offset, int pagesize);
}