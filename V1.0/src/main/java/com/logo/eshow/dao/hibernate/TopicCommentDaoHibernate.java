package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.TopicCommentQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TopicCommentDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.TopicComment;

public class TopicCommentDaoHibernate extends
		GenericDaoHibernate<TopicComment, Integer> implements TopicCommentDao {

	public TopicCommentDaoHibernate() {
		super(TopicComment.class);
	}

	public List<TopicComment> list(TopicCommentQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<TopicComment> search(TopicCommentQueryBean queryBean,
			int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule,
			TopicCommentQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.addTime != null) {
				rule.add(Restrictions.eq("addTime", queryBean.addTime));
			}
			if (queryBean.name != null) {
				rule.add(Restrictions.eq("name", queryBean.name));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.eq("content", queryBean.content));
			}
			if (queryBean.ip != null) {
				rule.add(Restrictions.eq("ip", queryBean.ip));
			}
			if (queryBean.topicId != null) {
				rule.add(Restrictions.eq("topic.id", queryBean.topicId));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
			if (queryBean.boardId != null) {
				rule.add(Restrictions.eq("topic.board.id", queryBean.boardId));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
