package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TopicDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Topic;

public class TopicDaoHibernate extends GenericDaoHibernate<Topic, Integer>
		implements TopicDao {

	public TopicDaoHibernate() {
		super(Topic.class);
	}

	public List<Topic> list(TopicQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Topic> search(TopicQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, TopicQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.addTime != null) {
				rule.add(Restrictions.eq("addTime", queryBean.addTime));
			}
			if (queryBean.updateTime != null) {
				rule.add(Restrictions.eq("updateTime", queryBean.updateTime));
			}
			if (queryBean.title != null) {
				rule.add(Restrictions.eq("title", queryBean.title));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.eq("content", queryBean.content));
			}
			if (queryBean.state != null) {
				rule.add(Restrictions.eq("state", queryBean.state));
			}
			if (queryBean.tip != null) {
				rule.add(Restrictions.eq("tip", queryBean.tip));
			}
			if (queryBean.boardId != null) {
				rule.add(Restrictions.eq("board.id", queryBean.boardId));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
