package com.logo.eshow.webapp.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.OrderForm;
import com.logo.eshow.model.Product;
import com.logo.eshow.model.ProductionTask;
import com.logo.eshow.service.OrderFormManager;
import com.logo.eshow.service.ProductCategoryManager;
import com.logo.eshow.service.ProductManager;
import com.logo.eshow.service.ProductionTaskManager;
import com.logo.eshow.util.PageUtil;

@Results( {
		@Result(name = "input", value = "add"),
		@Result(name = "list", type = ServletRedirectResult.class, value = ""),
		@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
		@Result(name = "edit", type = ServletRedirectResult.class, value = "edit/${id}"),
		@Result(name = "ordersubmit", type = ServletRedirectResult.class, value = "ok.jsp"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })

public class OrderAction extends BaseFileUploadAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductManager productManager;
	private OrderFormManager orderFormManager;
	private ProductCategoryManager productCategoryManager;
	private ProductionTaskManager productionTaskManager;
	
	private List<OrderForm> orderForms;
	private ProductionTask productionTask;
	private List<ProductionTask> productionTasks;
	private OrderForm orderForm;
	private List<Product> products;
	private Product product;
	private OrderFormQueryBean queryBean;
	private Integer productCategoryId;
	
	public String list() {
		orderForms = orderFormManager.list(queryBean);
		return LIST;
	}
	
	public String category() {
		Page<OrderForm> page = orderFormManager
				.search(queryBean, getOffset(), pagesize);
		orderForms = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}
	
	public String search() {
		Page<OrderForm> page = orderFormManager.search(queryBean, getOffset(), pagesize);
		orderForms = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		productManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String prepareAddOrder() {
		if (id != null) {
			product = productManager.get(id);
		} else {
			return INDEX;

		}
		return NONE;
	}
	
	public String view() {
//		if(true){
//			if (id != null) {
//				product = productManager.get(id);
//			} else {
//				return INDEX;
//
//			}
//			return NONE;
//		}
		if (id != null) {
			orderForm = orderFormManager.get(id);
			product = productManager.get(orderForm.getProductId());
		} else {
			return INDEX;

		}
		return NONE;
	}
	
	public String update() throws Exception {
		
		OrderForm orderFormold = orderFormManager.get(id);
		
		orderFormold.setStatus(orderForm.getStatus());
		orderFormManager.save(orderFormold);
		
		if("3".equals(orderForm.getStatus())){//如果是派送生产车间，则在车间任务表插入数据
			ProductionTask productionTask = new ProductionTask();
			
			productionTask.setOrderfromid(orderFormold.getId());
			productionTask.setWorkshopid(1);
			productionTask.setAddTime(new Date());
			productionTask.setOperateuserid(String.valueOf(this.getSessionUser().getId()));
			productionTask.setOperateusername(this.getSessionUser().getUsername());
			productionTask.setStatus("1");
			productionTask.setValid("1");
			
			productionTaskManager.save(productionTask);
		}
		
		saveMessage("修改成功");
		return "edit";
	}

	public String save() throws Exception {
		orderForm.setAddTime(new Date());
		
		orderForm.setUser(getSessionUser());
		orderForm.setRealamount(11);
		orderForm.setOrderamount(11);
		orderForm = orderFormManager.save(orderForm);
//		if (file != null) {
//			String path = "upload/product/"
//					+ DateUtil.getDateTime("yyyyMMdd", product.getAddTime())
//					+ "/";
//			String fileName = product.getId() + ".jpg";
//			ImageUtil.uploadImage(path, fileName, file, 200, 200, "zoom");
//			product.setImg(fileName);
//			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
//					600, 600, "zoom");
//			productManager.save(product);
//		}
//		
		saveMessage("添加成功");
		id = orderForm.getId();
		//return SUCCESS;
		return "ordersubmit";
	}

	public OrderFormManager getOrderFormManager() {
		return orderFormManager;
	}

	public void setOrderFormManager(OrderFormManager orderFormManager) {
		this.orderFormManager = orderFormManager;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}

	public OrderForm getOrderForm() {
		return orderForm;
	}

	public void setOrderForm(OrderForm orderForm) {
		this.orderForm = orderForm;
	}

	public ProductManager getProductManager() {
		return productManager;
	}

	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	public Integer getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Integer productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public void setProductCategoryManager(ProductCategoryManager productCategoryManager) {
		this.productCategoryManager = productCategoryManager;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OrderFormQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(OrderFormQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public ProductCategoryManager getProductCategoryManager() {
		return productCategoryManager;
	}

	public ProductionTaskManager getProductionTaskManager() {
		return productionTaskManager;
	}

	public void setProductionTaskManager(ProductionTaskManager productionTaskManager) {
		this.productionTaskManager = productionTaskManager;
	}

	public ProductionTask getProductionTask() {
		return productionTask;
	}

	public void setProductionTask(ProductionTask productionTask) {
		this.productionTask = productionTask;
	}

	public List<ProductionTask> getProductionTasks() {
		return productionTasks;
	}

	public void setProductionTasks(List<ProductionTask> productionTasks) {
		this.productionTasks = productionTasks;
	}
	
	
}