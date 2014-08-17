package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.TopicCommentQueryBean;
import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Topic;
import com.logo.eshow.model.TopicComment;
import com.logo.eshow.service.TopicCommentManager;
import com.logo.eshow.service.TopicManager;
import com.logo.eshow.util.CommonUtil;
import com.logo.eshow.util.PageUtil;
import com.logo.eshow.webapp.action.BaseAction;

import java.util.ArrayList;
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
public class TopicCommentAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TopicCommentManager topicCommentManager;
	private TopicManager topicManager;
	private List<TopicComment> topicComments;
	private TopicComment topicComment;
	private TopicCommentQueryBean queryBean;
	private TopicQueryBean topicQueryBean;
	private Integer topicId;
	private Integer boardId;

	public String list() {
		topicComments = topicCommentManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<TopicComment> page = topicCommentManager.search(queryBean,
				getOffset(), pagesize);
		topicComments = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}
	
	/**
	 * 我参与的话题
	 * @return
	 */
	public String searchReply() {
		List<Topic> topics = new ArrayList<Topic>();
		List<TopicComment> list = new ArrayList<TopicComment>();//存放查找出来的回复
		Page<TopicComment> page = null;
		topicQueryBean = new TopicQueryBean();
		topicQueryBean.setBoardId(boardId);
		topics = topicManager.list(topicQueryBean);
		for(Topic tc:topics) {
			queryBean.setTopicId(tc.getId());
			page = topicCommentManager.search(queryBean,
					getOffset(), pagesize);
			topicComments = page.getDataList();
			if(!topicComments.isEmpty()){    //去掉同一话题的多次回复，取一个
				list.add(topicComments.get(0));
			}
		}
		topicComments = list;
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		TopicComment old = topicCommentManager.get(id);
		if (old.getUser().getId().equals(getSessionUser().getId())) {
			Topic topic = old.getTopic();
			topic.setCommentSize(topic.getCommentSize()-1);
			topicManager.save(topic);
			topicCommentManager.remove(id);
			saveMessage("删除成功");		
		}else{
			saveMessage("无权删除");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			topicComment = topicCommentManager.get(id);
		} else {
			return INDEX;
		}
		return NONE;
	}

	public String update() throws Exception {
		TopicComment old = topicCommentManager.get(id);
		old.setName(topicComment.getName());
		old.setIp(topicComment.getIp());
		old.setContent(topicComment.getContent());
		topicCommentManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		topicComment.setAddTime(new Date());
		topicComment.setUser(getSessionUser());
		Topic topic  = topicManager.get(topicId);
		topic.setCommentSize(CommonUtil.count(topic.getCommentSize()));
		topicManager.save(topic);
		topicComment.setTopic(topic);
		topicComment = topicCommentManager.save(topicComment);
		id = topicComment.getTopic().getId();
		saveMessage("添加成功");
		return SUCCESS;
	}

	public TopicCommentManager getTopicCommentManager() {
		return topicCommentManager;
	}

	public void setTopicCommentManager(TopicCommentManager topicCommentManager) {
		this.topicCommentManager = topicCommentManager;
	}

	public TopicManager getTopicManager() {
		return topicManager;
	}

	public void setTopicManager(TopicManager topicManager) {
		this.topicManager = topicManager;
	}

	public List<TopicComment> getTopicComments() {
		return topicComments;
	}

	public void setTopicComments(List<TopicComment> topicComments) {
		this.topicComments = topicComments;
	}

	public TopicComment getTopicComment() {
		return topicComment;
	}

	public void setTopicComment(TopicComment topicComment) {
		this.topicComment = topicComment;
	}

	public TopicCommentQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(TopicCommentQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public TopicQueryBean getTopicQueryBean() {
		return topicQueryBean;
	}

	public void setTopicQueryBean(TopicQueryBean topicQueryBean) {
		this.topicQueryBean = topicQueryBean;
	}

	public Integer getTopicId() {
		return topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	

}