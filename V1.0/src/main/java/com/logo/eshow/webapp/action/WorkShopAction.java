package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.OrderFormQueryBean;
import com.logo.eshow.bean.query.WorkShopQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Blog;
import com.logo.eshow.model.OrderForm;
import com.logo.eshow.model.User;
import com.logo.eshow.model.WorkShop;
import com.logo.eshow.model.Product;
import com.logo.eshow.service.OrderFormManager;
import com.logo.eshow.service.UserService;
import com.logo.eshow.service.WorkShopManager;
import com.logo.eshow.service.ProductManager;
import com.logo.eshow.service.ProductCategoryManager;
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
		@Result(name = "ordersubmit", type = ServletRedirectResult.class, value = "ok.jsp"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })

public class WorkShopAction extends BaseFileUploadAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductManager productManager;
	private OrderFormManager orderFormManager;
	private ProductCategoryManager productCategoryManager;
	private List<OrderForm> orderForms;
	private OrderForm orderForm;
	private List<Product> products;
	private Product product;
	private OrderFormQueryBean queryBean;
	private Integer productCategoryId;
	
	private WorkShop workShop;
	private WorkShopQueryBean workShopQueryBean;
	private List<WorkShop> workShops;
	private WorkShopManager workShopManager;
	private Integer workShopid;
	
	private UserService userService;
	
	public String list() {
		workShops = workShopManager.list(workShopQueryBean);
		return LIST;
	}
	
	public String search() {
		Page<OrderForm> page = orderFormManager.search(queryBean, getOffset(), pagesize);
		orderForms = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		workShopManager.remove(id);
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
		if (id != null) {
			workShop = workShopManager.get(id);
			
		} else {
			return INDEX;

		}
		return NONE;
	}
	
	public String update() throws Exception {
		WorkShop old = workShopManager.get(id);
		old.setName(workShop.getName());
		old.setManagername(workShop.getManagername());
		
		User user=userService.getUserByUsername(workShop.getManagername());
		if(user!=null){
			workShop.setManagerid(user.getId());
		}
		
		old.setTel(workShop.getTel());
		old.setQq(workShop.getQq());
		old.setRemark(workShop.getRemark());
		
		workShopManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		
		workShop.setValid("1");
		User user=userService.getUserByUsername(workShop.getManagername());
		if(user!=null){
			workShop.setManagerid(user.getId());
		}
		workShopManager.save(workShop);
		
		saveMessage("添加成功");
		id = workShop.getId();
		return LIST;
		
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



	public UserService getUserService() {
		return userService;
	}



	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}