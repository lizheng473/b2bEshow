package com.logo.eshow.webapp.action;

import com.logo.eshow.bean.query.BoardQueryBean;
import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.model.Board;
import com.logo.eshow.model.Topic;
import com.logo.eshow.service.BoardManager;
import com.logo.eshow.service.TopicManager;
import com.logo.eshow.util.PageUtil;
import com.logo.eshow.webapp.action.BaseAction;

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
public class BoardAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BoardManager boardManager;
	private TopicManager topicManager;
	private List<Board> boards;
	private Board board;
	private BoardQueryBean queryBean;

	public String list() {
		boards = boardManager.list(queryBean);
		return LIST;
	}

	public String search() {
		Page<Board> page = boardManager
				.search(queryBean, getOffset(), pagesize);
		boards = page.getDataList();
		saveRequest("page", PageUtil.conversion(page));
		return LIST;
	}

	public String delete() {
		Board board = boardManager.get(id);
		if (board != null) {
			TopicQueryBean topicQueryBean = new TopicQueryBean();
			topicQueryBean.setBoardId(id);
			List<Topic> topics = topicManager.list(topicQueryBean);
			for (Topic topic : topics) {
				topic.setBoard(null);
				topicManager.save(topic);
			}
			boardManager.remove(id);
			saveMessage("删除成功");
		}
		return LIST;
	}

	public String view() {
		if (id != null) {
			board = boardManager.get(id);
		} else {
			return INDEX;

		}
		return NONE;
	}

	public String update() throws Exception {
		Board old = boardManager.get(id);
		old.setName(board.getName());
		old.setDescription(board.getDescription());
		boardManager.save(old);
		saveMessage("修改成功");
		return LIST;
	}

	public String save() throws Exception {
		board.setAddTime(new Date());
		boardManager.save(board);
		saveMessage("添加成功");
		return LIST;
	}

	public BoardManager getBoardManager() {
		return boardManager;
	}

	public void setBoardManager(BoardManager boardManager) {
		this.boardManager = boardManager;
	}

	public List<Board> getBoards() {
		return boards;
	}

	public void setBoards(List<Board> boards) {
		this.boards = boards;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public BoardQueryBean getQueryBean() {
		return queryBean;
	}

	public void setQueryBean(BoardQueryBean queryBean) {
		this.queryBean = queryBean;
	}

}