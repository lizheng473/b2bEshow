package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.ProductCategoryQueryBean;
import com.logo.eshow.bean.query.ProductQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Product;
import com.logo.eshow.model.ProductCategory;
import com.logo.eshow.service.ProductCategoryManager;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.service.ProductManager;
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
public class ProductCategoryAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductCategoryManager productCategoryManager;
	private ProductManager productManager;
	private List<ProductCategory> productCategories;
	private ProductCategory productCategory;
	private ProductCategoryQueryBean queryBean;

	public String list() {
		productCategories = productCategoryManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<ProductCategory> page = productCategoryManager.search(queryBean,
				getOffset(), pagesize);
		productCategories = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		ProductCategory productCategory = productCategoryManager.get(id);
		if (productCategory != null) {
			// 查询当前分类下的产品类别
			ProductQueryBean productQueryBean = new ProductQueryBean();
			productQueryBean.setProductCategoryId(id);
			List<Product> products = productManager.list(productQueryBean);
			for (Product product : products) {
				product.setProductCategory(null);
				productManager.save(product);
			}
			productCategoryManager.remove(id);
			saveMessage("删除成功");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			productCategory = productCategoryManager.get(id);
		} else {
			return INDEX;
		}
		return NONE;
	}

	public String update() throws Exception {
		ProductCategory old = productCategoryManager.get(id);
		old.setName(productCategory.getName());
		old.setDescription(productCategory.getDescription());
		productCategoryManager.save(old);
		saveMessage("修改成功");
		return LIST;
	}

	public String save() throws Exception {
		productCategoryManager.save(productCategory);
		saveMessage("添加成功");
		return LIST;
	}

	public ProductCategoryManager getProductCategoryManager() {
		return productCategoryManager;
	}

	public void setProductCategoryManager(
			ProductCategoryManager productCategoryManager) {
		this.productCategoryManager = productCategoryManager;
	}

	public ProductManager getProductManager() {
		return productManager;
	}

	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}

	public List<ProductCategory> getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(List<ProductCategory> productCategories) {
		this.productCategories = productCategories;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public ProductCategoryQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(ProductCategoryQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}