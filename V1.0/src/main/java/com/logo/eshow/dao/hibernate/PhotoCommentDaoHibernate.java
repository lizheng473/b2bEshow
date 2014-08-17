package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.PhotoCommentQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.PhotoCommentDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.PhotoComment;

public class PhotoCommentDaoHibernate extends
		GenericDaoHibernate<PhotoComment, Integer> implements PhotoCommentDao {

	public PhotoCommentDaoHibernate() {
		super(PhotoComment.class);
	}
	
	public List<PhotoComment> list(PhotoCommentQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<PhotoComment> search(PhotoCommentQueryBean queryBean,
			int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule,
			PhotoCommentQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.photoId != null) {
				rule.add(Restrictions.eq("photo.id", queryBean.photoId));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
		}
		return rule;
	}
}
