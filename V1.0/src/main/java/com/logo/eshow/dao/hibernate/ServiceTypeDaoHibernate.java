package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ServiceTypeQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ServiceTypeDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.ServiceType;

public class ServiceTypeDaoHibernate extends
		GenericDaoHibernate<ServiceType, Integer> implements ServiceTypeDao {

	public ServiceTypeDaoHibernate() {
		super(ServiceType.class);
	}

	public List<ServiceType> list(ServiceTypeQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<ServiceType> search(ServiceTypeQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule,
			ServiceTypeQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.eq("name", queryBean.name));
			}
			if (queryBean.remark != null) {
				rule.add(Restrictions.eq("remark", queryBean.remark));
			}
			if (queryBean.sequence != null) {
				rule.add(Restrictions.eq("sequence", queryBean.sequence));
			}
		}
		return rule;
	}
}
