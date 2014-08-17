package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.FeedbackQueryBean;
import com.logo.eshow.model.Feedback;
import com.logo.eshow.service.FeedbackManager;
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
public class FeedbackAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FeedbackManager feedbackManager;
	private List<Feedback> feedbacks;
	private Feedback feedback;
	private FeedbackQueryBean queryBean;
	private Integer replyId;
	private String reply;
	
	public String list() {
		feedbacks = feedbackManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Feedback> page = feedbackManager.search(queryBean, getOffset(),
				pagesize);
		feedbacks = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		feedbackManager.remove(id);
		saveMessage("删除成功");
		return LIST;
	}

	public String view() {
		if (id != null) {
			feedback = feedbackManager.get(id);
		} else {
			feedback = new Feedback();

		}
		return NONE;
	}

	public String save() throws Exception {
		feedback.setAddTime(new Date());
		feedbackManager.save(feedback);
		saveMessage("留言成功");
		id = feedback.getId();
		return LIST;

	}

	public String update() throws Exception {
		Feedback old = feedbackManager.get(id);
		old.setTitle(feedback.getTitle());
		old.setContent(feedback.getContent());
		feedbackManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	/**
	 * 回复留言
	 * 
	 * @return
	 * @throws Exception
	 */
	public String reply() throws Exception {
		Feedback old = feedbackManager.get(id);
		old.setReply(feedback.getReply());
		feedbackManager.save(old);
		saveMessage("留言成功");
		return SUCCESS;
	}

	public FeedbackManager getFeedbackManager() {
		return feedbackManager;
	}

	public void setFeedbackManager(FeedbackManager feedbackManager) {
		this.feedbackManager = feedbackManager;
	}

	public List<Feedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(List<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public FeedbackQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(FeedbackQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
}