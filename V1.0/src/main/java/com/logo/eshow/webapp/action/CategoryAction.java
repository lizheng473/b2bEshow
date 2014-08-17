package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.CategoryQueryBean;
import com.logo.eshow.bean.query.BlogQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Category;
import com.logo.eshow.model.Blog;
import com.logo.eshow.service.CategoryManager;
import com.logo.eshow.service.BlogManager;
import com.logo.eshow.util.PageUtil;
import com.logo.eshow.webapp.action.BaseAction;

import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

@Results( {
		@Result(name = "input", value = "add"),
		@Result(name = "list", type = ServletRedirectResult.class, value = ""),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class CategoryAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CategoryManager categoryManager;
	private BlogManager blogManager;
	private List<Category> categories;
	private Category category;
	private CategoryQueryBean queryBean = new CategoryQueryBean();

	public String list() {
		categories = categoryManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Category> page = categoryManager.search(queryBean, getOffset(),
				pagesize);
		categories = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		Category category = categoryManager.get(id);
		if (category != null) {
			// 查询当前分类下的日志
			BlogQueryBean blogQueryBean = new BlogQueryBean();
			blogQueryBean.setCategoryId(id);
			List<Blog> blogs = blogManager.list(blogQueryBean);
			for (Blog blog : blogs) {
				blog.setCategory(null);
				blogManager.save(blog);
			}
			categoryManager.remove(id);
			saveMessage("删除成功");

		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			category = categoryManager.get(id);
		}
		return NONE;
	}

	public String update() throws Exception {
		Category old = categoryManager.get(id);
		old.setName(category.getName());
		old.setRemark(category.getRemark());
		categoryManager.save(old);
		saveMessage("修改成功");
		return LIST;
	}

	public String save() throws Exception {
		categoryManager.save(category);
		saveMessage("添加成功");
		return LIST;
	}

	public CategoryManager getCategoryManager() {
		return categoryManager;
	}

	public void setCategoryManager(CategoryManager categoryManager) {
		this.categoryManager = categoryManager;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public CategoryQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(CategoryQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public BlogManager getBlogManager() {
		return blogManager;
	}

	public void setBlogManager(BlogManager blogManager) {
		this.blogManager = blogManager;
	}

}