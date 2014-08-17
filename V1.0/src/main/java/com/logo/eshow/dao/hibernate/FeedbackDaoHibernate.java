package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.FeedbackQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.FeedbackDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Feedback;

public class FeedbackDaoHibernate extends
		GenericDaoHibernate<Feedback, Integer> implements FeedbackDao {

	public FeedbackDaoHibernate() {
		super(Feedback.class);
	}

	public List<Feedback> list(FeedbackQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}
	
	public Page<Feedback> search(FeedbackQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, FeedbackQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.title != null) {
				rule.add(Restrictions.like("title", queryBean.title,
						MatchMode.ANYWHERE));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
