package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.ServiceQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Service;
import com.logo.eshow.service.ServiceManager;
import com.logo.eshow.service.ServiceTypeManager;
import com.logo.eshow.util.DateUtil;
import com.logo.eshow.util.ImageUtil;
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
public class ServiceAction extends BaseFileUploadAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServiceManager serviceManager;
	private ServiceTypeManager serviceTypeManager;
	private List<Service> services;
	private Service service;
	private ServiceQueryBean queryBean;
	private Integer serviceTypeId;

	public String list() {
		services = serviceManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Service> page = serviceManager.search(queryBean, getOffset(),
				pagesize);
		services = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}
	
	public String delete() {
		serviceManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			service = serviceManager.get(id);
		} else {
			return INDEX;

		}
		return NONE;
	}

	public String update() throws Exception {
		Service old = serviceManager.get(id);
		old.setTitle(service.getTitle());
		old.setContent(service.getContent());
		if (serviceTypeId != null) {
			old.setServiceType(serviceTypeManager.get(serviceTypeId));
		}
		if (file != null) {
			String path = "upload/service/"
					+ DateUtil.getDateTime("yyyyMMdd", old.getAddTime()) + "/";
			String fileName = old.getId() + ".jpg";
			ImageUtil.uploadImage(path, fileName, file, 200, 150, "zoom");
			old.setImg(fileName);
			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
					600, 600, "zoom");
		}
		serviceManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		service.setAddTime(new Date());
		service.setUpdateTime(new Date());
		if (serviceTypeId != null) {
			service.setServiceType(serviceTypeManager.get(serviceTypeId));
		}
		service.setUser(getSessionUser());
		service = serviceManager.save(service);
		if (file != null) {
			String path = "upload/service/"
					+ DateUtil.getDateTime("yyyyMMdd", service.getAddTime())
					+ "/";
			String fileName = service.getId() + ".jpg";
			ImageUtil.uploadImage(path, fileName, file, 200, 200, "zoom");
			service.setImg(fileName);
			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
					600, 600, "zoom");
			serviceManager.save(service);
		}

		saveMessage("添加成功");
		id = service.getId();
		return LIST;
	}

	public ServiceManager getServiceManager() {
		return serviceManager;
	}

	public void setServiceManager(ServiceManager serviceManager) {
		this.serviceManager = serviceManager;
	}

	public List<Service> getServices() {
		return services;
	}

	public void setServices(List<Service> services) {
		this.services = services;
	}

	public Integer getServiceTypeId() {
		return serviceTypeId;
	}

	public void setServiceTypeId(Integer serviceTypeId) {
		this.serviceTypeId = serviceTypeId;
	}

	public void setServiceTypeManager(ServiceTypeManager serviceTypeManager) {
		this.serviceTypeManager = serviceTypeManager;
	}

	public Service getService() {
		return service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public ServiceQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ServiceQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public ServiceTypeManager getServiceTypeManager() {
		return serviceTypeManager;
	}
}