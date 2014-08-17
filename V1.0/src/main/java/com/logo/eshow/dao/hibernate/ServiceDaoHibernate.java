package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ServiceQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ServiceDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Service;

public class ServiceDaoHibernate extends GenericDaoHibernate<Service, Integer>
		implements ServiceDao {

	public ServiceDaoHibernate() {
		super(Service.class);
	}

	public List<Service> list(ServiceQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Service> search(ServiceQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, ServiceQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.addTime != null) {
				rule.add(Restrictions.eq("addTime", queryBean.addTime));
			}
			if (queryBean.updateTime != null) {
				rule.add(Restrictions.eq("updateTime", queryBean.updateTime));
			}
			if (queryBean.title != null) {
				rule.add(Restrictions.eq("title", queryBean.title));
			}
			if (queryBean.content != null) {
				rule.add(Restrictions.eq("content", queryBean.content));
			}
			if (queryBean.sequence != null) {
				rule.add(Restrictions.eq("sequence", queryBean.sequence));
			}
			if (queryBean.serviceTypeId != null) {
				rule.add(Restrictions.eq("serviceType.id",
						queryBean.serviceTypeId));
			}
			if (queryBean.userId != null) {
				rule.add(Restrictions.eq("user.id", queryBean.userId));
			}
		}
		return rule;
	}
}
