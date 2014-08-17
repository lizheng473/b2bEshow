package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.TwitterCommentQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.TwitterCommentDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.TwitterComment;

public class TwitterCommentDaoHibernate extends
		GenericDaoHibernate<TwitterComment, Integer> implements
		TwitterCommentDao {

	public TwitterCommentDaoHibernate() {
		super(TwitterComment.class);
	}

	public List<TwitterComment> list(TwitterCommentQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<TwitterComment> search(TwitterCommentQueryBean queryBean,
			int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule,
			TwitterCommentQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.twitterId != null) {
				rule.add(Restrictions.eq("twitter.id", queryBean.twitterId));
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
