package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.TwitterQueryBean;
import com.logo.eshow.model.Twitter;
import com.logo.eshow.service.TwitterManager;
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
public class TwitterAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4663487175099570373L;
	private TwitterManager twitterManager;
	private List<Twitter> twitters;
	private Twitter twitter;
	private TwitterQueryBean queryBean;
	
	public String list() {
		twitters = twitterManager.list(queryBean);
		return LIST;
	}
 
	public String search() {
		Page<Twitter> page = twitterManager.search(queryBean, getOffset(),
				pagesize);
		twitters = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		Twitter twitter = twitterManager.get(id);
		if(twitter.getUser().getId().equals(getSessionUser().getId()))
		{
			if (twitter.getCommentSize()==0) {
				twitterManager.remove(id);
				saveMessage("删除成功");
			}else{
				saveMessage("无权删除");
			}
		}else{
			saveMessage("无权删除");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			twitter = twitterManager.get(id);
		} else {
			twitter = new Twitter();
		}

		return NONE;
	}

	public String update() throws Exception {
		Twitter old = twitterManager.get(id);
		old.setContent(twitter.getContent());
		twitterManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		twitter.setContent(twitter.getContent());
		twitter.setAddTime(new Date());
		twitter.setUser(getSessionUser());
		twitter.setCommentSize(CommonVar.DEFAULT);
		twitter = twitterManager.save(twitter);
		saveMessage("添加成功");
		id = twitter.getId();
		return SUCCESS;
	}

	public TwitterManager getTwitterManager() {
		return twitterManager;
	}

	public void setTwitterManager(TwitterManager twitterManager) {
		this.twitterManager = twitterManager;
	}

	public List<Twitter> getTwitters() {
		return twitters;
	}

	public void setTwitters(List<Twitter> twitters) {
		this.twitters = twitters;
	}

	public Twitter getTwitter() {
		return twitter;
	}

	public void setTwitter(Twitter twitter) {
		this.twitter = twitter;
	}

	public TwitterQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(TwitterQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}