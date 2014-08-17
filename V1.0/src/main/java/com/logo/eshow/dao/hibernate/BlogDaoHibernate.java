package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.BlogQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.BlogDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Blog;

public class BlogDaoHibernate extends GenericDaoHibernate<Blog, Integer>
		implements BlogDao {

	public BlogDaoHibernate() {
		super(Blog.class);
	}

	public Page<Blog> search(BlogQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public List<Blog> list(BlogQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, BlogQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.title != null) {
				rule.add(Restrictions.like("title", queryBean.title,
						MatchMode.ANYWHERE));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.count != null) {
				rule.add(Restrictions.eq("count", queryBean.count));
			}
			if (queryBean.categoryId != null) {
				rule.add(Restrictions.eq("category.id", queryBean.categoryId));
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
