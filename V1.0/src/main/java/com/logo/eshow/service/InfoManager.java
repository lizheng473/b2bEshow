package com.logo.eshow.service;

import java.util.List;

import com.logo.eshow.bean.query.InfoQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Info;
import com.logo.eshow.service.GenericManager;

import javax.jws.WebService;

@WebService
public interface InfoManager extends GenericManager<Info, Integer> {

	List<Info> list(InfoQueryBean queryBean);

	Page<Info> search(InfoQueryBean queryBean, int offset, int pagesize);
}