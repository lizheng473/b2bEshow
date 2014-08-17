package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.AlbumQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.AlbumDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Album;

public class AlbumDaoHibernate extends GenericDaoHibernate<Album, Integer>
		implements AlbumDao {

	public AlbumDaoHibernate() {
		super(Album.class);
	}

	public List<Album> list(AlbumQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Album> search(AlbumQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, AlbumQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.like("name", queryBean.name,
						MatchMode.ANYWHERE));
			}
			if (queryBean.description != null) {
				rule.add(Restrictions.like("description",
						queryBean.description, MatchMode.ANYWHERE));
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
