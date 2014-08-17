package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.TwitterCommentQueryBean;
import com.logo.eshow.model.Topic;
import com.logo.eshow.model.Twitter;
import com.logo.eshow.model.TwitterComment;
import com.logo.eshow.service.TwitterCommentManager;
import com.logo.eshow.service.TwitterManager;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.util.CommonUtil;
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
public class TwitterCommentAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TwitterCommentManager twitterCommentManager;
	private TwitterManager twitterManager;
	private List<TwitterComment> twitterComments;
	private TwitterComment twitterComment;
	private TwitterCommentQueryBean queryBean;
	private Integer twitterId;
	
	public String list() {
		twitterComments = twitterCommentManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<TwitterComment> page = twitterCommentManager.search(queryBean,
				getOffset(), pagesize);
		twitterComments = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		TwitterComment twitterComment = twitterCommentManager.get(id);
		// 微博客的主人可以删除回复，回复主人可以删除自己的回复
		if (twitterComment.getUser().getId().equals(getSessionUser().getId())) {
			Twitter twitter = twitterComment.getTwitter();
			twitter.setCommentSize(twitter.getCommentSize()-1);
			twitterManager.save(twitter);
			twitterCommentManager.remove(id);
			saveMessage("删除成功");
		} else {
			saveMessage("无权删除");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			twitterComment = twitterCommentManager.get(id);
		} else {
			twitterComment = new TwitterComment();
		}
		return NONE;
	}

	public String update() throws Exception {
		TwitterComment old = twitterCommentManager.get(id);
		old.setContent(twitterComment.getContent());
		twitterCommentManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		twitterComment.setAddTime(new Date());
		twitterComment.setUser(getSessionUser());
		Twitter twitter = twitterManager.get(twitterId);
		twitter.setCommentSize(CommonUtil.count(twitter.getCommentSize()));
		twitterComment.setTwitter(twitter);
		twitterComment = twitterCommentManager.save(twitterComment);
		saveMessage("添加成功");

		id = twitterComment.getTwitter().getId();
		return SUCCESS;
	}

	public TwitterCommentManager getTwitterCommentManager() {
		return twitterCommentManager;
	}

	public void setTwitterCommentManager(
			TwitterCommentManager twitterCommentManager) {
		this.twitterCommentManager = twitterCommentManager;
	}

	public TwitterManager getTwitterManager() {
		return twitterManager;
	}

	public void setTwitterManager(TwitterManager twitterManager) {
		this.twitterManager = twitterManager;
	}

	public List<TwitterComment> getTwitterComments() {
		return twitterComments;
	}

	public void setTwitterComments(List<TwitterComment> twitterComments) {
		this.twitterComments = twitterComments;
	}

	public TwitterComment getTwitterComment() {
		return twitterComment;
	}

	public void setTwitterComment(TwitterComment twitterComment) {
		this.twitterComment = twitterComment;
	}

	public TwitterCommentQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(TwitterCommentQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public Integer getTwitterId() {
		return twitterId;
	}

	public void setTwitterId(Integer twitterId) {
		this.twitterId = twitterId;
	}

}