package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.PhotoQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.PhotoDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Photo;

public class PhotoDaoHibernate extends GenericDaoHibernate<Photo, Integer>
		implements PhotoDao {

	public PhotoDaoHibernate() {
		super(Photo.class);
	}

	public List<Photo> list(PhotoQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Photo> search(PhotoQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, PhotoQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.like("content", queryBean.content,
						MatchMode.ANYWHERE));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
			if (queryBean.albumId != null) {
				rule.add(Restrictions.eq("album.id", queryBean.albumId));
			}
			if (queryBean.albumIds != null) {
				String[] albumIds = StringUtils.split(queryBean.albumIds, ",");
				Integer[] bytes = new Integer[albumIds.length];
				for (int i = 0; i < albumIds.length; i++) {
					bytes[i] = Integer.valueOf(albumIds[i].trim());
				}
				rule.add(Restrictions.in("album.id", bytes));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;
	}
}
