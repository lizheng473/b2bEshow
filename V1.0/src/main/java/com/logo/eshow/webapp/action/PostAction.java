package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.PostQueryBean;
import com.logo.eshow.model.Post;
import com.logo.eshow.service.PostManager;
import com.logo.eshow.webapp.action.BaseAction;
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
public class PostAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PostManager postManager;
	private List<Post> posts;
	private Post post;
	private PostQueryBean queryBean;

	public String list() {
		posts = postManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Post> page = postManager.search(queryBean, getOffset(), pagesize);
		posts = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		postManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			post = postManager.get(id);
		} else {
			post = new Post();
		}
		return SUCCESS;
	}

	public String update() throws Exception {
		Post old = postManager.get(id);
		old.setTitle(post.getTitle());
		old.setContent(post.getContent());
		postManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		post.setAddTime(new Date());
		post.setUser(getSessionUser());
		post.setEnabled(Boolean.TRUE);
		postManager.save(post);
		saveMessage("添加成功");
		id = post.getId();
		return SUCCESS;
	}

	public PostManager getPostManager() {
		return postManager;
	}

	public void setPostManager(PostManager postManager) {
		this.postManager = postManager;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public PostQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(PostQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}