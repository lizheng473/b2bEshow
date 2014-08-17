package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.InfoQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.InfoDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Info;

public class InfoDaoHibernate extends GenericDaoHibernate<Info, Integer>
		implements InfoDao {

	public InfoDaoHibernate() {
		super(Info.class);
	}

	public List<Info> list(InfoQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Info> search(InfoQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, InfoQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.type != null) {
				rule.add(Restrictions.like("type", queryBean.type,
						MatchMode.ANYWHERE));
			}
			if (queryBean.title != null) {
				rule.add(Restrictions.like("url", queryBean.url,
						MatchMode.ANYWHERE));
			}
			if (queryBean.title != null) {
				rule.add(Restrictions.like("title", queryBean.title,
						MatchMode.ANYWHERE));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.enable != null) {
				rule.add(Restrictions.eq("enable", queryBean.enable));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}

}
