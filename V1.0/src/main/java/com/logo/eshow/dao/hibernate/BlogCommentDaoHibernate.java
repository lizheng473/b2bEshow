package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.BlogCommentQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.BlogCommentDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.BlogComment;

public class BlogCommentDaoHibernate extends
		GenericDaoHibernate<BlogComment, Integer> implements BlogCommentDao {

	public BlogCommentDaoHibernate() {
		super(BlogComment.class);
	}

	public List<BlogComment> list(BlogCommentQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<BlogComment> search(BlogCommentQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule,
			BlogCommentQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.email != null) {
				rule.add(Restrictions.like("email", queryBean.email,
						MatchMode.ANYWHERE));
			}
			if (queryBean.im != null) {
				rule.add(Restrictions.like("im", queryBean.im,
						MatchMode.ANYWHERE));
			}
			if (queryBean.ip != null) {
				rule.add(Restrictions.like("ip", queryBean.ip,
						MatchMode.ANYWHERE));
			}
			if (queryBean.website != null) {
				rule.add(Restrictions.like("website", queryBean.website,
						MatchMode.ANYWHERE));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
			if (queryBean.blogId != null) {
				rule.add(Restrictions.eq("blog.id", queryBean.blogId));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
