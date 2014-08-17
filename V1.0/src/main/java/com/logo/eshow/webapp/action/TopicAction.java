package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Topic;
import com.logo.eshow.service.TopicManager;
import com.logo.eshow.service.BoardManager;
import com.logo.eshow.util.PageUtil;
import com.logo.eshow.webapp.action.BaseAction;
import com.logo.eshow.common.CommonVar;

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
public class TopicAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TopicManager topicManager;
	private BoardManager boardManager;
	private List<Topic> topics;
	private Topic topic;
	private TopicQueryBean queryBean;
	private Integer boardId;

	public String list() {
		topics = topicManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Topic> page = topicManager
				.search(queryBean, getOffset(), pagesize);
		topics = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		Topic old = topicManager.get(id);
		if (old.getUser().getId().equals(getSessionUser().getId())) {
			if(old.getCommentSize() == 0){
				topicManager.remove(id);
				saveMessage("删除成功");
			}
			else{
				saveMessage("无权删除");
			}
		}else{
			saveMessage("无权删除");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			topic = topicManager.get(id);
			topic.setCount(topic.getCount() + +CommonVar.STEP);
			topicManager.save(topic);
		} else {
			topic = new Topic();

		}
		return SUCCESS;
	}

	public String update() throws Exception {
		Topic old = topicManager.get(id);
		old.setUpdateTime(new Date());
		old.setTitle(topic.getTitle());
		old.setContent(topic.getContent());
		if (boardId != null) {
			old.setBoard(boardManager.get(boardId));
		}
		topicManager.save(old);
		saveMessage("修改成功");
		return SUCCESS;
	}

	public String save() throws Exception {
		topic.setAddTime(new Date());
		topic.setUpdateTime(new Date());
		topic.setState(CommonVar.TOPIC_STATE_UNAUDIT);
		topic.setEnabled(Boolean.TRUE);
		topic.setCommentSize(CommonVar.DEFAULT);
		topic.setCount(CommonVar.DEFAULT);
		if (boardId != null) {
			topic.setBoard(boardManager.get(boardId));
		}
		topic.setUser(getSessionUser());
		topicManager.save(topic);
		saveMessage("添加成功");
		id = topic.getId();
		return LIST;
	}

	public String state() throws Exception {
		Topic old = topicManager.get(id);
		old.setState(topic.getState());
		topicManager.save(old);
		saveMessage("审核成功");
		return SUCCESS;
	}

	public TopicManager getTopicManager() {
		return topicManager;
	}

	public void setTopicManager(TopicManager topicManager) {
		this.topicManager = topicManager;
	}

	public BoardManager getBoardManager() {
		return boardManager;
	}

	public void setBoardManager(BoardManager boardManager) {
		this.boardManager = boardManager;
	}

	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public TopicQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(TopicQueryBean queryBean) {
		this.queryBean = queryBean;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

}