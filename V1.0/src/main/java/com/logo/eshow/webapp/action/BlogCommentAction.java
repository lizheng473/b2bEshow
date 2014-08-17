package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.BlogCommentQueryBean;
import com.logo.eshow.model.Blog;
import com.logo.eshow.model.BlogComment;
import com.logo.eshow.service.BlogCommentManager;
import com.logo.eshow.service.BlogManager;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.common.CommonVar;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.util.CommonUtil;
import com.logo.eshow.util.PageUtil;

import java.util.Date;
import java.util.List;

import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletRedirectResult;

@Results( {
		@Result(name = "input", type = ServletRedirectResult.class, value = ""),
		@Result(name = "list", type = ServletRedirectResult.class, value = "${id}"),
		@Result(name = "success", type = ServletRedirectResult.class, value = "view/${id}"),
		@Result(name = "redirect", type = ServletRedirectResult.class, value = "${redirect}") })
public class BlogCommentAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BlogCommentManager blogCommentManager;
	private BlogManager blogManager;
	private List<BlogComment> blogComments;
	private BlogComment blogComment;
	private BlogCommentQueryBean queryBean;
	private Integer blogId;
	
	public String list() {
		blogComments = blogCommentManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<BlogComment> page = blogCommentManager.search(queryBean,
				getOffset(), pagesize);
		blogComments = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		BlogComment blogComment = blogCommentManager.get(id);
		// 日志的主人可以删除回复，回复主人可以删除自己的回复
		if (blogComment != null) {
			if (blogComment.getBlog().getUser().equals(getSessionUser())
					||blogComment.getUser().equals(getSessionUser()) || getSessionUser().getUsername().equals("service@fanbao.com")) {
				Blog blog = blogComment.getBlog();
				blog.setCommentSize(blog.getCommentSize() - CommonVar.STEP);
				blogManager.save(blog);
				blogCommentManager.remove(id);
				saveMessage("删除成功");
			} else {
				saveMessage("无权删除");
			}
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			blogComment = blogCommentManager.get(id);
			if (!blogComment.getUser().getId().equals(getSessionUser().getId())) {
				return INDEX;
			}
		} else {
			return INDEX;
		}
		return NONE;
	}

	public String update() throws Exception {
		BlogComment old = blogCommentManager.get(id);
		old.setName(blogComment.getName());
		old.setContent(blogComment.getContent());
		old.setEmail(blogComment.getEmail());
		old.setIm(blogComment.getIm());
		old.setIp(blogComment.getIp());
		old.setWebsite(blogComment.getWebsite());
		blogCommentManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		blogComment.setAddTime(new Date());
		blogComment.setUser(getSessionUser());
		Blog blog = blogManager.get(blogId);
		blog.setCommentSize(CommonUtil.count(blog.getCommentSize()));
		blogComment.setBlog(blog);
		blogCommentManager.save(blogComment);
		id = blogComment.getBlog().getId();
		saveMessage("添加成功");
		return SUCCESS;
	}

	public BlogCommentManager getBlogCommentManager() {
		return blogCommentManager;
	}

	public void setBlogCommentManager(BlogCommentManager blogCommentManager) {
		this.blogCommentManager = blogCommentManager;
	}

	public BlogManager getBlogManager() {
		return blogManager;
	}

	public void setBlogManager(BlogManager blogManager) {
		this.blogManager = blogManager;
	}

	public List<BlogComment> getBlogComments() {
		return blogComments;
	}

	public void setBlogComments(List<BlogComment> blogComments) {
		this.blogComments = blogComments;
	}

	public BlogComment getBlogComment() {
		return blogComment;
	}

	public void setBlogComment(BlogComment blogComment) {
		this.blogComment = blogComment;
	}

	public BlogCommentQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(BlogCommentQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

}