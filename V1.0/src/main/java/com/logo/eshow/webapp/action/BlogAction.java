package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.BlogQueryBean;
import com.logo.eshow.model.Blog;
import com.logo.eshow.model.Category;
import com.logo.eshow.service.BlogManager;
import com.logo.eshow.service.CategoryManager;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.common.CommonVar;
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
public class BlogAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BlogManager blogManager;
	private CategoryManager categoryManager;
	private List<Blog> blogs;
	private Blog blog;
	private BlogQueryBean queryBean;
	private Integer categoryId;
	
	public String list() {
		blogs = blogManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Blog> page = blogManager.search(queryBean, getOffset(), pagesize);
		blogs = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String category() {
		Page<Blog> page = blogManager
				.search(queryBean, getOffset(), pagesize);
		blogs = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		Blog blog = blogManager.get(id);
		if (blog.getUser().equals(getSessionUser())) {
			if (blog.getCategory() == null) {
				blogManager.remove(id);
				saveMessage("删除成功");
			} else {
				Category category = blog.getCategory();
				categoryManager.save(category);
				blogManager.remove(id);
				saveMessage("删除成功");
			}
		} else {
			saveMessage("无权删除");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			blog = blogManager.get(id);
			blog.setCount(blog.getCount()+CommonVar.STEP);
			blog = blogManager.save(blog);
		} else {
			blog = new Blog();
		}
		return SUCCESS;
	}

	public String update() throws Exception {
		Blog old = blogManager.get(id);
		old.setTitle(blog.getTitle());
		old.setContent(blog.getContent());
		if (categoryId != null) {
			old.setCategory(categoryManager.get(categoryId));
		}
		blogManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		blog.setAddTime(new Date());
		blog.setUpdateTime(new Date());
		blog.setCommentSize(CommonVar.DEFAULT);
		blog.setCount(CommonVar.DEFAULT);
		if (categoryId != null) {
			Category category = categoryManager.get(categoryId);
			blog.setCategory(category);
		}
		blog.setUser(getSessionUser());
		blogManager.save(blog);
		saveMessage("添加成功");
		id = blog.getId();
		return LIST;
	}

	public BlogManager getBlogManager() {
		return blogManager;
	}

	public void setBlogManager(BlogManager blogManager) {
		this.blogManager = blogManager;
	}

	public CategoryManager getCategoryManager() {
		return categoryManager;
	}

	public void setCategoryManager(CategoryManager categoryManager) {
		this.categoryManager = categoryManager;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public BlogQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(BlogQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

}