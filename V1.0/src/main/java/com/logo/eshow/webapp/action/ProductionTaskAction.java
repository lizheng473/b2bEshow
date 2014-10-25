package com.logo.eshow.webapp.action;

import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.bean.query.ProductionTaskQueryBean;
import com.logo.eshow.bean.query.WorkShopQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.OrderForm;
import com.logo.eshow.model.Product;
import com.logo.eshow.model.ProductionTask;
import com.logo.eshow.model.WorkShop;
import com.logo.eshow.service.OrderFormManager;
import com.logo.eshow.service.ProductCategoryManager;
import com.logo.eshow.service.ProductManager;
import com.logo.eshow.service.ProductionTaskManager;
import com.logo.eshow.service.UserManager;
import com.logo.eshow.service.WorkShopManager;
import com.logo.eshow.util.DateUtil;
import com.logo.eshow.util.ImageUtil;
import com.logo.eshow.util.PageUtil;

/*
 * 生产任务类ACTION
 * 查询车间的生产任务
 * 
 * 
 * */
@Results( {
	@Result(name = "input", value = "add"),
	@Result(name = "list", type = ServletRedirectResult.class, value = ""),
	@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
	@Result(name = "edit", type = ServletRedirectResult.class, value = "edit/${id}"),
	@Result(name = "ordersubmit", type = ServletRedirectResult.class, value = "ok.jsp"),
	@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class ProductionTaskAction  extends BaseFileUploadAction  {

	private static final long serialVersionUID = 1L;
	private ProductManager productManager;
	private OrderFormManager orderFormManager;
	private ProductCategoryManager productCategoryManager;
	private List<OrderForm> orderForms;
	private OrderForm orderForm;
	private List<Product> products;
	private Product product;
	private OrderFormQueryBean orderFormQueryBean;
	private Integer productCategoryId;
	
	private ProductionTaskManager  productionTaskManager;
	private List<ProductionTask> productionTasks;
	private ProductionTask productionTask;
	private ProductionTaskQueryBean queryBean;
	
	
	private WorkShop workShop;
	private WorkShopQueryBean workShopQueryBean;
	private List<WorkShop> workShops;
	private WorkShopManager workShopManager;
	private Integer workShopid;
	
	private UserManager userManager;
	
	public String view() {
		if (id != null) {
			productionTask = productionTaskManager.get(id);
			if(productionTask==null){
				
			}else{
				orderForm = orderFormManager.get(productionTask.getOrderfromid());
				product = productManager.get(orderForm.getProductId());
			}
		} else {
			return INDEX;

		}
		return NONE;
	}
	
	public String list() {
		productionTasks = productionTaskManager.list(queryBean);
		return LIST;
	}
	
	public String category() {
		Page<OrderForm> page = orderFormManager
				.search(orderFormQueryBean, getOffset(), pagesize);
		orderForms = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}
	
	public String search() {
		Page<ProductionTask> page = productionTaskManager.search(queryBean, getOffset(), pagesize);
		productionTasks = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		productManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}
	public String update() throws Exception {
		Product old = productManager.get(id);
		old.setName(product.getName());
		old.setContent(product.getContent());
		if(productCategoryId != null){
			old.setProductCategory(productCategoryManager.get(productCategoryId));
		}
		
		if (file != null) {
			String path = "upload/product/"
					+ DateUtil.getDateTime("yyyyMMdd", old.getAddTime()) + "/";
			String fileName = old.getId() + ".jpg";
			ImageUtil.uploadImage(path, fileName, file, 200, 150, "zoom");
			old.setImg(fileName);
			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
					600, 600, "zoom");
		}
		productManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public ProductManager getProductManager() {
		return productManager;
	}

	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}

	public OrderFormManager getOrderFormManager() {
		return orderFormManager;
	}

	public void setOrderFormManager(OrderFormManager orderFormManager) {
		this.orderFormManager = orderFormManager;
	}

	public ProductCategoryManager getProductCategoryManager() {
		return productCategoryManager;
	}

	public void setProductCategoryManager(
			ProductCategoryManager productCategoryManager) {
		this.productCategoryManager = productCategoryManager;
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

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Integer productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public ProductionTaskManager getProductionTaskManager() {
		return productionTaskManager;
	}

	public void setProductionTaskManager(ProductionTaskManager productionTaskManager) {
		this.productionTaskManager = productionTaskManager;
	}

	public List<ProductionTask> getProductionTasks() {
		return productionTasks;
	}

	public void setProductionTasks(List<ProductionTask> productionTasks) {
		productionTasks = productionTasks;
	}

	public ProductionTask getProductionTask() {
		return productionTask;
	}

	public void setProductionTask(ProductionTask productionTask) {
		productionTask = productionTask;
	}

	public WorkShop getWorkShop() {
		return workShop;
	}

	public void setWorkShop(WorkShop workShop) {
		this.workShop = workShop;
	}

	public WorkShopQueryBean getWorkShopQueryBean() {
		return workShopQueryBean;
	}

	public void setWorkShopQueryBean(WorkShopQueryBean workShopQueryBean) {
		this.workShopQueryBean = workShopQueryBean;
	}

	public List<WorkShop> getWorkShops() {
		return workShops;
	}

	public void setWorkShops(List<WorkShop> workShops) {
		this.workShops = workShops;
	}

	public WorkShopManager getWorkShopManager() {
		return workShopManager;
	}

	public void setWorkShopManager(WorkShopManager workShopManager) {
		this.workShopManager = workShopManager;
	}

	public Integer getWorkShopid() {
		return workShopid;
	}

	public void setWorkShopid(Integer workShopid) {
		this.workShopid = workShopid;
	}

	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public OrderFormQueryBean getOrderFormQueryBean() {
		return orderFormQueryBean;
	}

	public void setOrderFormQueryBean(OrderFormQueryBean orderFormQueryBean) {
		this.orderFormQueryBean = orderFormQueryBean;
	}

	public ProductionTaskQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ProductionTaskQueryBean queryBean) {
		this.queryBean = queryBean;
	}
	
	
}
