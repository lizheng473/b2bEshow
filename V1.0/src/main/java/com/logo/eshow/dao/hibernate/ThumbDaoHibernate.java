package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ThumbQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ThumbDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Thumb;

public class ThumbDaoHibernate extends GenericDaoHibernate<Thumb, Integer>
		implements ThumbDao {

	public ThumbDaoHibernate() {
		super(Thumb.class);
	}

	public List<Thumb> list(ThumbQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Thumb> search(ThumbQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, ThumbQueryBean queryBean) {
		if (queryBean != null) {

			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.description != null) {
				rule.add(Restrictions.like("description",
						queryBean.description, MatchMode.ANYWHERE));
			}
			if (queryBean.model != null) {
				rule.add(Restrictions.like("model", queryBean.model));
			}

			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
