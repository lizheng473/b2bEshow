package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ThumbImgQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ThumbImgDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.ThumbImg;

public class ThumbImgDaoHibernate extends
		GenericDaoHibernate<ThumbImg, Integer> implements ThumbImgDao {

	public ThumbImgDaoHibernate() {
		super(ThumbImg.class);
	}

	public List<ThumbImg> list(ThumbImgQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<ThumbImg> search(ThumbImgQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, ThumbImgQueryBean queryBean) {
		if (queryBean != null) {

			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.height != null) {
				rule.add(Restrictions.eq("height", queryBean.height));
			}
			if (queryBean.img != null) {
				rule.add(Restrictions.like("img", queryBean.img,
						MatchMode.ANYWHERE));
			}
			if (queryBean.origImg != null) {
				rule.add(Restrictions.like("origImg", queryBean.origImg,
						MatchMode.ANYWHERE));
			}
			if (queryBean.width != null) {
				rule.add(Restrictions.eq("width", queryBean.width));
			}
			if (queryBean.enabled != null) {
				rule.add(Restrictions.eq("enabled", queryBean.enabled));
			}

			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
