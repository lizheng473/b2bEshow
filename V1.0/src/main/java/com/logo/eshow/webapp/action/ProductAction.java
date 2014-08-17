package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.ProductQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Blog;
import com.logo.eshow.model.Product;
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
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class ProductAction extends BaseFileUploadAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductManager productManager;
	private ProductCategoryManager productCategoryManager;
	private List<Product> products;
	private Product product;
	private ProductQueryBean queryBean;
	private Integer productCategoryId;
	
	public String list() {
		products = productManager.list(queryBean);
		return LIST;
	}
	
	public String category() {
		Page<Product> page = productManager
				.search(queryBean, getOffset(), pagesize);
		products = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}
	
	public String search() {
		Page<Product> page = productManager.search(queryBean, getOffset(), pagesize);
		products = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		productManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			product = productManager.get(id);
		} else {
			return INDEX;

		}
		return NONE;
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

	public String save() throws Exception {
		product.setAddTime(new Date());
		if (productCategoryId != null) {
			product.setProductCategory(productCategoryManager.get(productCategoryId));
		}
		product.setUser(getSessionUser());
		product = productManager.save(product);
		if (file != null) {
			String path = "upload/product/"
					+ DateUtil.getDateTime("yyyyMMdd", product.getAddTime())
					+ "/";
			String fileName = product.getId() + ".jpg";
			ImageUtil.uploadImage(path, fileName, file, 200, 200, "zoom");
			product.setImg(fileName);
			ImageUtil.resizeImage(path + "view/", path + "orig/", fileName,
					600, 600, "zoom");
			productManager.save(product);
		}
		
		saveMessage("添加成功");
		id = product.getId();
		return SUCCESS;
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

	public ProductQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ProductQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public ProductCategoryManager getProductCategoryManager() {
		return productCategoryManager;
	}
}